#!/usr/bin/env bash
# build_judges_edition.sh
# BOTB Judges Edition - macOS build, packaging and verification pipeline.
#
# This script REQUIRES macOS with Xcode 15+ (xcodebuild). It cannot run on
# Linux and was NOT executed in the delivery workspace; see BUILD_REPORT.md.
#
# Routes (choose one):
#   MODE=scaffold   Build the delivered Judges Edition scaffold as-is.
#                   The resulting app is clearly labelled "Judges Edition
#                   scaffold" - it is NOT presented as the modified original
#                   BOTB application.
#   MODE=integrate  Integrate the Judges Edition workflows into an authorized
#                   source project you own (pass SOURCE_PROJECT=/path/to/repo).
#                   Use this route only where you hold the source rights.
#
# Signing: intentionally NOT performed here. The project owner signs with
# their own credentials (see SIGNING_INSTRUCTIONS.md). The build produces an
# UNSIGNED app (CODE_SIGNING_ALLOWED=NO) suitable for later owner signing.

set -euo pipefail

MODE="${1:-scaffold}"
SOURCE_PROJECT="${SOURCE_PROJECT:-}"
OUT_DIR="${OUT_DIR:-$(pwd)/build_out}"
SCAFFOLD_DIR="$(cd "$(dirname "$0")/../ios/JudgesEdition" && pwd)"

log() { printf '\n==> %s\n' "$*"; }

precheck() {
    log "Pre-checks"
    [[ "$(uname -s)" == "Darwin" ]] || { echo "ERROR: macOS required"; exit 2; }
    command -v xcodebuild >/dev/null || { echo "ERROR: xcodebuild not found"; exit 2; }
    command -v zip >/dev/null || { echo "ERROR: zip not found"; exit 2; }
    command -v plutil >/dev/null || { echo "ERROR: plutil not found"; exit 2; }
    xcodebuild -version | head -2
}

generate_project() {
    log "Generating Xcode project (XcodeGen)"
    pushd "$SCAFFOLD_DIR" >/dev/null
    if command -v xcodegen >/dev/null; then
        xcodegen generate
    else
        echo "xcodegen not found; opening scaffold directly or generate via Xcode."
        echo "  brew install xcodegen && xcodegen generate"
        exit 2
    fi
    popd >/dev/null
}

build_scaffold() {
    log "Building Judges Edition scaffold (UNSIGNED)"
    mkdir -p "$OUT_DIR"
    local proj="$SCAFFOLD_DIR/BOTBJudgesEdition.xcodeproj"
    xcodebuild -project "$proj" \
        -scheme BOTBJudgesEdition \
        -configuration Release \
        -destination 'generic/platform=iOS' \
        -derivedDataPath "$OUT_DIR/DerivedData" \
        CODE_SIGNING_ALLOWED=NO CODE_SIGN_IDENTITY="" \
        build
    echo "$OUT_DIR/DerivedData/Build/Products/Release-iphoneos/BOTBJudgesEdition.app"
}

package_ipa() {
    local app_path="$1"
    log "Packaging IPA: $app_path"
    rm -rf "$OUT_DIR/Payload" "$OUT_DIR/BOTB_Judges_Edition.ipa"
    mkdir -p "$OUT_DIR/Payload"
    cp -R "$app_path" "$OUT_DIR/Payload/"
    (cd "$OUT_DIR" && zip -qyr BOTB_Judges_Edition.ipa Payload)
    rm -rf "$OUT_DIR/Payload"
}

verify_ipa() {
    local ipa="$1"
    log "Verifying IPA structure: $ipa"
    unzip -l "$ipa" | head -20
    unzip -l "$ipa" | grep -q 'Payload/.*\.app/Info.plist' \
        || { echo "FAIL: Info.plist missing from .app"; exit 3; }
    local tmp; tmp="$(mktemp -d)"
    unzip -q "$ipa" 'Payload/*.app/Info.plist' -d "$tmp"
    plutil -lint "$tmp"/Payload/*.app/Info.plist \
        || { echo "FAIL: Info.plist lint"; exit 3; }
    local bid; bid="$(plutil -extract CFBundleIdentifier raw "$tmp"/Payload/*.app/Info.plist)"
    local ver; ver="$(plutil -extract CFBundleShortVersionString raw "$tmp"/Payload/*.app/Info.plist)"
    echo "Bundle identifier : $bid"
    echo "Bundle version    : $ver"
    rm -rf "$tmp"
}

hashes() {
    log "SHA-256 of build outputs"
    ( cd "$OUT_DIR" && shasum -a 256 BOTB_Judges_Edition.ipa ) | tee SHA256SUMS.txt
}

case "$MODE" in
    scaffold)
        precheck
        generate_project
        APP_PATH="$(build_scaffold)"
        package_ipa "$APP_PATH"
        verify_ipa "$OUT_DIR/BOTB_Judges_Edition.ipa"
        hashes
        ;;
    integrate)
        precheck
        [[ -d "$SOURCE_PROJECT" ]] || { echo "ERROR: SOURCE_PROJECT not set"; exit 2; }
        log "Integration route"
        echo "Integrating Judges Edition workflows into: $SOURCE_PROJECT"
        echo "Requirements for the authorized source project owner:"
        echo "  1. Copy CoordinateEngine.swift, AuthGate.swift, AssessmentModels.swift,"
        echo "     RecordsStore.swift, CrosshairOverlay.swift, JudgeSubmissionView.swift,"
        echo "     MultiJudgeCompareView.swift, AIProposalView.swift into the target app."
        echo "  2. Replace participant-facing entry views with AuthGate + MainTabView."
        echo "  3. Keep the original app's bundle identifier unless you have the"
        echo "     right to issue a new one."
        echo "  4. Run the regression suite from this package against the ported engine."
        echo ""
        echo "This script does not perform the copy automatically: integration into"
        echo "someone else's code must be done by the rights holder themselves."
        ;;
    *)
        echo "Usage: $0 [scaffold|integrate]"; exit 1
        ;;
esac

log "Done. Signing: see SIGNING_INSTRUCTIONS.md (owner performs signing)."
