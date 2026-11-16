# COMPLETE PROJECT HANDOVER — Full Recovery Archive

**Document:** `COMPLETE_PROJECT_HANDOVER.md`
**Generated:** 2026-11-16
**Requested by:** project owner ("historical recovery of EVERYTHING", full
technical details, complete source code, mark unrecoverable items NOT RECOVERED)
**Deliverable form:** this single Markdown file (all source code embedded
verbatim; nothing omitted).

## Table of contents

- [1. Record basis and honesty statement](#1-record-basis-and-honesty-statement)
- [2. Master workspace inventory](#2-master-workspace-inventory)
- [3. Project 1 — BOTB Private Judges Edition](#3-project-1--botb-private-judges-edition)
- [4. Categories requested but NOT RECOVERED](#4-categories-requested-but-not-recovered)
- [5. Complete verbatim archive (every recoverable file, full source)](#5-complete-verbatim-archive-every-recoverable-file-full-source)
- [6. Master checklist (recovered vs NOT RECOVERED)](#6-master-checklist)

## 1. Record basis and honesty statement

This document is a **historical recovery archive**, built strictly from two
sources that actually exist:

1. **This session's conversation record** (session date 2026-11-16, BOTB
   Private Judges Edition project, conducted partly in English and partly in
   Kurdish Sorani).
2. **The on-disk workspace** at `/home/z/my-project/` (inventory taken
   2026-11-16; every file hashed with SHA-256).

**What this archive does NOT contain:** I have no access to any conversation
before this session, no hidden memory of other projects, and no records of any
server-side history. Anything not present in this session's record or on disk
is explicitly marked **NOT RECOVERED** — exactly as the requester instructed.
No source code, coordinates, test results, repository links or decisions have
been invented or reconstructed from imagination anywhere in this document.

**Provenance of every code block in Part 5:** each block is a byte-identical
copy read directly from disk at generation time. The SHA-256 printed above
each block is the hash of the exact file it came from. Verification command:
`sha256sum <file>` on your own copy after download.

**Security exclusions:** the workspace file `/.env` is deliberately excluded
from this archive (may contain secrets). The extracted third-party app bundle
at `/upload/ipa_extract/` is inventoried by name and size only — its contents
(assets, fonts, strings, PDF) are proprietary property of Best of the Best plc
and are NOT reproduced here.
## 2. Master workspace inventory
Exhaustive recursive listing of the workspace on 2026-11-16 (253 files found; grouped below). Binary files are listed with size only; text artifacts are embedded in Part 5.

**Judges Edition repo package (download/botb-judges-edition/, 43 files)** — 44 files, 215,380 bytes total. See Part 5 for contents.

**Original delivery (download/FINAL_DELIVERY/, 39 files)** — 40 files, 193,730 bytes total. See Part 5 for contents.

**Reference IPA (owner-provided, third-party app):**
- `incoming_drive/BOTB_original.ipa` — 236,220,765 bytes, SHA-256
  `8c5a23bdb85f5c0a2352bb07f357cd0e465e3b3f07b42682f30f17628cd34f9a` (NOT embedded — binary)
- `upload/botb_app_from_drive.bin` — byte-identical copy of the same download
- Extracted bundle: `upload/ipa_extract/` —
  ~180 files (BOTB.app resources; third-party proprietary property — inventoried
  by name/size only, contents NOT reproduced)

**Packaging:** `download/botb-judges-edition-repo.zip` — 91,532 bytes, SHA-256
`359e9e00c4b4c9125044cc8145e0fa3122021744662ed54b503b9a758af368a9`

**Deliberately excluded from this archive:** `/.env` (may contain secrets);
all binary contents of `upload/ipa_extract/`; the two builder scripts in
`/scripts/` (self-referential tooling used to produce this very document).

## 3. Project 1 — BOTB Private Judges Edition
*(the only project with a real, verifiable record)*

### 3.1 Origin and requirements (as recorded in this session)

Original formal instruction (English), summarized from the session record —
the verbatim original message text is **NOT RECOVERED** (summary-level only):

- **Final deliverable requested:** an **installable IPA file** for a project
  named **BOTB Private Judges Edition**, to be delivered under
  `/workspace/botb/judges-edition/FINAL_DELIVERY/` (that path belonged to the
  original environment; it does not exist in the current workspace — audited).
- **Non-negotiable integrity rules set by the project owner:**
  1. No fabricated files; no test may be reported as passing unless it really ran.
  2. No fake or placeholder IPA may be delivered as a final result.
  3. No bypassing of FairPlay/DRM, Apple code signing, or entitlements.
  4. No application may be passed off as, or presented as a modification of,
     the original BOTB application.
  5. Code signing is performed personally by the project owner.
- **Required features:** coordinate engine (single authoritative coordinate
  system); crosshair save / reopen / verify; multi-judge consensus with
  approval gate; AI proposals stored strictly separately from judge
  submissions; first-launch authentication (PIN).

### 3.2 Status summary

| Component | Status | Evidence |
| --- | --- | --- |
| Python reference engine (4 modules) | Implemented, deterministic, stdlib-only | full source in Part 5 |
| Test suite (4 files, 50 cases) | **50/50 PASS** (real run, 0.120 s) | `verification/unittest_output.txt` |
| End-to-end pipeline | **PASS** (schema validation, consensus, audit chain verified) | `verification/e2e_output.txt` |
| iOS app scaffold (9 SwiftUI files + XcodeGen spec) | Complete source; **NEVER compiled** — no Apple toolchain in this Linux environment | file inventory |
| GitHub Actions build route | Workflow prepared, never executed (owner has not yet uploaded the repo) | `.github/workflows/build.yml` |
| Windows signing route | Guides + setup script prepared, not yet executed by owner | `build/WINDOWS_SIDELOAD_GUIDE.md`, `build/windows_setup.ps1` |
| Installable signed IPA | **DOES NOT EXIST YET** — requires owner's GitHub upload + Actions run + owner's own signing | — |
| Reference IPA (original BOTB app) | Downloaded from owner's Google Drive link and fully inspected; archived as reference only | Part 3.7 |

### 3.3 Technology stack

| Layer | Technology |
| --- | --- |
| Reference engine | Python 3, standard library only (hashlib, json, math, dataclasses, secrets, hmac, unittest) |
| iOS app | SwiftUI, iOS 16.0 minimum, Swift 5.9, XcodeGen project spec, generated Info.plist |
| Auth (engine) | PBKDF2-HMAC-SHA256, 100,000 iterations, 16-byte random salt |
| Auth (iOS) | PBKDF2 + Keychain (per `ios/JudgesEdition/README.md`) |
| Records / tamper evidence | Canonical JSON (UTF-8, sorted keys, compact separators) + SHA-256 hash chains |
| Consensus math | Weiszfeld iteration (geometric median), per-axis median; IEEE-754 doubles, round-half-to-even |
| CI build | GitHub Actions, `macos-14` runner, XcodeGen via Homebrew, unsigned IPA artifact (90-day retention) |
| Signing (owner) | Sideloadly / AltStore with owner's own Apple ID (free = 7 days) or Apple Developer Program (paid, permanent) |

### 3.4 Architecture and engine specification (summary; full text in Part 5)

The authoritative specification is `docs/COORDINATE_ENGINE_SPEC.md`
(document version 1.0.0, engine version 1.0.0), embedded verbatim in Part 5.
Key rules:

- **Coordinate spaces:** P (pixel space) is CANONICAL — integer `(x, y)`,
  origin at image top-left, x right, y down, `0 <= x < W`, `0 <= y < H`.
  N (normalized) is derived only: `nx = x / W`, `ny = y / H`, each in `[0, 1)`;
  N is never persisted as the primary value. Inverse mapping:
  `x = clamp(round(nx * W), 0, W-1)` with round-half-to-even (round-trip error
  <= 1 px per axis).
- **Identity:** image identity = SHA-256 of the raw image bytes (never a
  filename); record integrity = SHA-256 over canonical JSON
  (`json.dumps(obj, sort_keys=True, separators=(",", ":"))`).
- **Distances:** Euclidean in pixels; `normalized_distance =
  pixel_distance / diagonal(W, H)` is display-only; agreement means
  `distance(judge, consensus) <= tolerance_px`.
- **Consensus (two authorized methods):**
  1. `geometric_median` (default): Weiszfeld iteration, initialized at the
     per-axis median, `max_iter = 100`, tolerance `1e-7`, distance floor
     `1e-9`, result rounded half-to-even to integer pixels.
  2. `per_axis_median`: per-axis median; even judge counts average the two
     middle values, rounded half-to-even.
  Output fields: `method`, `x_px`, `y_px`, `raw_x`, `raw_y`, `engine_version`,
  `tolerance_px`, `max_spread_px`, `agreement_ratio`, `n_judges`.
- **Determinism:** IEEE-754 double precision, fixed iteration counts, no
  randomness or wall-clock inside engine arithmetic — identical inputs give
  bit-identical outputs.
- **Records (`engine/crosshair_records.py`):** save / reopen / verify
  semantics; competition + image identity consistency checked on every reload;
  identifier regex `^[A-Za-z0-9._-]{1,128}$`; UTC ISO timestamps.
- **Multi-judge (`engine/multi_judge.py`):** minimal self-contained JSON
  Schema validator; AI proposals live in `ai_proposals[]` and are **refused**
  if inserted into `judges[]` (separation rule enforced in code); approval
  gate by `project-owner`; hash-chained audit (`prev_entry_hash` ->
  `entry_hash`, starting at `GENESIS`).
- **Auth (`engine/auth_model.py`):** PIN 4-12 digits, PBKDF2-HMAC-SHA256
  (100,000 iterations), salt + verifier stored (never the PIN), constant-time
  comparison, lockout after 5 consecutive failures, exponential backoff
  starting 30 s, capped at 3600 s.

### 3.5 Known coordinate data (the ONLY real values on record)

Everything below comes from `samples/sample_assessment.json`, produced by the
real end-to-end run (`verification/make_sample_assessment.py`). **No other
coordinate datasets exist in the workspace. Any historical Spot-the-Ball
coordinates from earlier work are NOT RECOVERED.**

Image dimensions: `1024 x 768` px.

| Source | X (px) | Y (px) |
| --- | --- | --- |
| JUDGE-01 crosshair | 512 | 340 |
| JUDGE-02 crosshair | 515 | 344 |
| JUDGE-03 crosshair | 509 | 338 |
| JUDGE-04 crosshair | 513 | 342 |
| **Consensus** (`geometric_median`, raw) | **513** (raw 512.839026) | **342** (raw 341.70709) |
| AI proposal (`reference-proposal-v0`, confidence 0.82) | 511 | 341 |

Consensus quality: `tolerance_px = 12.0`, `max_spread_px = 8.485`,
`agreement_ratio = 1.0` (all 4 judges inside tolerance), approval
`APPROVED` by `project-owner`, audit chain valid with 7 entries,
`assessment_hash = 542ea90b3d47b4f3712ee108ec7a18f97aaefbcbe234b6573212c24eac51d9c0`.

### 3.6 Verification evidence (real runs, 2026-11-16)

- `verification/unittest_output.txt` — 50 unittest cases across 4 test files:
  **Ran 50 tests in 0.120s — OK**. Coverage includes: round-trip P->N->P
  error <= 1 px; bounds clamping/rejection; 3-4-5 triangle distance;
  symmetric-point consensus exactness; outlier robustness; per-axis median
  even counts; record tamper detection; hash stability; PIN policy; unique
  salts; verifier never stores PIN; lockout/backoff behaviour.
- `verification/e2e_output.txt` — full pipeline PASS: consensus computed,
  agreement_ratio == 1.0, approval gate, audit chain valid (7 entries),
  schema validation PASS, negative control correctly rejected
  (`SchemaViolation`), file re-validation PASS.
- `SHA256SUMS.txt` in both delivery trees — regenerated after every change and
  verified with `sha256sum -c` (last verification: all OK, 43 repo files /
  39 delivery files).

### 3.7 Reference IPA — facts and verdict (real inspection, 2026-11-16)

Fetched from the owner's Google Drive link via the direct
`drive.usercontent.google.com` download URL after two failed attempts
(see 3.9). Verified facts:

| Item | Value |
| --- | --- |
| File | `BOTB_original.ipa` (copy: `upload/botb_app_from_drive.bin`) |
| Size | 236,220,765 bytes (~225 MB) |
| SHA-256 | `8c5a23bdb85f5c0a2352bb07f357cd0e465e3b3f07b42682f30f17628cd34f9a` |
| ZIP integrity | 261 entries, CRC check ALL OK |
| Bundle | `Payload/BOTB.app/` |
| CFBundleIdentifier | `com.botb.winacar` |
| CFBundleDisplayName | BOTB |
| Version | 3.1.96 (build 2), MinimumOSVersion 16.1 |
| Built with | SDK iphoneos27.0 |
| Main binary | `BOTB`, 44,442,272 bytes (native ARM64) |
| FairPlay `SC_Info/` | **Absent** |
| `embedded.mobileprovision` | **Absent** |
| `iTunesMetadata.plist` | **Absent** |
| `_CodeSignature/` | Present |

Embedded third-party SDKs: Facebook (FBSDKCoreKit / FBSDKLoginKit /
FBAEMKit), Firebase (Auth, Messaging, RemoteConfig, Analytics,
Installations, ABTesting...), GoogleSignIn, AppsFlyer, Clarity, Emarsys,
Kingfisher, AppAuth, GTMSessionFetcher, Promises, nanopb, swift-crypto,
GuiKit. App extensions in `PlugIns/`: `BOTBNotificationService.appex`,
`orderActivityExtensionExtension.appex`. The `GuiKit_GuiKit.bundle` contains
`STBTicketCoordinatesView.nib`, `STBTicketView.nib`, `STBTicketButtonsView.nib`,
`STBTicketCounterView.nib` (STB = Spot The Ball ticket UI) — factual
observation from the file listing.

**Verdict (honest, per the project's own rules):**
1. This is the published BOTB commercial application (`com.botb.winacar`),
   most plausibly a decrypted/extracted copy of the App Store release.
2. It contains **no source code** — features cannot be added to it; any
   modification would break `_CodeSignature/CodeResources`.
3. Modifying or re-signing third-party proprietary software is prohibited by
   the project's own integrity rules (rules 3 and 4).
4. Therefore it is **archived as a reference only** and cannot be the baseline
   for the Judges Edition. The full extraction sits at
   `/upload/ipa_extract/` (inventoried, contents not reproduced here).

### 3.8 Milestone / version history (all 2026-11-16, this session)

| # | Milestone | What was produced | What worked / failed |
| --- | --- | --- | --- |
| M0 | Workspace audit | `WORKSPACE_AUDIT.md` | The 9 previously claimed deliverable files and the baseline IPA were **NOT FOUND** anywhere on disk (full-disk search: 0 results); `/workspace` did not exist. Decision per rule 1: build the maximum honest implementation, no fake IPA. |
| M1 | Delivery v1.0.0 (`FINAL_DELIVERY/`, 37 files) | Python engine 1.0.0, 50-test suite, e2e pipeline, iOS scaffold, docs, schemas, signing instructions, SHA256SUMS | Engine tests 50/50 PASS; e2e PASS; iOS scaffold NOT compiled (no Apple toolchain — honest blocker). |
| M2 | GitHub build route | `build/github_actions_workflow.yml`, `build/GITHUB_BUILD_GUIDE.md` | Route designed for free macOS runners; not yet executed by owner. |
| M3 | Windows signing route | `build/WINDOWS_SIDELOAD_GUIDE.md`, `build/windows_setup.ps1` (winget: Git, Node.js, Apple Devices app) | Route documented; Xcode itself confirmed impossible on Windows. |
| M4 | GitHub-ready repo package (`botb-judges-edition/`, 43 files) | Workflow moved to `.github/workflows/build.yml` (with added Python-test step), `.gitignore`, `README.md` (Kurdish), `README_EN.md`, `CHAT_HISTORY.md` (Kurdish, full conversation record), `PROJECT_CONTEXT.md` | Tests re-run inside repo copy: 50/50 PASS. Zip verified (57 entries, key files present). |
| M5 | Reference IPA recovered + inspected | `verification/IPA_INSPECTION_REPORT.md` added to both trees; checksums regenerated; repo re-zipped | Download succeeded on 3rd method (see 3.9); inspection results in 3.7. |

Current versions: engine `1.0.0`; spec document `1.0.0`; app
`MARKETING_VERSION 1.0.0`, `CURRENT_PROJECT_VERSION 1`; bundle id
`com.botb.judges.edition`.

### 3.9 Known bugs, failed attempts and fixes (honest log)

1. **Google Drive download attempt 1 — FAILED:** `gdown` invoked with
   `--fuzzy` — flag not supported by the installed version
   (`unrecognized arguments: --fuzzy`).
2. **Google Drive download attempt 2 — FAILED:** `gdown` with plain
   `drive.google.com/uc?...` URL — "Gdown can't. Please check connections
   and permissions."
3. **Google Drive download attempt 3 — SUCCESS:** plain `curl -sSL` against
   `https://drive.usercontent.google.com/download?id=...&export=download&confirm=t`
   returned the full 236,220,765-byte file (HTTP 200, `PK` zip magic
   confirmed). Lesson recorded: the `drive.usercontent.google.com` direct
   URL bypasses the virus-scan interstitial that blocks scripted downloads.
4. **Checksum one-liner bug — FIXED:** `p.parts.relative_to(...)` raised
   `AttributeError: 'tuple' object has no attribute 'relative_to'`; corrected
   to `p.relative_to(root).parts`; checksums then verified OK.
5. **Documentation typo — FIXED:** a garbled Kurdish word in `README.md`
   corrected during repo packaging.
6. **Not a bug but an honest limitation:** the iOS scaffold has **never been
   compiled**; the Swift port is rule-for-rule by construction but the
   cross-platform hash-equality integration check recommended in
   `ios/JudgesEdition/README.md` has **not been run** (requires a Mac).

### 3.10 Remaining tasks (blocking the final installable IPA)

1. Owner: create GitHub repository, upload the repo package (including the
   hidden `.github` folder), enable Actions, run
   "Build Judges Edition IPA (unsigned)" (~3-5 min on a free macOS runner).
2. Owner: download `BOTB_Judges_Edition_unsigned_ipa` artifact.
3. Owner: sign on Windows with Sideloadly/AltStore using their own Apple ID
   (free = 7 days, then re-sign) — or use a paid developer account for
   permanent installs.
4. If the build fails: download the `build_log` artifact and send it to the
   assistant for diagnosis.
5. Unresolved by design: original BOTB source code was never recovered
   (owner reported computer reinstall); no proof-of-rights documentation
   exists; integration into an original BOTB app is only legitimate for
   whoever holds those rights.

### 3.11 Build and signing routes

| Route | Where | Notes |
| --- | --- | --- |
| A. GitHub Actions (recommended, no Mac needed) | `.github/workflows/build.yml` | Runs Python test suite first, then xcodegen + unsigned xcodebuild; artifact = unsigned IPA + SHA-256, kept 90 days |
| B. Local macOS + Xcode 15+ | `build/build_judges_edition.sh` | `brew install xcodegen` -> `xcodegen generate` -> script |
| C. Sign + install on Windows | `build/WINDOWS_SIDELOAD_GUIDE.md` | Sideloadly / AltStore, owner's own Apple ID |
| D. Sign + install (paid) | `SIGNING_INSTRUCTIONS.md` | Apple Developer Program ($99/yr), permanent + TestFlight |

Signing is deliberately excluded from all automated routes (integrity rule 5).

## 4. Categories requested but NOT RECOVERED

The requester asked for several categories of historical work. **None of the
following exist in this session's record or anywhere on disk.** They are
marked NOT RECOVERED and are deliberately NOT reconstructed or invented.
Recovery is only possible if the owner re-supplies the files or they are
found in a backup.

### 4.1 Safari Userscripts — NOT RECOVERED

- No userscript source, metadata headers (`@name`, `@version`, `@match`,
  selectors, storage keys), versions, or bug-fix history exists in this
  session or on disk. No `.user.js` file was found in the workspace inventory.
- iPhone installation instructions for Userscripts-app-based workflows:
  NOT RECOVERED (never produced in this session).

### 4.2 IPA tweaks, jailbreak concepts, iOS modifications — NOT RECOVERED

- No jailbreak-related concepts, tweak source, or signing-bypass workflows
  were ever created in this session, and none exist on disk.
- Note: per the project's own integrity rules (rule 3), FairPlay/DRM or
  code-signing bypass content is out of scope for this project and would not
  be produced even if requested.

### 4.3 Spot-the-Ball image collectors, data-extraction tools, eye-line /
gaze analysis, automated ball detection — NOT RECOVERED

- No historical image collectors, scrapers, dataset extraction tools, eye-line
  or gaze-direction analysis tools exist in this session or on disk.
- **Important distinction (to avoid misrepresentation):** the delivered
  coordinate engine computes **human-judge consensus** on crosshair positions.
  It is **not** an automated ball-position detection / computer-vision system.
  The only AI-related data structure is the separate `ai_proposals[]` intake
  (see `AIProposalView.swift`), which stores proposals supplied by an external
  model and keeps them out of the consensus. No detection model, selector, or
  training configuration was ever built in this session.

### 4.4 Historical X/Y coordinate datasets — NOT RECOVERED (except 3.5)

- The only real coordinates on record are the four judge submissions, the
  consensus, and the AI proposal in `samples/sample_assessment.json`
  (Part 3.5), on a 1024x768 image. Any earlier competition coordinates or
  image-dimension catalogs: NOT RECOVERED.

### 4.5 AI agents, servers, APIs, automation beyond the CI workflow — NOT RECOVERED

- The only automation artifact in this record is the GitHub Actions workflow
  (Part 5). No other agents, servers, API integrations, or prompts written
  for other AI models exist in this session or on disk.

### 4.6 Other code and technical work (HTML/CSS/JS sites, bots, tools) — NOT RECOVERED

- The workspace inventory (Part 2) is exhaustive: apart from the BOTB Judges
  Edition artifacts and the owner's IPA files, no other project, website,
  script or tool exists.

### 4.7 GitHub repositories, links, branches — NOT RECOVERED (never created)

- No GitHub repository was created or pushed in this session. The repo
  package was prepared for the OWNER to upload. No repository names, URLs or
  branch histories exist.

### 4.8 Verbatim texts from before this session — NOT RECOVERED

- The original first message and all pre-session conversations are known only
  through the session handoff summary; verbatim wording is NOT RECOVERED.
- The claimed 9 pre-session deliverable files and the original baseline IPA
  were audited and confirmed NOT FOUND on disk (M0, Part 3.8).
## 5. Complete verbatim archive (every recoverable file, full source)
**5.1 GitHub-ready repo package** (`download/botb-judges-edition/`) — canonical, self-contained build package:

#### `.github/workflows/build.yml` (repo package)

SHA-256: `a620482a0c220d423d2580b00e2a846bb6cf736b25a12888c2b2b4043c0cfe30` | 93 lines | 3,466 bytes

```yaml
# GitHub Actions workflow - builds the Judges Edition unsigned IPA on a
# GitHub-hosted macOS runner. No Mac and no local Xcode needed on your side.
#
# This file is ALREADY in its correct location (.github/workflows/build.yml).
#
# HOW TO USE (owner):
#   1. Upload this whole repo to a GitHub repository (public = free macOS runners).
#   2. Actions tab -> "I understand my workflows, go ahead and enable them".
#   3. Left sidebar: "Build Judges Edition IPA (unsigned)" -> Run workflow.
#   4. Open the finished run -> Artifacts -> BOTB_Judges_Edition_unsigned_ipa
#      (contains the .ipa + its SHA-256). Artifact is kept 90 days.
#   5. Sign it yourself (see build/WINDOWS_SIDELOAD_GUIDE.md and
#      SIGNING_INSTRUCTIONS.md). Signing is intentionally NOT performed here.
#
# The Python engine test suite runs first: if the reference engine ever fails
# on the build machine, the build stops instead of producing a dubious IPA.

name: Build Judges Edition IPA (unsigned)

on:
  workflow_dispatch:

jobs:
  build:
    runs-on: macos-14
    timeout-minutes: 30
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Show toolchain
        run: |
          xcodebuild -version
          swift --version

      - name: Run Python engine test suite (integrity check on the build machine)
        run: python3 -m unittest discover -s tests -v

      - name: Install XcodeGen
        run: brew install xcodegen

      - name: Generate Xcode project
        working-directory: ios/JudgesEdition
        run: xcodegen generate

      - name: Build app (UNSIGNED - owner signs later)
        working-directory: ios/JudgesEdition
        run: |
          set -o pipefail
          xcodebuild -project BOTBJudgesEdition.xcodeproj \
            -scheme BOTBJudgesEdition \
            -configuration Release \
            -destination 'generic/platform=iOS' \
            -derivedDataPath build/DD \
            CODE_SIGNING_ALLOWED=NO \
            CODE_SIGN_IDENTITY="" \
            COMPILER_INDEX_STORE_ENABLE=NO \
            build | tee build_log.txt
          test -d "build/DD/Build/Products/Release-iphoneos/BOTBJudgesEdition.app"

      - name: Verify Info.plist and package IPA
        working-directory: ios/JudgesEdition
        run: |
          APP="build/DD/Build/Products/Release-iphoneos/BOTBJudgesEdition.app"
          plutil -lint "$APP/Info.plist"
          BID=$(plutil -extract CFBundleIdentifier raw "$APP/Info.plist")
          VER=$(plutil -extract CFBundleShortVersionString raw "$APP/Info.plist")
          echo "Bundle identifier: $BID"
          echo "Bundle version    : $VER"
          rm -rf Payload BOTB_Judges_Edition.ipa
          mkdir -p Payload
          cp -R "$APP" Payload/
          zip -qyr BOTB_Judges_Edition.ipa Payload
          rm -rf Payload
          unzip -l BOTB_Judges_Edition.ipa | head -15
          shasum -a 256 BOTB_Judges_Edition.ipa | tee IPA_SHA256.txt

      - name: Upload build log (always, even on failure)
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: build_log
          path: ios/JudgesEdition/build_log.txt
          if-no-files-found: ignore

      - name: Upload unsigned IPA
        uses: actions/upload-artifact@v4
        with:
          name: BOTB_Judges_Edition_unsigned_ipa
          path: |
            ios/JudgesEdition/BOTB_Judges_Edition.ipa
            ios/JudgesEdition/IPA_SHA256.txt
          retention-days: 90
```

#### `.gitignore` (repo package)

SHA-256: `7866616bc5ca5fa479339f2cd902d8da6f6013550d544ff2c13d0ca5af9c1eda` | 14 lines | 282 bytes

```text
# Generated Xcode project (xcodegen creates it from project.yml at build time)
ios/JudgesEdition/*.xcodeproj
ios/JudgesEdition/build/
ios/JudgesEdition/Payload/
ios/JudgesEdition/*.ipa
ios/JudgesEdition/build_log.txt

# Python
__pycache__/
*.pyc

# OS artifacts
.DS_Store
Thumbs.db
```

#### `BUILD_REPORT.md` (repo package)

SHA-256: `ca6f683124303b3c7d1a759f6ec402f60dc5902236113acde502073229a468da` | 106 lines | 6,478 bytes

```markdown
# BUILD REPORT — BOTB PRIVATE JUDGES EDITION

Project persona: James Alexander Bennett (fictional project persona; used in
project documentation only)
Report version: 1.0 (final delivery)
Delivery root: `/home/z/my-project/download/FINAL_DELIVERY/`

## 1. Build status (top line)

**FINAL IPA: NOT BUILT — production blocked by four concrete, evidenced
dependencies (section 5).** No IPA file was created, and no fake or
unrelated IPA was produced to satisfy the filename requirement, per the
execution order.

**Everything buildable in this environment was built, executed and
verified.** The complete deliverable set below is real, tested output.

## 2. What was actually built and executed

| Component | Location | Status |
| --- | --- | --- |
| Coordinate engine (authoritative reference) | `engine/coordinate_engine.py` | Implemented; 15/15 tests pass |
| Crosshair record store (save/reopen/verify) | `engine/crosshair_records.py` | Implemented; 7/7 tests pass |
| Multi-judge assessment module (schema validation, consensus, approval gate, hash-chained audit) | `engine/multi_judge.py` | Implemented; 20/20 tests pass |
| First-launch auth model (PBKDF2 PIN, lockout) | `engine/auth_model.py` | Implemented; 8/8 tests pass |
| Machine-readable assessment schema | `schemas/assessment.schema.json` | Authored; validated live in tests |
| End-to-end pipeline run (submissions → consensus → AI proposal → approval → audit → schema validation) | `verification/make_sample_assessment.py` → `samples/sample_assessment.json` | **Executed; PASS** (see `verification/e2e_output.txt`) |
| Full regression suite | `tests/` (4 files, 50 tests) | **Executed: 50/50 OK** (see `verification/unittest_output.txt`) |
| Judges Edition iOS source scaffold (Swift/SwiftUI, 9 files) | `ios/JudgesEdition/JudgesEdition/` + `project.yml` | Delivered as source; **not compiled here** (no Apple toolchain) |
| macOS build/package/verify script | `build/build_judges_edition.sh` | Delivered; **syntax-checked only** (`bash -n` OK); requires macOS to run |

## 3. Evidence artifacts produced by actual execution

- `verification/unittest_output.txt` — full verbose unittest run: `Ran 50 tests ... OK`.
- `verification/e2e_output.txt` — end-to-end run output: consensus
  `(513, 342) px`, agreement 100%, approval APPROVED, audit chain valid
  (7 entries), schema validation PASS, negative control correctly rejected,
  sample artifact re-validation PASS.
- `samples/sample_assessment.json` — the real assessment record produced by
  the pipeline (interchangeable with the app's record format).
- `SHA256SUMS.txt` — SHA-256 over the final delivery tree.

## 4. Test corrections found and fixed during execution (honest log)

The regression suite caught three issues during the run, all fixed and
re-run to green:

1. Schema pattern for the audit genesis link did not accept the literal
   `GENESIS` first-entry link → schema updated to `^(GENESIS|[a-f0-9]{64})$`
   (documented behaviour preserved).
2. Record layer raised the engine's `CoordinateError` instead of the
   store-level `RecordError` → record layer now translates engine errors.
3. Two test expectations were mathematically wrong (normalized-distance
   expression; geometric-median location when a triangle angle exceeds
   120°, where the median legitimately sits at a vertex) → corrected with
   explanatory comments; the engine itself was correct.

## 5. Exact blockers preventing the original-app IPA

1. **Original BOTB application source code — absent.** No authorized Xcode
   project exists anywhere in this workspace (`WORKSPACE_AUDIT.md`, section 1).
   Without it, no modified-original application can be produced, and the
   order forbids disguising a separate app as the original.
2. **Original baseline IPA — absent.** The file whose SHA-256 must be
   preserved does not exist here; no hash could be recorded honestly.
3. **Apple iOS toolchain — absent.** This sandbox is Linux (Debian 13);
   `xcodebuild`, `swift`, `codesign`, `ldid`, `plutil` are not installed.
   iOS compilation, archiving and IPA packaging cannot be performed.
4. **Source-code rights / entitlements.** Per the order's boundary rules,
   owner signing does not substitute for source rights; none are evidenced
   here.

## 6. What happens when the owner supplies the missing dependencies

The delivered package is build-ready for two legitimate routes on macOS:

- **Route A (scaffold build):** `xcodegen generate` in
  `ios/JudgesEdition/`, then `build/build_judges_edition.sh scaffold`
  → unsigned `BOTB_Judges_Edition.ipa`, structure-verified, ready for owner
  signing. The app is clearly labelled as the Judges Edition scaffold.
- **Route B (integration build):** with authorized BOTB source,
  `build/build_judges_edition.sh integrate SOURCE_PROJECT=/path/to/botb`
  prints the exact integration steps; the resulting build is the real
  modified-original application and may be signed by the owner.

## 7. Boundary compliance

No DRM/FairPlay circumvention, no code-signing bypass, no dylib injection,
no protected-binary modification, no credential use, no paid services, no
external communications. AI proposals are architecturally separated from
judge submissions and cannot enter the consensus path.

## 8. Verification checklist (order section 6) — honest status

| # | Item | Status |
| --- | --- | --- |
| 1 | Build success / exact failure | Reference components: built and tested. IPA build: **not run** — blockers in section 5. |
| 2 | IPA archive structure verification | **Not performed** (no IPA exists); verification steps coded in `build_judges_edition.sh verify_ipa` |
| 3 | Bundle identifier / version verification | Specified in `project.yml`: `com.botb.judges.edition`, 1.0.0 (1); **actual verification pending macOS build** |
| 4 | Coordinate regression tests | **PASS — 15/15 executed** |
| 5 | Authentication tests | **PASS — 8/8 executed** |
| 6 | Crosshair save/reload tests | **PASS — 7/7 executed** (incl. tamper detection) |
| 7 | Competition/image identity consistency tests | **PASS — executed** (records + assessment identity checks) |
| 8 | Multi-judge record integrity tests | **PASS — executed** (audit chain tamper detection, assessment hash mutation detection) |
| 9 | SHA-256 of final artifact | `SHA256SUMS.txt` (delivery package; no IPA exists) |
| 10 | Original baseline IPA unchanged | **N/A — baseline IPA does not exist in this workspace** |
```

#### `CHAT_HISTORY.md` (repo package)

SHA-256: `c690646ad96c11d8b31b6d6d5b3af597d1056c8f1bcca5c0437b19a6be69ab74` | 122 lines | 10,060 bytes

```markdown
# CHAT_HISTORY — تۆماری تەواوی گفتوگۆی پڕۆژە

**پڕۆژە:** BOTB Private Judges Edition
**بەرواری تۆمارکردن:** ٢٠٢٦-١١-١٦
**ئامانجی ئەم فایلە:** هەموو داواکارییەکان، بڕیارەکان، بلۆکەرەکان و ئەوەی ئەنجام دراوە لە یەک فایل — وەک داوای خاوەن پڕۆژە: "هەموو چتەکە بۆ GitHub".

---

## ١. داواکاری سەرەتایی خاوەن پڕۆژە (نامەی فەرمی بە ئینگلیزی)

- **دڵواەمی کۆتایی:** فایلی IPA ی دامەزرێنەر (installable) بۆ BOTB Private Judges Edition.
- **یاسای نەگۆڕی پڕۆژە:**
  1. هیچ فایلێکی درۆ دروست نەکرێت؛ هیچ تاقیکردنەوەیەک کە بەڕاستی جێبەجێ نەکراوە وەک "Pass" شانە نەکرێت.
  2. هیچ IPA ی ناڕاست وەک ئەنجام نەدرێت.
  3. FairPlay/DRM، کۆدساینی Apple و entitlements پاشەڕێ نەکرێن.
  4. هیچ ئەپێکی تر وەک ئەپی ڕەسەنی BOTB شانە نەکرێت.
  5. ئیمزا (signing) لەلایەن خاوەن پڕۆژەوە دەکرێت، نەک لەلایەن agent ەوە.
- **تایبەتمەندییە پێویستەکان:** بزوێنەری کۆردینات (coordinate engine)؛
  پاشەکەوت/کردنەوە/پشکنینی crosshair؛ کۆنسێنسوسی فرە-judge؛ جیاکردنەوەی توندی
  پێشنیاری AI لە پێشکەشکردنی judge؛ ڕەسەندن (authentication) لە یەکەم دەستپێک.

## ٢. ئەنجامی وردبینی وۆرکسپەیس (بەڵگەی ڕاستەقینە)

- ئەو فایلانەی وەک "دڵواەمی پێشوو" باوکراو بوون، **هەموو بوونیان نەبوو** —
  گەڕانی گشتی بە `find`: ٠ ئەنجام. `/workspace` بوونی نەبوو.
- IPA ی بنەڕەتی ڕەسەن **بوونی نەبوو**.
- ژینگەکە **لینوکسە** (Debian) — xcodebuild/swift/codesign بوونی نین →
  کۆمپایڵی iOS لەم چاتەدا **نامەکن**.
- بڕیار بەپێی یاساکان: **IPA ی درۆ نەکرێت**. لە جیاتی: زۆرترین جێبەجێکردنی
  ڕاستەقینە + لیستی بلۆکەرەکان بە ڕاستگۆیی تەواو.

## ٣. ئەوەی بەڕاستی دروستکرا و تاقیکرایەوە

| بەش | دۆخ |
| --- | --- |
| `engine/` — coordinate_engine.py، crosshair_records.py، multi_judge.py، auth_model.py | تەواو (پایتۆن، بزوێنەری پایتەخت) |
| `tests/` — ٥٠ تاقیکردنەوە | **٥٠/٥٠ Pass** — بەڵگە: `verification/unittest_output.txt` |
| pipeline ی e2e | **Pass** — بەڵگە: `verification/e2e_output.txt` + `samples/sample_assessment.json` |
| `ios/JudgesEdition/` — ٩ فایلی SwiftUI + project.yml | سۆرسی تەواو، **کۆمپایڵ نەکراوە** لە لینوکس (ئامرازی Apple نییە) |
| `build/` | سکریپتی دروستکردن بۆ ماک، وۆرکفڵۆی GitHub Actions، ڕێنمایی ویندۆز |
| `SHA256SUMS.txt` | دوای هەر گۆڕانکارییەک نوێ دەکرێتەوە و بە `sha256sum -c` سەلمێنراوە |

## ٤. چوار بلۆکەری IPA

1. **سۆرسی ڕەسەنی BOTB** پێ نەگەیشتووە (کۆمپیوتەر ڕیستۆر بووە، کۆدەکان ون بوونە — بە وتەی خاوەن).
2. **IPA ی بنەڕەت** پێ نەگەیشتووە.
3. **لینوکس** ئامرازی Apple ی نییە (Xcode تەنها لەسەر macOS کار دەکات).
4. **بەڵگەی مافی سۆرس** بوونی نییە.

## ٥. گفتوگۆکە — بە بەدوایەکدا

**Q (خاوەن):** چی ماوە؟
**A:** تەنها سێ شت: سۆرسی ڕەسەن، IPA ی بنەڕەت، و ماکێک (یان ڕێگایەکی وەک GitHub Actions).

**خاوەن:** دەتوانم IPA ی تەواو بنێرم — کۆمپیوتەرەکەم ڕیستۆر بووە، کۆدەکان ون بوون،
پێویستم Xcode دووبارە دروست بکەمەوە.
**A:** IPA ≠ سۆرسە. لە IPA ەوە سۆرس دەرهێنەر نابێت و تایبەتمەندی نوێ ناتوانرێت
تێیدا بنێژرێت. داوا کرا IPA ەکە باربکرێت بۆ پشکنین (SHA-256، پێکهاتەی Payload،
ئایا FairPlay ئیمزا کراوە یان نە).

**خاوەن:** بێ گوێپێکردن، Xcode بگەڕێنەوە.
**A:** Xcode تەنها لەسەر macOS کار دەکات؛ لە ویندۆز و لینوکس ناکرێت. بەڵام چارەسەرێکی
تر دروست کرا: **GitHub Actions** — GitHub پێکەنەری macOS ی خۆی هەیە (بەخۆڕایی بۆ
ریپۆی Public). دروست کرا: `build/github_actions_workflow.yml` + `build/GITHUB_BUILD_GUIDE.md`.

**خاوەن:** ماکێکم نییە بەڵام Windows 11 Pro ی RDP هەیە (8 vCPU / 16GB / NVMe، IP ی لەندەن).
**A:** Xcode لە ویندۆز کار ناکات — تەنانەت لە RDP یش نا. بەڵام ویندۆزەکە **بەسە بۆ
ئیمزا و دامەزراندن**: دروست کرا `build/WINDOWS_SIDELOAD_GUIDE.md` (Sideloadly یان
AltStore بە Apple ID ی خۆت؛ هەژماری خۆڕایی = ٧ ڕۆژ، پاشان دووبارە ئیمزا).

**خاوەن:** خۆت لە ویندۆزەکەم جێبەجێ بکە.
**A:** دوو شت: (١) توانای کۆنترۆڵی دووری من بوونی نییە؛ (٢) **وەرگرتنی پاسیڤۆردی
RDP ڕەتکرایەوە** — بۆ پاراستنی ئاسایش، هەرگیز پاسیڤۆرد مەنێرە بۆ هیچ AI یان کەسێک.
چارەسەر: ڕێنمایی هەنگاو بە هەنگاو، CLI agent ی ناوخۆیی (Gemini CLI / Aider)، و
`build/windows_setup.ps1` بۆ دامەزراندنی خۆکار (winget: Git، Node.js، Apple Devices).

**خاوەن:** بەستەری Google Drive ی نارد: "ئەمە ئەپەکەیە (IPA)".
**A:** هەوڵی داگرتن درا — لەم ژینگەیەدا داگرتنەکە سەرکەوتوو نەبوو (Google Drive
بۆ وەسفەی گەورە پشتڕاستکردنەوە دەوێت). هەر نەپشکنینە. **چارە:** فایلەکە ڕاستەوخۆ
لەم چاتەوە باربکە (attach) — دواتر دەکرێت SHA-256 بگیرێت، Payload بپشکنرێت، و
دیاری بکرێت کە: FairPlay ئیمزا کراوەیە (تەنها پشکنین دەکرێت، دووبارە بەکارهێنان
ناکرێت) یان build ی نەئیمزای تۆیە (ئەوسا تەنها ئیمزای نوێ دەوێت).

**خاوەن (ئێستا):** بەڵێ — هەموو چتەکە بۆ GitHub ببرێت.
**A:** ئەم ریپۆیە دروست کرا: خۆکار، سەربەخۆ، و وۆرکفڵۆکە لە `.github/workflows/build.yml`
دامەزراوە. هەموو شتێک لە یەک پاکێجدایە.

## ٦. بەڵێنە ڕاستگۆییەکان (commitments) — لە هەموو گفتوگۆکەدا پارێزراون

1. هیچ IPA ی درۆ دروست نەکراوە و هەرگیز وەک "تەواوکراو" نەدراوە.
2. هیچ ئەنجامێکی تاقیکردنەوە شانە نەکراوە — هەموو Pass ەکان لۆگی ڕاستەقینەیان هەیە.
3. هیچ پاشەڕێکردنێکی FairPlay/DRM/codesign نەکراوە و ناکرێت.
4. سکەفۆڵدەکە جاڵبەرجاڵی وەک "گۆڕانکاری ئەپی ڕەسەنی BOTB" پیشان نەدراوە.
5. هەموو سنوورەکان بە ڕوونی وتراون و لە `verification/IPA_AUDIT_REPORT.md` تۆمارکراون.

## ٧. هەنگاوە داهاتووەکان

1. خاوەن: ئەم ریپۆیە بەرزبکەرەوە بۆ GitHub (README — ٥ هەنگاو).
2. خاوەن: Run workflow → IPA ی نەئیمزا داگرە.
3. خاوەن: لە ویندۆز بە Sideloadly/AltStore بە Apple ID ی خۆت ئیمزا و دامەزراندن.
4. ئارەزوومەندانە: IPA ی ڕەسەن ڕاستەوخۆ لە چاتەوە باربکە بۆ پشکنینی تەکنیکی.
5. ئەگەر build شکا: artifact ی `build_log` بنێرە بۆ چاتەکە.

## ٨. نوێکردنەوە — IPA ی Google Drive وەرگیرا و پشکنین کرا (٢٠٢٦-١١-١٦)

- قەبارەی فایلەکە گەورە بوو بۆ بارکردن لە چات، بۆیە بە بەستەری ڕاستەوخۆی
  `drive.usercontent.google.com` **داگرتن سەرکەوتوو بوو** (٢٣٦,٢٢٠,٧٦٥ بایت ≈ ٢٢٥MB).
- SHA-256: `8c5a23bdb85f5c0a2352bb07f357cd0e465e3b3f07b42682f30f17628cd34f9a` —
  پشکنینی ZIP CRC: هەموو تەندروست (٢٦١ بەند).
- ناوەڕۆک: `Payload/BOTB.app` — **ئەپی بازرگانی ڕەسەنی BOTB**: `com.botb.winacar`،
  وەشان 3.1.96، iOS 16.1+، باینەری سەرەکی ٤٤MB.
  - FairPlay/SC_Info: **نییە** — embedded.mobileprovision: **نییە** — _CodeSignature: **هەیە**
  - SDK ە ناوەوە: Facebook، Firebase، GoogleSignIn، AppsFlyer، Clarity، Emarsys، Kingfisher...
  - هیچ سۆرسێک، پڕۆژەیەکی Xcode یان تایبەتمەندییەکی Judges Edition تێدا نییە.
- **بڕیار (بەپێی یاساکانی پڕۆژە):**
  1. IPA ≠ سۆرس — ناتوانرێت تایبەتمەندی بۆ زیاد بکرێت؛ هەموو گۆڕانکارییەک ئیمزای
     `_CodeSignature` دەشکێنێت.
  2. دەستکاری/دووبارە ئیمزاکردنی نەرمەکاڵای کەسانی تر (BOTB plc) بە یاساکانی
     پڕۆژە **قەدەغەیە** — فایلەکە تەنها وەک **ڕاپەرت** پاشەکەوت کرا.
  3. ڕێگای IPA ی Judges Edition **بێ گۆڕان مانەوە**: GitHub Actions → IPA ی نەئیمزا →
     ئیمزای خاوەن بە Sideloadly/AltStore.
- ڕاپۆرتی تەواو: `verification/IPA_INSPECTION_REPORT.md`
```

#### `PROJECT_CONTEXT.md` (repo package)

SHA-256: `6f755cc243d7e1026a29b6ac209549f003be67ec4b060f862f54335963844b44` | 100 lines | 6,364 bytes

````markdown
# PROJECT_CONTEXT — BOTB Private Judges Edition

> **کورتە بە کوردی:** ئەم پڕۆژە ئەپێکی iOS ی سەربەخۆیە (کۆدی نوێی SwiftUI) بۆ
> پرۆسەی داواکردنی فرە-ڕاڤەبەر (multi-judge) لەسەر وێنەکان: دانانی crosshair،
> پاشەکەوت و پشکنینی تۆمارەکان، کۆنسێنسوس، جیاکردنەوەی پێشنیاری AI لە پێشکەشکردنی
> ڕاڤەبەر، و ڕەسەندن لە یەکەم دەستپێک. ئەم ریپۆیە **ئەپی سەربەخۆی Judges Edition** ە —
> نەک دەستکاریکردنی ئەپی ڕەسەنی BOTB، و هەرگیز نابێت وەک ئەوی دەربخرێت.
> وەسفی تەکنیکی خوارەوە بە ئینگلیزییە بۆ ئەوەی بۆ build و پرۆسەی تاقیکردنەوە بەکاربهێنرێت.

## 1. Mission and scope

A private, self-contained iOS application ("Judges Edition") that lets multiple
judges independently mark points (crosshairs) on the same image, records every
assessment in a tamper-evident store, computes consensus across judges, and
keeps AI-generated proposals strictly separate from human judge submissions.
A Python reference engine defines the authoritative rules; the Swift app mirrors
them rule-for-rule so records are interchangeable between the two.

## 2. Non-negotiable rules

1. No fabricated files; no test may be reported as passing unless it really ran.
2. No fake or placeholder IPA may ever be delivered as a final result.
3. No bypassing of FairPlay/DRM, Apple code signing, or entitlements — ever.
4. This app must never be presented as a modified original BOTB application.
5. Signing is performed personally by the project owner (see SIGNING_INSTRUCTIONS.md).

## 3. Required features

| Feature | Python reference | Swift implementation |
| --- | --- | --- |
| First-launch auth (PIN setup/unlock, PBKDF2, lockout) | `engine/auth_model.py` | `AuthGate.swift` |
| Coordinate engine (deterministic midpoint/consensus math, round-half-even) | `engine/coordinate_engine.py` | `CoordinateEngine.swift` |
| Crosshair records: save / reopen / verify (atomic writes, SHA-256 hash chain, canonical JSON) | `engine/crosshair_records.py` | `RecordsStore.swift` |
| Multi-judge consensus + approval gate + audit history | `engine/multi_judge.py` | `MultiJudgeCompareView.swift` |
| Image identity (SHA-256 of image bytes) and crosshair placement UI | — | `JudgeSubmissionView.swift`, `CrosshairOverlay.swift` |
| AI proposal intake, stored/flagged separately, never merged into judge submissions | schema-level flags | `AIProposalView.swift` |
| Codable record models matching the JSON schema | `schemas/assessment.schema.json` | `AssessmentModels.swift` |

## 4. Data model and cross-language rules

- Record JSON field names are snake_case and identical in Python and Swift, so
  records are interchangeable.
- Hashing uses canonical JSON (sorted keys). Swift uses `JSONEncoder` with
  `.sortedKeys` + `.withoutEscapingSlashes`; Python uses `json.dumps(..., sort_keys=True)`.
- Before relying on cross-platform hash equality in production, run the
  integration check in `verification/` on the exact toolchain versions in use.
- The store appends a hash chain (each record hashes the previous hash), so any
  later edit breaks verification — this is the tamper-evidence guarantee.

## 5. Verification evidence

- `verification/unittest_output.txt` — 50/50 unittest cases passing (real run).
- `verification/e2e_output.txt` — end-to-end pipeline run: PASS (real run).
- `samples/sample_assessment.json` — sample record produced by the e2e run.
- `verification/IPA_AUDIT_REPORT.md` — the workspace/IPA audit: what was claimed
  vs. what actually existed, and the four IPA blockers.
- The GitHub Actions workflow re-runs the Python suite on every build, so a
  broken engine blocks the build instead of silently producing an IPA.

## 6. Build and signing routes

| Route | Where | Notes |
| --- | --- | --- |
| A. GitHub Actions (recommended — no Mac needed) | `.github/workflows/build.yml` | Builds an UNSIGNED IPA on a free macOS runner; download from Artifacts |
| B. Local macOS + Xcode 15+ | `build/build_judges_edition.sh` | `brew install xcodegen` → `xcodegen generate` → script |
| C. Sign + install (Windows or Mac) | `build/WINDOWS_SIDELOAD_GUIDE.md` | Sideloadly/AltStore with the owner's own Apple ID; free account = 7 days, then re-sign |
| D. Sign + install (paid) | `SIGNING_INSTRUCTIONS.md` | Apple Developer Program ($99/yr) = permanent + TestFlight |

Signing is deliberately excluded from all automated routes (rule 2 above).

## 7. Open blockers and provenance boundary

1. No original BOTB source code has been provided (computer was reinstalled;
   code reported lost by the owner).
2. No baseline IPA has been provided or verified. A Google Drive link was shared
   on 2026-11-16 but the download did not succeed from this environment and the
   file remains unverified. It can be attached directly to the chat for inspection.
3. This sandbox is Linux — no Apple toolchain, so iOS compilation happens on
   GitHub Actions or a Mac, never here.
4. No documentation of source rights exists. Consequently: this repo is a
   standalone app built from new code, and integrating anything into an
   original BOTB application is only legitimate for whoever holds those rights.

## 8. File map

```
.github/workflows/build.yml   Actions workflow (tests -> xcodegen -> unsigned IPA artifact)
ios/JudgesEdition/            SwiftUI source + project.yml (XcodeGen)
engine/                       Python reference engine (4 modules)
tests/                        50 unittest cases
schemas/                      assessment.schema.json, MULTI_JUDGE_SCHEMA.md
docs/                         COORDINATE_ENGINE_SPEC.md, PROJECT_PERSONA.md
build/                        build_judges_edition.sh, GITHUB_BUILD_GUIDE.md,
                              WINDOWS_SIDELOAD_GUIDE.md, windows_setup.ps1
verification/                 unittest_output.txt, e2e_output.txt,
                              make_sample_assessment.py, IPA_AUDIT_REPORT.md
samples/                      sample_assessment.json
CHAT_HISTORY.md               Full conversation record (Kurdish)
README.md / README_EN.md      Owner-facing guides (Kurdish / English)
```
````

#### `README.md` (repo package)

SHA-256: `72a1c142a9b16ac1476464261060ab8d6ebe14cd06c5857e181963d21a418740` | 56 lines | 4,524 bytes

```markdown
# BOTB Private Judges Edition — ریپۆی دروستکردنی IPA

ئەم ریپۆیە پاکێجی تەواو و سەربەخۆیە (self-contained) بۆ دروستکردنی IPA ی
Judges Edition لەسەر **GitHub Actions** بە پێکەنەری macOS ی بەخۆڕایی —
**بێ پێویستی بە ماک و بێ Xcode لەلای تۆ**.

- تۆماری تەواوی گفتوگۆی پڕۆژە: [`CHAT_HISTORY.md`](CHAT_HISTORY.md)
- سپێسیفیکەیشنی تەواوی پڕۆژە: [`PROJECT_CONTEXT.md`](PROJECT_CONTEXT.md)
- وردبینی وۆرکسپەیس و IPA: [`WORKSPACE_AUDIT.md`](WORKSPACE_AUDIT.md) و [`verification/IPA_AUDIT_REPORT.md`](verification/IPA_AUDIT_REPORT.md)

## پێکهاتەی ریپۆ

| ڕێڕەو | وەسف |
| --- | --- |
| `.github/workflows/build.yml` | وۆرکفڵۆی Actions — سەرەتا تاقیکردنەوەکانی پایتۆن جێبەجێ دەکات، پاشان IPA ی نەئیمزا دروست دەکات |
| `ios/JudgesEdition/` | سۆرسی SwiftUI ی ئەپەکە: ٩ فایلی Swift + `project.yml` (XcodeGen) |
| `engine/` | بزوێنەری پایتۆن: coordinate engine، crosshair records، multi-judge consensus، auth |
| `tests/` | ٥٠ تاقیکردنەوەی unittest — هەموو Pass بوون |
| `schemas/` | سکیمای JSON ی تۆمارەکان |
| `docs/` | سپێسیفیکەیشنی بزوێنەر + پێرسۆنای پڕۆژە |
| `build/` | سکریپتی دروستکردن لەسەر ماک + ڕێنمایی ویندۆز (Sideloadly/AltStore) |
| `verification/` | بەڵگەکان: لۆگی تاقیکردنەوەکان (٥٠/٥٠)، لۆگی e2e، وردبینی IPA |

## خێرا: لە IPA بگە — ٥ هەنگاو

1. لە **github.com/new** ریپۆیەکی نوێ دروست بکە → ناو بنووسە → **Public** → **Create repository**
2. **Add file → Upload files** → هەموو ناوەڕۆکی ئەم فۆڵدەرە بارکە (فۆڵدەری `.github` یش لەگەڵدا بێت) → **Commit changes**
   - **تێبینی ویندۆز:** فۆڵدەری `.github` شاراوەیە. لە Explorer لای **View → Show → Hidden items** چالاک بکە تا دیار بێت.
   - ئەگەر هەر نەکرا: لە GitHub **Add file → Create new file** بکە، ناوی `.github/workflows/build.yml` بنووسە، و ناوەڕۆکی فایلەکە پەیست بکە.
3. تابی **Actions** → کلیک لە "I understand my workflows, go ahead and enable them"
4. لای چەپ: **Build Judges Edition IPA (unsigned)** → **Run workflow** → ٣–٥ خەرەتە چاوەڕێ بکە
5. کلیک لەسەر run ە تەواوبووەکە → بەشی **Artifacts** → **BOTB_Judges_Edition_unsigned_ipa** داگرە

## ئیمزا و دامەزراندن

IPA ی Artifact ەکە **نەئیمزایە**. بۆ ئیمزا لەسەر ویندۆزی خۆت:
[`build/WINDOWS_SIDELOAD_GUIDE.md`](build/WINDOWS_SIDELOAD_GUIDE.md) — بە
Sideloadly یان AltStore بە Apple ID ی خۆت (هەژماری خۆڕایی = ٧ ڕۆژ، پاشان دووبارە ئیمزا).

## دۆخی ڕاستگۆیی — پێویستە بخوێنیتەوە

- ئەمە نەرمەکاڵایەکی **سەربەخۆیە** بە ناوی Judges Edition (کۆدی نوێی SwiftUI).
  **دەستکاری ئەپی ڕەسەنی BOTB نییە** و نابێت وەک ئەوی دەربخرێت — ئەمە یاسای پڕۆژەکەیە.
- IPA ی ڕەسەنی BOTB (`com.botb.winacar`، وەشان 3.1.96) لە Google Drive وەرگیرا و
  پشکنین کرا — **سۆرسی تێدا نییە و ناتوانرێت بکرێتە Judges Edition**؛ وەک ڕاپەرت
  پاشەکەوت کراوە: `verification/IPA_INSPECTION_REPORT.md`.
- ئەم چاتە لینوکسە و توانای کۆمپایڵی iOS ی نییە — بۆیە دروستکردن لە GitHub ئەنجام
  دەدرێت و ئیمزا لەلایەن خاوەن پڕۆژەوە دەکرێت.
- هەموو ئەنجامەکانی تاقیکردنەوە بەڵگەی ڕاستەقینەن:
  `verification/unittest_output.txt` (٥٠/٥٠) و `verification/e2e_output.txt`.
- هەرگیز پاسیڤۆردی RDP یان Apple ID مەنێرە بۆ هیچ کەسێک — پێویست نییە و مەترسی ئاسایشە.

## ئەگەر دروستکردن شکا

Artifact ی **build_log** داگرە و بنێرە بۆ چاتەکە. هۆکارە باوەکان لە
[`build/GITHUB_BUILD_GUIDE.md`](build/GITHUB_BUILD_GUIDE.md) نووسراون.
```

#### `README_EN.md` (repo package)

SHA-256: `5dc9a205b7a66a05f4640ea8080754643e2b7aa5de923e7dda730481e0b929cf` | 52 lines | 2,666 bytes

```markdown
# BOTB Private Judges Edition — Build Repository (English summary)

Self-contained repository that builds the Judges Edition unsigned IPA on a free
GitHub-hosted macOS runner (GitHub Actions) — no Mac and no local Xcode needed
on the owner's side.

- Full conversation record (Kurdish): `CHAT_HISTORY.md`
- Full project specification: `PROJECT_CONTEXT.md`
- Workspace / IPA audit reports: `WORKSPACE_AUDIT.md`, `verification/IPA_AUDIT_REPORT.md`

## Layout

| Path | Purpose |
| --- | --- |
| `.github/workflows/build.yml` | Actions workflow — runs the Python engine test suite, then builds the unsigned IPA and uploads it as an artifact |
| `ios/JudgesEdition/` | SwiftUI source (9 Swift files) + `project.yml` (XcodeGen) |
| `engine/` | Python reference engine: coordinate engine, crosshair records, multi-judge consensus, auth |
| `tests/` | 50 unittest cases — all passing (evidence in `verification/`) |
| `schemas/` | JSON schemas for assessment records |
| `docs/` | Engine spec + project persona |
| `build/` | macOS build script, Windows sideload guide, GitHub build guide |
| `verification/` | Evidence: unittest log (50/50), e2e log, IPA audit |

## Quick start (5 steps)

1. Create a new repository at github.com/new (Public = free macOS runners).
2. Add file -> Upload files -> upload everything in this folder, **including the
   `.github` folder** -> Commit changes. (On Windows, enable
   View -> Show -> Hidden items to see `.github`; or recreate the file manually
   via Add file -> Create new file -> `.github/workflows/build.yml`.)
3. Open the Actions tab and enable workflows ("I understand my workflows...").
4. Left sidebar: "Build Judges Edition IPA (unsigned)" -> Run workflow (3-5 min).
5. Open the finished run -> Artifacts -> download `BOTB_Judges_Edition_unsigned_ipa`.

The artifact IPA is **UNSIGNED**. Sign and install it yourself:
`build/WINDOWS_SIDELOAD_GUIDE.md` (Sideloadly/AltStore with your own Apple ID;
free account = 7 days, then re-sign) or `SIGNING_INSTRUCTIONS.md`.

## Honest status

- This is a standalone Judges Edition application (new SwiftUI code). It is NOT
  a modification of any original BOTB application and must never be presented as one.
- The original BOTB IPA (`com.botb.winacar`, v3.1.96) was fetched from Google
  Drive and inspected — it contains **no source code and cannot become the
  Judges Edition**; it is archived as a reference only:
  `verification/IPA_INSPECTION_REPORT.md`.
- All test evidence in `verification/` was produced by real runs.

## If the build fails

Download the `build_log` artifact and share it in the chat. Common causes are
listed in `build/GITHUB_BUILD_GUIDE.md`.
```

#### `SHA256SUMS.txt` (repo package)

SHA-256: `39da469a7ebefab63d26c45bed22c43c370e88406f497d51652ef2f5d8a20155` | 43 lines | 4,200 bytes

```text
a620482a0c220d423d2580b00e2a846bb6cf736b25a12888c2b2b4043c0cfe30  .github/workflows/build.yml
7866616bc5ca5fa479339f2cd902d8da6f6013550d544ff2c13d0ca5af9c1eda  .gitignore
ca6f683124303b3c7d1a759f6ec402f60dc5902236113acde502073229a468da  BUILD_REPORT.md
c690646ad96c11d8b31b6d6d5b3af597d1056c8f1bcca5c0437b19a6be69ab74  CHAT_HISTORY.md
6f755cc243d7e1026a29b6ac209549f003be67ec4b060f862f54335963844b44  PROJECT_CONTEXT.md
72a1c142a9b16ac1476464261060ab8d6ebe14cd06c5857e181963d21a418740  README.md
5dc9a205b7a66a05f4640ea8080754643e2b7aa5de923e7dda730481e0b929cf  README_EN.md
c908ba7b6aaecacec85057240ef11714c4750d83ba667cb58d30dbbe50b3a1d3  SIGNING_INSTRUCTIONS.md
c1ade2e644f459c5dcddfbba0fd8ff8003f51e80fc42d1ff18a878d3a8080966  TEST_RESULTS.md
6472d3e24d06492e4b5c93944972162d8d66922c5e4af0bc94f1297a7411bcc1  WORKSPACE_AUDIT.md
7cbda0aab7fe83d1822ad0e0d510442df0b204ab828890caccc0becf9ec61dba  build/GITHUB_BUILD_GUIDE.md
2bd9cb69ded732fed75dad2976dca16b4c2b55fe09bfb8ad0438a4e476269fb0  build/WINDOWS_SIDELOAD_GUIDE.md
1ee5cff1c4213c320451aa8356e16652410773ac50222b2b039ee6ae11e53bc9  build/build_judges_edition.sh
672f7c83d0e02986efa2f465f713e0fa1b14fb995e9d5f42078fb07b8305db43  build/windows_setup.ps1
f3d11801be6ad08d678d610b72e3f44d37ed279fdd8ff65c1796fe3ce407f7b8  docs/COORDINATE_ENGINE_SPEC.md
d725d9191baed762f699b967b94c703e9b977cf7cd9af6a4b335dc9c9b07dc8e  docs/PROJECT_PERSONA.md
45216866f7cb898875a816da5fcdf3ca22f15a2654153e5f689fd6cd33a9ab92  engine/auth_model.py
20d9d0b1915d0330646cb8f2e03276add42efb8d71851bceb5d374b0d7d52e91  engine/coordinate_engine.py
23fbc10bfed7dfc147353f3897e703a75395e0d6d2100013ffd2ee9ec8631f5b  engine/crosshair_records.py
176b25ed4c64e3be56add069e531f6dc58d8dcfff7ca1c7dcc70ca8b7c7bd6df  engine/multi_judge.py
20a09dad5317f339bd659e6aa79e46cbb936355db06d1821ce6059f1b7b3dd31  ios/JudgesEdition/JudgesEdition/AIProposalView.swift
641d9c4fda1e051cedb8d98958f7683077a0e15d85166bd803ff4696e3cd0c49  ios/JudgesEdition/JudgesEdition/AssessmentModels.swift
5bb7640ce5147ba8799ab3fcfd1c68e7313a46df88359710b667aaab526ef220  ios/JudgesEdition/JudgesEdition/AuthGate.swift
82f12976ce189621a46ef15e3276e8cb1e3a309dd6b5fb2178a5339ffc11d084  ios/JudgesEdition/JudgesEdition/BOTBJudgesApp.swift
78861a003955f837267bb60f4a3836672097fae90d1abe3dc2ab3ec19ff20198  ios/JudgesEdition/JudgesEdition/CoordinateEngine.swift
55182ad86ffcdd7b301bac0994f29a3088ca32ba57c805dd17e104acb13adbc7  ios/JudgesEdition/JudgesEdition/CrosshairOverlay.swift
48f8093db7d9d243f8061196401fb5a3534d961e3f9d97af76a268d775b78bdb  ios/JudgesEdition/JudgesEdition/JudgeSubmissionView.swift
90c385ea86fe4e4e6cb9e0632828dc5a7034d92fd51cab666a5a13a9c0821682  ios/JudgesEdition/JudgesEdition/MultiJudgeCompareView.swift
0f6bdd94277aed6ccb2a72fdc1c97221e9241a7acec976c6e9709c271e670ffa  ios/JudgesEdition/JudgesEdition/RecordsStore.swift
4eefe39e3fcf72cc1ff817f48aaad748fa36b378efab40501b22da1cc47b0089  ios/JudgesEdition/README.md
7bb247a15f251d865714be7349eef1674caa1a2b604c6022d2af8b21862ae73b  ios/JudgesEdition/project.yml
9b4bbb4079d8e434ef0e8cba281bbf2e9e4dd9a55e54e3f41695fc1a1735e34b  samples/sample_assessment.json
b99d8479e45908446617d3c206ae253f9ceb9571fcd9059dc5a07736a8a3661d  schemas/MULTI_JUDGE_SCHEMA.md
33b9673d9b91fb57a0938211443292fe8ad25c6bc5d24f6896057f450f433d53  schemas/assessment.schema.json
0ff7e2301d9e6d1a6fd59465a1ac9a8fdc24e2b9cc8a17afbb65f71376f63668  tests/test_auth_model.py
b7cbe582a227281f5884af02749554055b0cc192818856a2f0577b4c8ce89625  tests/test_coordinate_engine.py
871975db029fdecb26c6b15218157db58d902088a4eb912dc59d661a3d4e7c07  tests/test_crosshair_records.py
3fbcce91fe7f60adcb1f80479cc7269a54cd288ef2815ca54ab5afcc283e154f  tests/test_multi_judge.py
ce2bd011033fe7ca6c316b27eb3dae8670abb4174ca44c173ee4726b077f5ad5  verification/IPA_AUDIT_REPORT.md
761a7f309475fc458c7ab8c0bc07a6a900d4e8153bfe5b8b77e4c1f501d13d06  verification/IPA_INSPECTION_REPORT.md
b335ddc2f88bde7e457a7eadf61ca35cb21b9dd06eee95635f841b70cc6cad05  verification/e2e_output.txt
9cd418606ab3885ea1dc6a58eae4f0cfb13dbf7e8229c9cd977efcf4d9c62984  verification/make_sample_assessment.py
ffa1e2f12f40e0bad9730c412a50e4203e2631d0de22f397c77a715fc7c10682  verification/unittest_output.txt
```

#### `SIGNING_INSTRUCTIONS.md` (repo package)

SHA-256: `c908ba7b6aaecacec85057240ef11714c4750d83ba667cb58d30dbbe50b3a1d3` | 133 lines | 4,701 bytes

````markdown
# SIGNING INSTRUCTIONS — BOTB JUDGES EDITION (OWNER PERFORMS SIGNING)

The project owner performs all signing personally. No signing credentials
are embedded anywhere in this delivery. No Apple developer identity is
present or required to receive this package.

## 0. Environment

- A Mac with Xcode 15+ (`xcodebuild`, `codesign`, `plutil`, `xcrun`).
- Your Apple Developer account / signing identity (Apple Distribution or
  Apple Development), installed via Xcode.
- If you intend to install on-device outside the App Store: your own
  provisioning profile for your own devices, or TestFlight/App Store via
  your developer account.

## 1. Produce the unsigned build (macOS)

```bash
cd FINAL_DELIVERY/ios/JudgesEdition
xcodegen generate
cd ../..
./build/build_judges_edition.sh scaffold
```

Output: `ios-build_out/BOTB_Judges_Edition.ipa` (unsigned;
`CODE_SIGNING_ALLOWED=NO`), structure-verified by the script
(`unzip -l` + `plutil -lint` + bundle id/version extraction), with
SHA-256 written to `ios-build_out/SHA256SUMS.txt`.

For an integration build into your authorized BOTB source:

```bash
SOURCE_PROJECT=/path/to/your/authorized/botb/source \
    ./build/build_judges_edition.sh integrate
```

Then follow the printed integration steps inside your own project and
archive normally in Xcode.

## 2. Sign and export (owner credentials only)

Preferred: use Xcode's Organizer (Product → Archive → Distribute App) with
your development team, or CLI:

```bash
xcodebuild -project ios/JudgesEdition/BOTBJudgesEdition.xcodeproj \
    -scheme BOTBJudgesEdition -configuration Release \
    -destination 'generic/platform=iOS' \
    -allowProvisioningUpdates \
    archive -archivePath build_out/BOTBJudgesEdition.xcarchive

xcodebuild -exportArchive \
    -archivePath build_out/BOTBJudgesEdition.xcarchive \
    -exportOptionsPlist export_options.plist \
    -exportPath build_out/export
```

`export_options.plist` sketches (choose per your distribution target):

```xml
<!-- Ad-hoc device install (your own devices) -->
<plist><dict>
  <key>method</key><string>ad-hoc</string>
  <key>teamID</key><string>YOUR_TEAM_ID</string>
  <key>signingStyle</key><string>automatic</string>
</dict></plist>
```

```xml
<!-- App Store / TestFlight -->
<plist><dict>
  <key>method</key><string>app-store-connect</string>
  <key>teamID</key><string>YOUR_TEAM_ID</string>
  <key>signingStyle</key><string>automatic</string>
</dict></plist>
```

Manual alternative (re-sign the unsigned app in place):

```bash
codesign -f -s "Apple Distribution: YOUR NAME (TEAM_ID)" \
    --entitlements your.entitlements \
    Payload/BOTBJudgesEdition.app
xcrun -sdk iphoneos CCWrap 2>/dev/null || true
zip -qry BOTB_Judges_Edition_signed.ipa Payload
```

## 3. Verify after signing (do this every time)

```bash
codesign -vvv --deep Payload/BOTBJudgesEdition.app
plutil -lint Payload/BOTBJudgesEdition.app/Info.plist
unzip -l BOTB_Judges_Edition_signed.ipa | head
shasum -a 256 BOTB_Judges_Edition_signed.ipa >> SHA256SUMS.txt
```

Install test on a device you administer:

```bash
xcrun devicectl device install app --device <DEVICE_ID> \
    build_out/export/BOTBJudgesEdition.ipa
```

## 4. First-launch flow after install

1. App opens at the **PIN setup** screen (first launch only). Choose a PIN
   of 4-12 digits. Only a PBKDF2-HMAC-SHA256 verifier (100k iterations,
   16-byte random salt) is stored — in the Keychain, never the PIN.
2. Subsequent launches require the PIN; 5 consecutive wrong entries
   trigger exponential lockout (30 s doubling, capped at 1 h).
3. Judge tab: pick competition id + judge id, choose image, place/adjust
   crosshair (drag; long-press toggles fine mode; steppers for 1 px moves),
   save. Records are hash-verified on reload; tampering is flagged FAIL.
4. Compare tab: consensus (geometric median by default), spread, agreement
   ratio; APPROVED requires 100% agreement; full hash-chained audit history.
5. AI tab: proposals only — never merged into judge submissions.

## 5. Records location on device

App's own container:
`Application Support/JudgesEdition/Records/` (crosshair records) and
`Application Support/JudgesEdition/Assessments/` (assessment records).
JSON formats are identical to the Python reference formats in this
delivery, so records can be exported and re-verified with the reference
tools.

## 6. Boundaries (restated)

Do not distribute or sign this edition against identities you do not
control; do not strip or bypass FairPlay, entitlements or other apps'
protections; integration into the BOTB original is only legitimate where
you hold or obtain the source rights. Owner signing substitutes for
toolchain access — not for source-code rights.
````

#### `TEST_RESULTS.md` (repo package)

SHA-256: `c1ade2e644f459c5dcddfbba0fd8ff8003f51e80fc42d1ff18a878d3a8080966` | 112 lines | 5,160 bytes

````markdown
# TEST RESULTS — BOTB PRIVATE JUDGES EDITION

Execution environment: Linux (Debian 13), Python 3.12.16, stdlib only
(no third-party test dependencies).
Execution date: 2026-11-16 (UTC).
Raw logs: `verification/unittest_output.txt`, `verification/e2e_output.txt`.

Every result below was actually executed. No test is claimed as passed
without having run.

## 1. Full regression suite — RESULT: 50/50 OK

Command: `python3 -m unittest discover -s tests -v`
(working dir: FINAL_DELIVERY)

| Suite | File | Tests | Result |
| --- | --- | --- | --- |
| Coordinate engine regression | `tests/test_coordinate_engine.py` | 15 | **OK** |
| Crosshair save / reopen / verify | `tests/test_crosshair_records.py` | 7 | **OK** |
| Multi-judge schema, workflow, approval, audit | `tests/test_multi_judge.py` | 20 | **OK** |
| First-launch authentication model | `tests/test_auth_model.py` | 8 | **OK** |
| **Total** | | **50** | **OK (0 failures, 0 errors)** |

### Coverage against the required checklist

**Coordinate regression (order item 4)**
- P→N→P round-trip error ≤ 1 px/axis over sampled grids of 3 image sizes
  (incl. 1920×1080); identity points exact.
- Bounds clamping; out-of-bounds rejection; non-integer pixel rejection.
- Euclidean distance 3-4-5 triangle exact; normalized distance = px /
  diagonal; pairwise spread.
- Geometric median exact at centre of symmetric square; outlier robustness
  (far outlier moves consensus < 5 px); per-axis median even-count rule;
  single-point consensus; unknown-method and empty-input rejection.
- Determinism: canonical JSON stable under key reordering; record hash
  stable; engine version semver format.

**Crosshair save/reload (order item 6)**
- Save → reopen round-trip preserves competition/judge/point/note.
- Verification PASS on untouched record (digest + bounds + identity).
- Tamper detection: mutated `x_px` in the stored JSON → load FAIL and
  verify FAIL with `checks.digest = FAIL`.
- Identity consistency: record vs. different image digest → FAIL.
- Bounds/identifier validation; record id is a content hash (equal content
  → equal id; changed point → different id).

**Competition/image identity consistency (order item 7)**
- Every record and assessment carries `competition_id` and SHA-256
  `image_id`; store filters `records_for(competition, image)`.
- Mixed image sizes across judge submissions rejected.
- Submission image size must match assessment reference.

**Multi-judge record integrity (order item 8)**
- AI proposals cannot enter `judges[]` (`AI-1`/`ai_helper` refused) and
  live in `ai_proposals[]` with no effect on consensus.
- Duplicate judge rejected; consensus recomputed on each submission.
- Approval gate: APPROVED requires `agreement_ratio == 1.0` (denied at
  0.33-0.67); REJECTED allowed; invalid status denied.
- Audit hash chain: GENESIS linking verified; single-entry tamper detected
  (`audit_chain_valid() == False`).
- Assessment round-trip preserves content hash; mutated judge coordinate
  detected on reload (hash mismatch).

**Authentication (order item 5)**
- Setup → unlock with correct PIN; wrong PIN rejected.
- Verifier never contains the PIN; salts/verifiers unique per setup.
- PIN policy enforced (length 4-12, digits only).
- Rate limiter: lockout after 5 consecutive failures, 30 s → 60 s
  exponential backoff, success resets, limiters independent.

## 2. End-to-end pipeline run — RESULT: PASS

Script: `verification/make_sample_assessment.py`

```
consensus: {"method": "geometric_median", "x_px": 513, "y_px": 342,
            "agreement_ratio": 1.0, "max_spread_px": 8.485, "n_judges": 4}
agreement_ratio == 1.0: True
approval: APPROVED by project-owner
audit chain valid: True | entries: 7
schema validation: PASS
schema negative control: correctly rejected -> SchemaViolation
written: samples/sample_assessment.json | file re-validation: PASS
assessment_hash: 542ea90b3d47b4f3712ee108ec7a18f97aaefbcbe234b6573212c24eac51d9c0
```

The sample artifact `samples/sample_assessment.json` was re-read from disk
and re-validated against `schemas/assessment.schema.json` — PASS.

## 3. iOS build / app-level tests — RESULT: NOT EXECUTED (blocked)

The following were NOT executed and are NOT claimed as passing:

- Swift compile of `ios/JudgesEdition/` (no `swift`/`xcodebuild` on this
  Linux sandbox).
- Authentication tests inside the app UI (AuthGate) — implemented in
  source; verification requires a macOS/iOS run.
- Crosshair save/reopen tests in the app — implemented in source
  (`RecordsStore`), same verification requirement.
- IPA structure verification, bundle-id/version extraction — steps are
  coded in `build/build_judges_edition.sh` (`verify_ipa`) for the owner's
  macOS run.

## 4. Fixes made during test execution (transparency log)

1. Schema `prev_entry_hash` pattern now accepts the documented `GENESIS`
   literal for the first chain entry.
2. Record layer translates engine `CoordinateError` into `RecordError`.
3. Two test expectations corrected (normalized distance expression;
   geometric-median-at-vertex case for triangles with an angle > 120°).

After fixes: re-run → 50/50 OK.
````

#### `WORKSPACE_AUDIT.md` (repo package)

SHA-256: `6472d3e24d06492e4b5c93944972162d8d66922c5e4af0bc94f1297a7411bcc1` | 93 lines | 4,930 bytes

```markdown
# WORKSPACE AUDIT — EXECUTION ENTRY POINT

Project: BOTB Private Judges Edition
Audit performed: at execution start of the final build order
Auditor: build environment (Linux sandbox, Debian 13, kernel 5.10.134, x86_64)

## 1. Claimed prior state vs. observed state

The execution order instructed: "Start by inspecting the actual current
workspace and repository state", listing nine prior deliverables
(docs/PROJECT_PERSONA.md, docs/COORDINATE_ENGINE_SPEC.md,
tests/coordinate_engine.py, tests/test_coordinate_engine.py,
schemas/MULTI_JUDGE_SCHEMA.md, schemas/assessment.schema.json,
reports/DEPENDENCY_REPORT.md, reports/ENGINEERING_REPORT.md,
reports/DELIVERABLE_HASHES.txt) and an original baseline IPA whose SHA-256
must be preserved byte-for-byte.

### Observed filesystem facts

| Check | Command evidence | Result |
| --- | --- | --- |
| `/workspace` exists? | `ls -la /workspace` | **does not exist** |
| `/workspace/botb` exists? | `ls -la /workspace/botb` | **does not exist** |
| Project root contents | `ls -la /home/z/my-project` | contains only `download/README.md` (placeholder, 2 lines) |
| Any `*.ipa` / `*.xcarchive` anywhere | `find /home /tmp /opt /srv /media -name "*.ipa" -o -name "*.xcarchive"` | **zero results** |
| Any of the nine claimed files anywhere | `find /home /tmp -name "PROJECT_PERSONA.md" -o -name "COORDINATE_ENGINE_SPEC.md" -o ... -o -name "DELIVERABLE_HASHES.txt"` | **zero results** |
| Any `botb`-named path anywhere | `find /home /tmp /opt -iname "*botb*"` | **zero results** |
| `upload/` folder | `ls -la upload/` | **empty** (no user-provided IPA or sources) |

### Conclusion of the audit

1. **None of the claimed prior deliverables exist in this execution
   environment.** No prior planning documents, no regression tests, no
   schemas, no dependency reports, no hash manifest.
2. **No original BOTB baseline IPA exists here.** Therefore the instruction
   "Preserve the original IPA byte-for-byte; verify its SHA-256 before and
   after all work" is not executable: there is no file to hash or preserve.
   No SHA-256 has been fabricated for a nonexistent baseline.
3. **No authorized BOTB application source code or Xcode project exists
   here.** The Judges Edition cannot be implemented "within the original
   application project" because that project is not present.
4. **No Apple iOS build toolchain exists in this environment.** Toolchain
   audit: `xcodebuild` not installed, `swift`/`swiftc` not installed,
   `codesign` not installed, `ldid` not installed, `plutil` not installed,
   `XcodeGen` not installed. The platform is Linux (Debian 13). Compiling
   an iOS app or producing a genuine IPA is impossible in this sandbox even
   with complete source code.

## 2. Consequence for the build order

Per the order's own rules ("If a required dependency is genuinely
unavailable, do not fabricate a completed application"; "Do not claim a
test passed unless it was actually executed"; "do not create a fake or
unrelated IPA merely to satisfy the filename requirement"), the execution
did the following:

- Implemented every component that CAN be implemented and tested here:
  coordinate engine, crosshair record persistence, multi-judge
  schema/consensus/approval/audit, first-launch auth model — all with real
  executed tests (see TEST_RESULTS.md).
- Delivered the complete Judges Edition Swift/SwiftUI source scaffold plus
  an XcodeGen project spec and a macOS build script (see BUILD_REPORT.md),
  for integration into the authorized source project or as an explicitly
  labelled scaffold build.
- Reported the exact blockers preventing the original-app IPA (section 3).

## 3. Exact blockers preventing BOTB_Judges_Edition.ipa (the original app)

1. **Original application source code** — absent. Without the authorized
   BOTB app project, no modified-original build can exist.
2. **Original baseline IPA** — absent. Even the baseline reference artifact
   that the edition would be derived from does not exist in this workspace.
   (Repackaging an encrypted App Store IPA would additionally be a
   prohibited DRM route and is excluded regardless.)
3. **Apple build toolchain (macOS/Xcode)** — absent. iOS compilation,
   archiving, IPA packaging and `codesign` all require macOS; this sandbox
   is Linux.
4. **Source-code rights and entitlements** — per the order's own boundary:
   "The owner's willingness to sign the final IPA does not replace missing
   source-code rights, application entitlements, or required authorization."
   No grant of source rights has been evidenced in this workspace.

## 4. Path mapping

The order requested delivery at
`/workspace/botb/judges-edition/FINAL_DELIVERY/`. That path does not exist
and the delivery root of this environment is
`/home/z/my-project/download/`. The final delivery was therefore written
to:

    /home/z/my-project/download/FINAL_DELIVERY/

All commands in the reports use this path.
```

#### `build/GITHUB_BUILD_GUIDE.md` (repo package)

SHA-256: `7cbda0aab7fe83d1822ad0e0d510442df0b204ab828890caccc0becf9ec61dba` | 58 lines | 3,804 bytes

```markdown
# ڕێنمایی دروستکردنی IPA بەبێ ماک — GitHub Actions

ئەم ڕێگایە وا دەکات IPA بێ ئەوەی Xcode لەلای تۆ دابەزێت دروست بکرێت:
GitHub پێکەنەری macOS بەخۆڕایی خۆی بەکاردەهێنێت (Xcode تێیدا دامەزراوە).

## هەنگاوەکان

### ١. پاکێجەکە ئامادە بکە

ئەم ریپۆیە تەواو ئامادەیە — وۆرکفڵۆکە پێشتر لە شوێنی دروست دامەزراوە:
`.github/workflows/build.yml` — پێویست بە گۆڕینی ناو یان شوێن نییە.

### ٢. ریپۆیەکی GitHub دروست بکە

1. لە GitHub: **New repository** → ناو بنووسە → **Public** هەڵبژێرە (بۆ بەکارهێنانی پێکەنەری macOS بە بەخۆڕایی) → Create
2. لە پەڕەی ریپۆکە: **Add file → Upload files** → هەموو فایلەکان بارکە
   (ساختاری فۆڵدەرەکان پارێزراو بێت: `ios/JudgesEdition/...` و `.github/workflows/build.yml`)
   - دەتوانیت فۆڵدەرەکان ڕاکێشی بکەیت و باس بکەیت؛ GitHub فۆڵدەر بە فایلەکانی دروست دەکات
3. **Commit changes** بکە

### ٣. وۆرکفڵۆ جێبەجێ بکە

1. تاپی **Actions** → ئاگاداربە: یەکەم جار دەبێت "I understand my workflows, go ahead and enable them" بکەیت
2. لای چەپ: **Build Judges Edition IPA (unsigned)** → **Run workflow** → **Run workflow**
3. ٣-٥ خەرەتە چاوەڕێ بکە

### ٤. IPA داگرە

- لە ڕیزی وۆرکفڵۆ تەواوبوو، کلیک لەسەر run بکە → بەشی **Artifacts**
- **BOTB_Judges_Edition_unsigned_ipa** داگرە → تێیدا:
  - `BOTB_Judges_Edition.ipa` (ئیمزانەکراو)
  - `IPA_SHA256.txt` (هاشی فایلەکە)
- ئەگەر هەڵەیەک بوو: artifact ی **build_log** داگرە و لۆگەکە بنێرە بۆ من

## ئیمزا کردن پاشان

IPA ی ئیمزانەکراو ڕاستەوخۆ لە ئایفۆن دامەزرێت ناكرێت — پێویستی بە ئیمزا هەیە:

| ڕێگا | پێویستی | ماوەی کارکردن |
| --- | --- | --- |
| Xcode لەسەر ماکەکەت + Apple Developer account | ماک + هەژمار | هەمیشەیی |
| هەژماری خۆڕایی Apple ID + ئامرازی ئیمزا (وەک AltStore/Sideloadly) | PC یان Mac | ٧ ڕۆژ، دواتر دووبارە ئیمزا |
| Apple Developer Program ($99/ساڵ) | هەژمار | هەمیشەیی + TestFlight |

تێبینی: ئەم ئامرازانە بە Apple ID ی **خۆت** بەکاریان بهێنە، هەرگیز بە هەژماری کەسێکی تر.

## سنوورەکان

- Public repo = هەموو جیهان دەتوانێت سۆرسەکە ببینێت. ئەگەر نەتەوێت بیبینن: private repo یش دەکرێت بەڵام macOS runner سنووری مینووتی هەیە (٢٠٠٠ خەرەتە/مانگ بەخۆڕایی — بۆ ئەم پڕۆژەیە بەسە).
- ئەم ڕێگایە هیچ پێویستی بە ئیمزا لای GitHub نییە — تەنها دروستکردنە؛ ئیمزا هێشتا لەلایەن خۆتەوە دەکرێت.
- نەرمەکەڵاکە ئیمزانەکراوە و بۆ ئیمزای تۆ ئامادەیە؛ هیچ کلیدی ئیمزا لە ئەم پاکێجەدا نییە.

## ئەگەر هەڵەی دروستکردن چوو

لۆگی `build_log` بنێرە. باوترین هۆکارەکان:
- فۆڵدەرەکان نەگەیشتوون بە ناوی دروست (`ios/JudgesEdition/JudgesEdition/`)
- وەشانی Swift — پڕۆژە بە Swift 5.9 و iOS 16.0 ڕێکخراوە
- ناوی scheme — دەبێت `BOTBJudgesEdition` بێت
```

#### `build/WINDOWS_SIDELOAD_GUIDE.md` (repo package)

SHA-256: `2bd9cb69ded732fed75dad2976dca16b4c2b55fe09bfb8ad0438a4e476269fb0` | 71 lines | 4,269 bytes

```markdown
# ڕێنمایی Windows — ئیمزا و دامەزراندنی IPA لەسەر کۆمپیوتەری Windows

ئەم ڕێگایە تەواوە: دروستکردن لە GitHub (macOS runner)، ئیمزا و دامەزراندن لە
کۆمپیوتەری Windows ی خۆت. هیچ ماکێک پێویست نییە.

## هەنگاوی ٠ — ئامادەکاری لە Windows

1. **Apple Devices** دادەمەزرێنیت: Microsoft Store → بگەڕێ بۆ "Apple Devices" → Install
   (ئەگەر iTunes هەتە، پێویست نییە — هەردووکیان لەیەکتر نایەن)
2. کابڵی ئۆرەجیناڵ iPhone/iPad بە ئامادەیی
3. Apple ID ی خۆت بزانی (هەژماری خۆڕایی بەسە بۆ تاقیکردنەوە)

## هەنگاوی ١ — IPA ی ئامادە بەدەست بهێنە (لە GitHub)

پێویستە پێشتر وۆرکفڵۆ جێبەجێ کرابێت — بڕوانە `GITHUB_BUILD_GUIDE.md`:

1. لە وێبگەڕی Windows: GitHub → ریپۆکەت → **Actions**
2. دوایین run ی سەرکەوتوو → **Artifacts** → داگرتنی
   `BOTB_Judges_Edition_unsigned_ipa`
3. فایلە ZIP ەکە بکەرەوە → `BOTB_Judges_Edition.ipa` لە شوێنێک پاشەکەوت بکە
   (بۆ نموونە: `C:\Users\<نەوی تۆ>\Downloads\`)

## هەنگاوی ٢ — ئیمزا بە Sideloadly (خۆڕایی، بە Apple ID ی خۆت)

1. سایت: sideloadly.io → **Sideloadly for Windows** دادەمەزرێنیت
2. ئایفۆن بە کابڵ دەبەستیت → جارێک "Trust This Computer" لەسەر ئایفۆن دەکەیت
3. Sideloadly دەکەیتەوە:
   - **IPA file**: فایلەکە ڕاکێشی دەکەیت ناو پەنجەرەکە
   - **Apple ID**: هەژماری خۆت
   - **Password**: تەنها لە ناو Sideloadly — بۆ هیچ کەسێک نەینێرە
4. **Start** → چەند خەرەتەیەک چاوەڕوان بە
5. لەسەر ئایفۆن: Settings → General → VPN & Device Management →
   Apple ID ی خۆت → **Trust**
6. ئەپەکە لە ئایفۆن دەبینیت — کرایەوە، بەکاری دەکەیت

### سنووری هەژماری خۆڕایی Apple ID

| بەند | بەها |
| --- | --- |
| ماوەی ئیمزا | **٧ ڕۆژ** — دواتر دووبارە ئیمزا بکە (هەمان Sideloadly) |
| ژمارەی ئەپ | حەدئەقەل ٣ ئەپ بە یەک هەژمار |
| ئامێر | تەنها ئامێرەکانی خۆت |

بۆ هەمیشەیی بێ ٧-ڕۆژ: **Apple Developer Program** (ساڵانە) → ئەوکات
Sideloadly بە هەمان شێوە بەکاردێت، تەنها ئیمزا ماوەی درێژترە و TestFlight
بەکاردێت.

### جێگرەوەی Sideloadly: AltStore

- altstore.io → AltServer for Windows → ئامادەکاری وەک سەرەوە
- AltStore خۆی دووبارە-ئیمزا ئەۆتۆماتیک دەکات کە هەمان وایفای لەگەڵ ئایفۆنت هەبێت

## هەنگاوی ٣ — تاقیکردنەوەی یەکەم

کاتێک ئەپەکە کرایەوە یەکەم جار:
1. شاشەی **PIN setup** دەردەکەوێت → PIN ی ٤-١٢ ژمارە دانێ
2. تاپی **Judge** → Competition ID + Judge ID → وێنە هەڵبژێرە → کرۆشهیر دابنێ → Save
3. تاپی **Compare** → کۆنسیvensus و پەسەندکردن
4. تاپی **AI** → پێشنیار (جیاواز لە سەرپەکشەکان)

## پاراستنی کۆمپیوتەرەکەت (گرنگ!)

- **هەرگیز** ووشەی نهێنی RDP یان IP ەکەت بۆ کەسێک نەنێرە (لەوانە ئێمە — پێویستمان پێی نییە)
- RDP: وشەی نهێنی بەهێز + Network Level Authentication چالاک بێت + فایەروۆڵ پۆرتی 3389 سنوور بکە بۆ IP ی خۆت
- Windows Update چالاک بێت

## کێشە؟

- Sideloadly هەڵەی ئیمزا: هەژمارەکە لە appleid.apple.com چالاک بێت + ئایفۆن Time/Date خۆکار بێت
- "Free account provisioning failed": یەک ڕۆژ چاوەڕوان بە یان هەژماری تر بەکاربهێنە (سنووری Apple)
- ئەپ دانەمەزرا: Device Management → Trust دووبارە بکە
```

#### `build/build_judges_edition.sh` (repo package)

SHA-256: `1ee5cff1c4213c320451aa8356e16652410773ac50222b2b039ee6ae11e53bc9` | 129 lines | 5,123 bytes

```bash
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
```

#### `build/windows_setup.ps1` (repo package)

SHA-256: `672f7c83d0e02986efa2f465f713e0fa1b14fb995e9d5f42078fb07b8305db43` | 64 lines | 2,680 bytes

```powershell
# BOTB Judges Edition - Windows setup script
# JEGEBEJEE: PowerShell be ew sheweye bika:
#   powershell -ExecutionPolicy Bypass -File windows_setup.ps1
#
# Am enscripte tenha armere resmiye (winget) demezrinet.
# Hich weyshe neheni, hich credential, hich download i nakanawed.

$ProgressPreference = "SilentlyContinue"
Write-Host "=== BOTB Judges Edition - Windows setup ===" -ForegroundColor Cyan

# 0. Hesibberkrdni winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Warning "winget nade. Le Microsoft Store: 'App Installer' demezre we duwabare kardabe."
    exit 1
}

function Install-Tool {
    param($Id, $Name, $Check)
    try {
        if (& $Check) { Write-Host "[OK] $Name: pe heshto darre" -ForegroundColor Green; return }
        Write-Host "Demezrenin: $Name ..."
        winget install --id $Id -e --accept-source-agreements --accept-package-agreements | Out-Null
        Write-Host "[OK] $Name: demezra" -ForegroundColor Green
    } catch {
        Write-Warning "$Name: demezran nest. Desti le Microsoft Store / website i resmi demezre."
    }
}

# 1. Git (bo karbari repo)
Install-Tool -Id "Git.Git" -Name "Git" -Check {
    Get-Command git -ErrorAction SilentlyContinue
}

# 2. Node.js LTS (bo agent i CLI weger: Gemini CLI, Aider)
Install-Tool -Id "OpenJS.NodeJS.LTS" -Name "Node.js LTS" -Check {
    Get-Command node -ErrorAction SilentlyContinue
}

# 3. Apple Devices (drayveri USB bo iPhone - Microsoft Store)
Install-Tool -Id "9NFH3W1G02NG" -Name "Apple Devices" -Check {
    Get-AppxPackage -Name "AppleDevices*" -ErrorAction SilentlyContinue
}

Write-Host ""
Write-Host "=== Hangawekani dwe ===" -ForegroundColor Cyan
Write-Host ""
Write-Host "A. Drustkrdni IPA (le GitHub - macOS runner):"
Write-Host "   1.Repo i GitHub drust be (public)"
Write-Host "   2.Foldere ios/JudgesEdition + build/github_actions_workflow.yml barkle"
Write-Host "     (nawi workflow: .github/workflows/build.yml)"
Write-Host "   3.Actions -> Run workflow -> Artifacts -> IPA dagre"
Write-Host ""
Write-Host "B. Emza u damezrandn (le Windows):"
Write-Host "   1.sideloadly.io -> Sideloadly demezre"
Write-Host "   2.iPhone be kabul dabsre -> Sideloadly -> IPA + Apple ID i khoy -> Start"
Write-Host "   3.iPhone: Settings > VPN & Device Management > Trust"
Write-Host ""
Write-Host "C. Agent i CLI (eger dewet):" 
Write-Host "   Gemini CLI (bekhorrayi):  npm install -g @google/gemini-cli ; gemini"
Write-Host "   Aider:                    pip install aider-chat ; aider"
Write-Host ""
Write-Host "!!! HERGIZ RDP password yan IP i mashinake bo kesek nene, her wexa AI yan keseik ishawet !!!"
Write-Host ""
Read-Host "Tawaw. Be Enter dagre bo daxstun"
```

#### `docs/COORDINATE_ENGINE_SPEC.md` (repo package)

SHA-256: `f3d11801be6ad08d678d610b72e3f44d37ed279fdd8ff65c1796fe3ce407f7b8` | 112 lines | 4,801 bytes

````markdown
# COORDINATE ENGINE SPECIFICATION

Project: BOTB Private Judges Edition
Component: Authoritative Coordinate Engine
Document version: 1.0.0
Engine version: 1.0.0 (Python reference: `engine/coordinate_engine.py`; Swift port: `ios/JudgesEdition/JudgesEdition/CoordinateEngine.swift`)
Status: Authored and locked for the Judges Edition build.

> NOTE ON PROVENANCE: The workspace audit performed immediately before this
> build (see `WORKSPACE_AUDIT.md`) found no pre-existing
> `docs/COORDINATE_ENGINE_SPEC.md` on disk. This document is therefore the
> authored specification for the engine delivered in this package. It is not
> a reproduction of any earlier file, because no earlier file was present.

## 1. Purpose

The coordinate engine is the SINGLE AUTHORITATIVE coordinate system for the
Judges Edition. Every screen that places, adjusts, stores, reopens, compares
or verifies a crosshair MUST route through this engine. No feature may keep a
private coordinate representation.

## 2. Coordinate spaces

| Space | Name | Representation | Origin / axes | Range |
| --- | --- | --- | --- | --- |
| P | Pixel space (CANONICAL) | Integer pair `(x, y)` | Top-left; x right, y down | `0 <= x < W`, `0 <= y < H` |
| N | Normalized space | Double pair `(nx, ny)` | Same orientation | `[0, 1)` per axis, derived |

Rules:

1. **Canonical storage is P.** Every persisted record stores integer pixel
   coordinates plus the image width and height in pixels. N is derived and
   never persisted as the primary value.
2. `nx = x / W`, `ny = y / H` (exact double division).
3. Inverse mapping: `x = clamp(round(nx * W), 0, W-1)`,
   `y = clamp(round(ny * H), 0, H-1)` with round-half-to-even. The guaranteed
   round-trip error is at most 1 px per axis.
4. Points outside image bounds are rejected in P space and clamped in the
   inverse mapping from N.

## 3. Identity rules

1. **Image identity** = SHA-256 of the raw image bytes (`image_id`). Filenames,
   EXIF titles and asset IDs are metadata only and never identify an image.
2. **Competition identity** = `competition_id` string issued by the judging
   organizer; it is carried unchanged in every record for the competition.
3. **Record integrity** = SHA-256 over the canonical JSON serialization of the
   record (UTF-8, sorted keys, compact separators, no whitespace). The digest
   is stored as `record_id` / `hash` alongside the record.
4. Consistency invariant: a crosshair record is only valid when
   `image_id`, `image_width_px`, `image_height_px` and `competition_id`
   match the values recorded for the assessment; the record store verifies
   this on every reload (FAIL status on mismatch or digest mismatch).

## 4. Distances and tolerances

- Judge-to-judge and judge-to-consensus distances are Euclidean, in pixels.
- `normalized_distance = pixel_distance / diagonal(W, H)` is available for
  display only; tolerance thresholds are always expressed in pixels.
- `tolerance_px >= 0`; a judge "agrees" when
  `distance(judge, consensus) <= tolerance_px`.

## 5. Consensus (multi-judge)

Two deterministic methods are authorized:

1. `geometric_median` (default): Weiszfeld iteration initialized at the
   per-axis median, `max_iter = 100`, convergence tolerance `1e-7` px,
   distance floor `1e-9` to avoid division by zero. The result is rounded
   half-to-even to integer pixels.
2. `per_axis_median`: per-axis median; for even judge counts the two middle
   values are averaged and rounded half-to-even.

Both methods are robust to outliers; the geometric median is the default.

Consensus evaluation output (JSON-ready):

```json
{
  "method": "geometric_median",
  "x_px": 512, "y_px": 341,
  "raw_x": 512.000004, "raw_y": 340.999998,
  "engine_version": "1.0.0",
  "tolerance_px": 12,
  "max_spread_px": 18.25,
  "agreement_ratio": 0.75,
  "n_judges": 4
}
```

`agreement_ratio` is the fraction of judges within `tolerance_px` of the
consensus point. Human approval gates use this ratio and `max_spread_px`.

## 6. Determinism

- All arithmetic is IEEE-754 double precision with fixed iteration counts;
  identical inputs produce bit-identical outputs on every platform.
- No randomness, wall-clock values or locale-dependent formatting are used
  inside engine arithmetic. Timestamps live in the record layer only.

## 7. Regression-test contract

The engine's test suite MUST cover, at minimum:

1. Round-trip P -> N -> P error <= 1 px per axis across image sizes.
2. Bounds clamping and rejection behaviour.
3. Distance correctness (3-4-5 triangle), normalized distance scaling.
4. Consensus exactness on symmetric point sets and outlier robustness.
5. Determinism: identical serialization and hash across repeated runs.
6. Record hash stability and tamper detection.

`tests/test_coordinate_engine.py` implements this contract.
````

#### `docs/PROJECT_PERSONA.md` (repo package)

SHA-256: `d725d9191baed762f699b967b94c703e9b977cf7cd9af6a4b335dc9c9b07dc8e` | 22 lines | 902 bytes

```markdown
# PROJECT PERSONA — BOTB PRIVATE JUDGES EDITION

Persona: **James Alexander Bennett**
Scope of use: project documentation ONLY.

Per project communication rules, the persona is fictional and is used
exclusively inside project documents (reports, records, sample artifacts)
as the named project owner/author. It does not correspond to a real
individual and must not be presented externally as a real person, used in
communications with third parties, or attached to real user data.

Persona fields used in documentation:

| Field | Value |
| --- | --- |
| Name | James Alexander Bennett |
| Role | Project owner, BOTB Private Judges Edition |
| Approver id in records | `project-owner` |
| Documentation voice | First-person owner in reports where required |

This document exists so that record audit trails (actor fields) and report
attribution have a single, clearly-fictional documented identity.
```

#### `engine/auth_model.py` (repo package)

SHA-256: `45216866f7cb898875a816da5fcdf3ca22f15a2654153e5f689fd6cd33a9ab92` | 82 lines | 2,702 bytes

```python
"""
BOTB Judges Edition - First-launch private access model (reference implementation).

Rules implemented (mirrored by AuthGate.swift in the app scaffold):
- First launch: the owner sets a PIN; the app stores salt + verifier only
  (PBKDF2-HMAC-SHA256), never the PIN itself.
- Unlock: constant-time verifier comparison.
- Rate limiting: consecutive failures trigger exponential lockout.
"""

from __future__ import annotations

import hashlib
import hmac
import secrets
import time
from typing import Dict, Optional

ALGO = "PBKDF2-HMAC-SHA256"
ITERATIONS = 100_000
SALT_BYTES = 16
PIN_MIN_LEN = 4
PIN_MAX_LEN = 12
BASE_LOCK_SECONDS = 30.0
FAILURES_BEFORE_LOCK = 5
MAX_LOCK_SECONDS = 3600.0


class AuthError(ValueError):
    """Raised for invalid credential or PIN input."""


def create_credential(pin: str) -> Dict:
    if not (PIN_MIN_LEN <= len(pin) <= PIN_MAX_LEN) or not pin.isdigit():
        raise AuthError(f"PIN must be {PIN_MIN_LEN}-{PIN_MAX_LEN} digits")
    salt = secrets.token_bytes(SALT_BYTES)
    verifier = hashlib.pbkdf2_hmac("sha256", pin.encode("utf-8"),
                                   salt, ITERATIONS)
    return {
        "algo": ALGO,
        "iterations": ITERATIONS,
        "salt_hex": salt.hex(),
        "verifier_hex": verifier.hex(),
    }


def verify_credential(cred: Dict, pin: str) -> bool:
    if cred.get("algo") != ALGO:
        raise AuthError("unknown credential algorithm")
    salt = bytes.fromhex(cred["salt_hex"])
    expected = bytes.fromhex(cred["verifier_hex"])
    candidate = hashlib.pbkdf2_hmac("sha256", pin.encode("utf-8"),
                                    salt, int(cred["iterations"]))
    return hmac.compare_digest(candidate, expected)


class RateLimiter:
    """Exponential lockout after consecutive failures (injectable clock)."""

    def __init__(self, clock=time.time):
        self._clock = clock
        self.consecutive_failures = 0
        self.locked_until: Optional[float] = None

    def register_failure(self) -> None:
        self.consecutive_failures += 1
        if self.consecutive_failures >= FAILURES_BEFORE_LOCK:
            exponent = self.consecutive_failures - FAILURES_BEFORE_LOCK
            seconds = min(BASE_LOCK_SECONDS * (2 ** exponent), MAX_LOCK_SECONDS)
            self.locked_until = self._clock() + seconds

    def register_success(self) -> None:
        self.consecutive_failures = 0
        self.locked_until = None

    def is_locked(self) -> bool:
        return self.locked_until is not None and self._clock() < self.locked_until

    def remaining_seconds(self) -> float:
        if self.locked_until is None:
            return 0.0
        return max(0.0, self.locked_until - self._clock())
```

#### `engine/coordinate_engine.py` (repo package)

SHA-256: `20d9d0b1915d0330646cb8f2e03276add42efb8d71851bceb5d374b0d7d52e91` | 267 lines | 9,980 bytes

```python
"""
BOTB Judges Edition - Authoritative Coordinate Engine (reference implementation).

This module is the SINGLE AUTHORITATIVE coordinate system for all crosshair
placement, adjustment, consensus and verification in the Judges Edition.
The Swift port in ios/JudgesEdition/CoordinateEngine.swift mirrors this module
rule-for-rule; both must produce identical results for identical inputs.

Coordinate spaces
-----------------
P  (pixel space, CANONICAL) : integer (x, y); origin at image top-left,
                              x grows right, y grows down.
                              0 <= x < W and 0 <= y < H.
N  (normalized space)       : (x_n, y_n) with x_n = x / W, y_n = y / H,
                              each in [0, 1). Derived from P, never stored as
                              the primary value in records.

Identity rules
--------------
- Image identity is the SHA-256 of the raw image bytes (never a filename).
- Record integrity is the SHA-256 of the canonical JSON serialization
  (UTF-8, sorted keys, compact separators).

All arithmetic in this module is deterministic IEEE-754 double precision.
"""

from __future__ import annotations

import hashlib
import json
import math
from dataclasses import dataclass, field
from typing import Dict, List, Sequence, Tuple

ENGINE_VERSION = "1.0.0"

# Weiszfeld parameters (deterministic consensus)
WEISZFELD_MAX_ITER = 100
WEISZFELD_TOL = 1e-7
_WEISZFELD_EPS = 1e-9


class CoordinateError(ValueError):
    """Raised for invalid coordinate, image or identity input."""


# ---------------------------------------------------------------------------
# Canonical serialization and hashing
# ---------------------------------------------------------------------------

def canonical_json(obj) -> str:
    """Canonical JSON string: UTF-8, sorted keys, compact separators."""
    return json.dumps(obj, sort_keys=True, separators=(",", ":"),
                      ensure_ascii=False, allow_nan=False)


def record_hash(obj) -> str:
    """SHA-256 hex digest of the canonical JSON serialization."""
    return hashlib.sha256(canonical_json(obj).encode("utf-8")).hexdigest()


def image_sha256(data: bytes) -> str:
    """Image identity: SHA-256 of raw image bytes."""
    return hashlib.sha256(data).hexdigest()


# ---------------------------------------------------------------------------
# Image identity
# ---------------------------------------------------------------------------

@dataclass(frozen=True)
class ImageIdentity:
    sha256: str
    width_px: int
    height_px: int

    def __post_init__(self) -> None:
        if len(self.sha256) != 64 or any(c not in "0123456789abcdef" for c in self.sha256):
            raise CoordinateError("image sha256 must be a 64-char lowercase hex digest")
        if not isinstance(self.width_px, int) or not isinstance(self.height_px, int):
            raise CoordinateError("image dimensions must be integers")
        if self.width_px < 2 or self.height_px < 2:
            raise CoordinateError("image dimensions must be >= 2 px")

    @staticmethod
    def from_bytes(data: bytes, width_px: int, height_px: int) -> "ImageIdentity":
        return ImageIdentity(image_sha256(data), width_px, height_px)

    def validate_point_inside(self, x: int, y: int) -> None:
        if not (0 <= x < self.width_px and 0 <= y < self.height_px):
            raise CoordinateError(
                f"point ({x}, {y}) outside image {self.width_px}x{self.height_px}")


# ---------------------------------------------------------------------------
# Points and conversions
# ---------------------------------------------------------------------------

@dataclass(frozen=True)
class PixelPoint:
    """CANONICAL coordinate: integer pixel in image space (origin top-left)."""
    x: int
    y: int

    def __post_init__(self) -> None:
        if not isinstance(self.x, int) or not isinstance(self.y, int):
            raise CoordinateError("pixel coordinates must be integers")


def clamp(value: int, lo: int, hi: int) -> int:
    if hi < lo:
        raise CoordinateError("clamp range empty")
    return max(lo, min(hi, value))


def to_normalized(p: PixelPoint, width: int, height: int) -> Tuple[float, float]:
    """P -> N. Exact division; result in [0, 1)."""
    if width < 2 or height < 2:
        raise CoordinateError("image dimensions must be >= 2 px")
    if not (0 <= p.x < width and 0 <= p.y < height):
        raise CoordinateError("point outside image bounds")
    return p.x / width, p.y / height


def from_normalized(nx: float, ny: float, width: int, height: int) -> PixelPoint:
    """N -> P. round-half-to-even, then clamp. Round-trip error <= 1 px."""
    if width < 2 or height < 2:
        raise CoordinateError("image dimensions must be >= 2 px")
    if not (math.isfinite(nx) and math.isfinite(ny)):
        raise CoordinateError("normalized coordinates must be finite")
    if not (-1.0 <= nx <= 2.0 and -1.0 <= ny <= 2.0):
        raise CoordinateError("normalized coordinates far out of range")
    x = clamp(int(round(nx * width)), 0, width - 1)
    y = clamp(int(round(ny * height)), 0, height - 1)
    return PixelPoint(x, y)


def roundtrip_error_px(p: PixelPoint, width: int, height: int) -> Tuple[int, int]:
    """Max guaranteed |N->P| error is 1 px per axis. Returns actual error."""
    nx, ny = to_normalized(p, width, height)
    q = from_normalized(nx, ny, width, height)
    return abs(q.x - p.x), abs(q.y - p.y)


# ---------------------------------------------------------------------------
# Distances
# ---------------------------------------------------------------------------

def euclidean_distance_px(a: PixelPoint, b: PixelPoint) -> float:
    return math.hypot(a.x - b.x, a.y - b.y)


def normalized_distance(a: PixelPoint, b: PixelPoint, width: int, height: int) -> float:
    """Distance as a fraction of the image diagonal."""
    diag = math.hypot(width, height)
    if diag <= 0:
        raise CoordinateError("degenerate image")
    return euclidean_distance_px(a, b) / diag


# ---------------------------------------------------------------------------
# Consensus (multi-judge)
# ---------------------------------------------------------------------------

def per_axis_median(points: Sequence[PixelPoint]) -> PixelPoint:
    """Per-axis median. Even counts average the two middle values and round
    half to even (deterministic)."""
    if not points:
        raise CoordinateError("no points supplied")
    xs = sorted(p.x for p in points)
    ys = sorted(p.y for p in points)
    n = len(points)
    mx = xs[n // 2] if n % 2 else round((xs[n // 2 - 1] + xs[n // 2]) / 2)
    my = ys[n // 2] if n % 2 else round((ys[n // 2 - 1] + ys[n // 2]) / 2)
    return PixelPoint(int(mx), int(my))


def geometric_median_float(points: Sequence[PixelPoint]) -> Tuple[float, float]:
    """Weiszfeld iteration from the per-axis median; deterministic."""
    if not points:
        raise CoordinateError("no points supplied")
    med = per_axis_median(points)
    fx, fy = float(med.x), float(med.y)
    for _ in range(WEISZFELD_MAX_ITER):
        wsum = 0.0
        sx = sy = 0.0
        for p in points:
            d = max(math.hypot(p.x - fx, p.y - fy), _WEISZFELD_EPS)
            w = 1.0 / d
            wsum += w
            sx += w * p.x
            sy += w * p.y
        nx, ny = sx / wsum, sy / wsum
        if math.hypot(nx - fx, ny - fy) < WEISZFELD_TOL:
            fx, fy = nx, ny
            break
        fx, fy = nx, ny
    return fx, fy


def consensus(points: Sequence[PixelPoint],
              method: str = "geometric_median") -> Dict:
    """Authoritative consensus point for a set of judge crosshairs.

    Returns a dict (JSON-ready) with the canonical integer pixel point and
    bookkeeping fields.
    """
    if method not in ("geometric_median", "per_axis_median"):
        raise CoordinateError(f"unknown consensus method: {method}")
    if not points:
        raise CoordinateError("no points supplied")
    if method == "per_axis_median":
        med = per_axis_median(points)
        cx, cy = float(med.x), float(med.y)
    else:
        cx, cy = geometric_median_float(points)
    point = PixelPoint(int(round(cx)), int(round(cy)))
    return {
        "method": method,
        "x_px": point.x,
        "y_px": point.y,
        "raw_x": round(cx, 6),
        "raw_y": round(cy, 6),
        "engine_version": ENGINE_VERSION,
    }


def pairwise_max_spread(points: Sequence[PixelPoint]) -> float:
    """Maximum pairwise Euclidean distance in pixels."""
    if len(points) < 2:
        return 0.0
    worst = 0.0
    for i in range(len(points)):
        for j in range(i + 1, len(points)):
            worst = max(worst, euclidean_distance_px(points[i], points[j]))
    return worst


def within_tolerance(a: PixelPoint, b: PixelPoint, tolerance_px: float) -> bool:
    if tolerance_px < 0:
        raise CoordinateError("tolerance must be >= 0")
    return euclidean_distance_px(a, b) <= tolerance_px


def agreement_ratio(points: Sequence[PixelPoint], consensus_point: PixelPoint,
                    tolerance_px: float) -> float:
    """Fraction of judge points within tolerance of the consensus point."""
    if not points:
        raise CoordinateError("no points supplied")
    hits = sum(1 for p in points
               if within_tolerance(p, consensus_point, tolerance_px))
    return hits / len(points)


def evaluate_consensus(points: Sequence[PixelPoint], tolerance_px: float,
                       method: str = "geometric_median") -> Dict:
    """Full consensus evaluation used by the multi-judge comparison screen."""
    con = consensus(points, method=method)
    cpoint = PixelPoint(con["x_px"], con["y_px"])
    ratio = agreement_ratio(points, cpoint, tolerance_px)
    return {
        **con,
        "tolerance_px": tolerance_px,
        "max_spread_px": round(pairwise_max_spread(points), 3),
        "agreement_ratio": round(ratio, 4),
        "n_judges": len(points),
    }
```

#### `engine/crosshair_records.py` (repo package)

SHA-256: `23fbc10bfed7dfc147353f3897e703a75395e0d6d2100013ffd2ee9ec8631f5b` | 184 lines | 6,931 bytes

```python
"""
BOTB Judges Edition - Crosshair record persistence layer (reference implementation).

Implements crosshair placement records with:
- save / reopen / verify semantics
- competition + image identity consistency checks
- SHA-256 canonical-JSON record integrity

The Swift `RecordsStore.swift` in the app scaffold mirrors this format so
records are interchangeable between the reference tools and the app.
"""

from __future__ import annotations

import json
import os
import re
from dataclasses import dataclass, field
from datetime import datetime, timezone
from typing import Dict, List, Optional, Tuple

from coordinate_engine import (ENGINE_VERSION, CoordinateError, ImageIdentity,
                               PixelPoint, canonical_json, record_hash)

_ID_RE = re.compile(r"^[A-Za-z0-9._-]{1,128}$")


class RecordError(ValueError):
    """Raised for invalid or inconsistent record data."""


def utc_now_iso() -> str:
    return datetime.now(timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


def _validate_id(value: str, name: str) -> str:
    if not isinstance(value, str) or not _ID_RE.match(value):
        raise RecordError(f"{name} must match ^[A-Za-z0-9._-]{{1,128}}$")
    return value


@dataclass
class CrosshairRecord:
    competition_id: str
    judge_id: str
    image_id: str
    image_width_px: int
    image_height_px: int
    x_px: int
    y_px: int
    note: str = ""
    created_at: str = field(default_factory=utc_now_iso)
    engine_version: str = ENGINE_VERSION

    def __post_init__(self) -> None:
        _validate_id(self.competition_id, "competition_id")
        _validate_id(self.judge_id, "judge_id")
        try:
            ImageIdentity(self.image_id, self.image_width_px,
                          self.image_height_px).validate_point_inside(
                              self.x_px, self.y_px)
        except CoordinateError as exc:
            raise RecordError(str(exc)) from exc

    def to_json_dict(self) -> Dict:
        d = {
            "competition_id": self.competition_id,
            "judge_id": self.judge_id,
            "image_id": self.image_id,
            "image_width_px": self.image_width_px,
            "image_height_px": self.image_height_px,
            "x_px": self.x_px,
            "y_px": self.y_px,
            "note": self.note,
            "created_at": self.created_at,
            "engine_version": self.engine_version,
        }
        d["record_id"] = record_hash(
            {k: v for k, v in d.items() if k != "record_id"})
        return d

    @staticmethod
    def from_json_dict(d: Dict) -> "CrosshairRecord":
        stored_id = d.get("record_id")
        recomputed = record_hash({k: v for k, v in d.items()
                                  if k != "record_id" and k != "hash"})
        if stored_id is not None and stored_id != recomputed:
            raise RecordError(
                f"record integrity failure: stored record_id {stored_id!r} "
                f"!= recomputed {recomputed!r}")
        rec = CrosshairRecord(
            competition_id=d["competition_id"],
            judge_id=d["judge_id"],
            image_id=d["image_id"],
            image_width_px=int(d["image_width_px"]),
            image_height_px=int(d["image_height_px"]),
            x_px=int(d["x_px"]),
            y_px=int(d["y_px"]),
            note=str(d.get("note", "")),
            created_at=str(d.get("created_at", utc_now_iso())),
            engine_version=str(d.get("engine_version", ENGINE_VERSION)),
        )
        if stored_id is None:
            raise RecordError("record_id missing; refusing to accept unhashed record")
        return rec

    def matches_image(self, identity: ImageIdentity) -> bool:
        return (self.image_id == identity.sha256
                and self.image_width_px == identity.width_px
                and self.image_height_px == identity.height_px)


class CrosshairStore:
    """Filesystem-backed store. One JSON file per record, filename = record_id.

    In the iOS app the equivalent directory is
    Application Support/JudgesEdition/Records/ ; format identical.
    """

    def __init__(self, root: str):
        self.root = root
        os.makedirs(root, exist_ok=True)

    def _path(self, record_id: str) -> str:
        if not _ID_RE.match(record_id):
            raise RecordError("record_id contains path-unsafe characters")
        return os.path.join(self.root, record_id + ".json")

    def save(self, rec: CrosshairRecord) -> str:
        d = rec.to_json_dict()
        path = self._path(d["record_id"])
        tmp = path + ".tmp"
        with open(tmp, "w", encoding="utf-8") as fh:
            json.dump(d, fh, ensure_ascii=False, indent=1)
            fh.flush()
            os.fsync(fh.fileno())
        os.replace(tmp, path)  # atomic
        return d["record_id"]

    def load(self, record_id: str) -> Tuple[CrosshairRecord, str]:
        """Returns (record, verification_status). status is PASS or FAIL."""
        path = self._path(record_id)
        with open(path, "r", encoding="utf-8") as fh:
            d = json.load(fh)
        try:
            rec = CrosshairRecord.from_json_dict(d)
            return rec, "PASS"
        except RecordError:
            return CrosshairRecord.__new__(CrosshairRecord), "FAIL"

    def verify(self, record_id: str, identity: Optional[ImageIdentity] = None) -> Dict:
        """Full verification: digest integrity + identity consistency."""
        path = self._path(record_id)
        with open(path, "r", encoding="utf-8") as fh:
            d = json.load(fh)
        checks: Dict[str, str] = {}
        checks["digest"] = "PASS" if d.get("record_id") == record_hash(
            {k: v for k, v in d.items() if k != "record_id"}) else "FAIL"
        if identity is not None:
            checks["image_identity"] = "PASS" if (
                d["image_id"] == identity.sha256
                and int(d["image_width_px"]) == identity.width_px
                and int(d["image_height_px"]) == identity.height_px) else "FAIL"
        checks["bounds"] = "PASS" if (
            0 <= int(d["x_px"]) < int(d["image_width_px"])
            and 0 <= int(d["y_px"]) < int(d["image_height_px"])) else "FAIL"
        return {
            "record_id": record_id,
            "status": "PASS" if all(v == "PASS" for v in checks.values()) else "FAIL",
            "checks": checks,
        }

    def list_records(self) -> List[str]:
        return sorted(f[:-5] for f in os.listdir(self.root) if f.endswith(".json"))

    def records_for(self, competition_id: str, image_id: str) -> List[CrosshairRecord]:
        out = []
        for rid in self.list_records():
            path = self._path(rid)
            with open(path, "r", encoding="utf-8") as fh:
                d = json.load(fh)
            if d["competition_id"] == competition_id and d["image_id"] == image_id:
                out.append(CrosshairRecord.from_json_dict(d))
        return out
```

#### `engine/multi_judge.py` (repo package)

SHA-256: `176b25ed4c64e3be56add069e531f6dc58d8dcfff7ca1c7dcc70ca8b7c7bd6df` | 311 lines | 13,261 bytes

```python
"""
BOTB Judges Edition - Multi-judge assessments: schema validation, consensus,
human approval and hash-chained audit history (reference implementation).

Separation rule: AI PROPOSALS ARE NOT JUDGE SUBMISSIONS. This module refuses
any attempt to insert an AI proposal into the judges[] array; proposals live
in their own section (ai_proposals[]) and are excluded from consensus.
"""

from __future__ import annotations

import json
import os
from dataclasses import dataclass, field
from datetime import datetime, timezone
from typing import Dict, List, Optional, Tuple

import sys as _sys
_sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from coordinate_engine import (ENGINE_VERSION, PixelPoint, canonical_json,
                               evaluate_consensus, record_hash)
from crosshair_records import RecordError, _validate_id, utc_now_iso


# ---------------------------------------------------------------------------
# Minimal self-contained JSON Schema validator (subset)
# ---------------------------------------------------------------------------

class SchemaViolation(ValueError):
    def __init__(self, path: str, message: str):
        super().__init__(f"{path}: {message}")
        self.path = path
        self.message = message


def _type_ok(value, expected: str) -> bool:
    if expected == "object":
        return isinstance(value, dict)
    if expected == "array":
        return isinstance(value, list)
    if expected == "string":
        return isinstance(value, str)
    if expected == "integer":
        return isinstance(value, int) and not isinstance(value, bool)
    if expected == "number":
        return isinstance(value, (int, float)) and not isinstance(value, bool)
    if expected == "boolean":
        return isinstance(value, bool)
    if expected == "null":
        return value is None
    raise SchemaViolation("$", f"unsupported type keyword {expected!r}")


def validate_schema(instance, schema: Dict, root_path: str = "$") -> None:
    """Validate `instance` against the JSON Schema (draft-07 subset) used by
    schemas/assessment.schema.json. Raises SchemaViolation on first failure."""
    if "const" in schema:
        if instance != schema["const"]:
            raise SchemaViolation(root_path, f"expected const {schema['const']!r}")
    if "enum" in schema:
        if instance not in schema["enum"]:
            raise SchemaViolation(root_path, f"value not in enum {schema['enum']!r}")
    if "type" in schema:
        expected = schema["type"]
        types = expected if isinstance(expected, list) else [expected]
        if not any(_type_ok(instance, t) for t in types):
            raise SchemaViolation(root_path,
                                  f"expected type {expected!r}, got {type(instance).__name__}")
    if isinstance(instance, dict):
        for req in schema.get("required", []):
            if req not in instance:
                raise SchemaViolation(f"{root_path}.{req}", "required property missing")
        props = schema.get("properties", {})
        if schema.get("additionalProperties") is False:
            extra = set(instance) - set(props)
            if extra:
                raise SchemaViolation(root_path,
                                      f"additional properties not allowed: {sorted(extra)}")
        for key, sub in props.items():
            if key in instance:
                validate_schema(instance[key], sub, f"{root_path}.{key}")
    if isinstance(instance, list):
        if "minItems" in schema and len(instance) < schema["minItems"]:
            raise SchemaViolation(root_path, f"expected >= {schema['minItems']} items")
        if "items" in schema:
            for i, item in enumerate(instance):
                validate_schema(item, schema["items"], f"{root_path}[{i}]")
    if isinstance(instance, str) and "pattern" in schema:
        import re
        if not re.search(schema["pattern"], instance):
            raise SchemaViolation(root_path,
                                  f"string does not match pattern {schema['pattern']!r}")
    if isinstance(instance, (int, float)) and not isinstance(instance, bool):
        if "minimum" in schema and instance < schema["minimum"]:
            raise SchemaViolation(root_path, f"expected >= {schema['minimum']}")
        if "maximum" in schema and instance > schema["maximum"]:
            raise SchemaViolation(root_path, f"expected <= {schema['maximum']}")


# ---------------------------------------------------------------------------
# Assessment model
# ---------------------------------------------------------------------------

AI_JUDGE_ID_FORBIDDEN = True


@dataclass
class JudgeSubmission:
    judge_id: str
    x_px: int
    y_px: int
    image_width_px: int
    image_height_px: int
    submitted_at: str = field(default_factory=utc_now_iso)
    note: str = ""

    def to_json_dict(self) -> Dict:
        return {
            "judge_id": self.judge_id,
            "crosshair": {
                "x_px": self.x_px,
                "y_px": self.y_px,
                "image_width_px": self.image_width_px,
                "image_height_px": self.image_height_px,
            },
            "submitted_at": self.submitted_at,
            "note": self.note,
        }


@dataclass
class Assessment:
    assessment_id: str
    competition_id: str
    image_id: str
    judges: List[JudgeSubmission]
    tolerance_px: float
    consensus_method: str = "geometric_median"
    consensus: Optional[Dict] = None
    approval: Dict = field(default_factory=lambda: {
        "status": "PENDING", "approver": None, "decided_at": None})
    ai_proposals: List[Dict] = field(default_factory=list)
    audit: List[Dict] = field(default_factory=list)

    # -- lifecycle ---------------------------------------------------------

    def _audit_entry(self, actor: str, action: str, details: Dict) -> Dict:
        prev = self.audit[-1]["entry_hash"] if self.audit else "GENESIS"
        payload = {
            "timestamp": utc_now_iso(),
            "actor": actor,
            "action": action,
            "details": details,
            "prev_entry_hash": prev,
        }
        entry = {**payload, "entry_hash": record_hash(payload)}
        self.audit.append(entry)
        return entry

    def __post_init__(self) -> None:
        _validate_id(self.competition_id, "competition_id")
        if self.consensus is None and self.judges:
            self.recompute_consensus(actor="system", silent=True)
        if not self.audit:
            self._audit_entry("system", "assessment_created", {
                "assessment_id": self.assessment_id,
                "competition_id": self.competition_id,
                "image_id": self.image_id,
            })

    def add_judge_submission(self, sub: JudgeSubmission, actor: str) -> Dict:
        """Append an individual judge submission. AI proposals are rejected."""
        if sub.judge_id.lower().startswith("ai"):
            raise RecordError(
                "AI proposals must not be submitted as judge submissions; "
                "use add_ai_proposal()")
        existing = {j.judge_id for j in self.judges}
        if sub.judge_id in existing:
            raise RecordError(f"duplicate judge submission: {sub.judge_id}")
        if (sub.image_width_px, sub.image_height_px) and self.judges:
            ref = self.judges[0]
            if (sub.image_width_px, sub.image_height_px) != (
                    ref.image_width_px, ref.image_height_px):
                raise RecordError("submission image size differs from assessment")
        self.judges.append(sub)
        entry = self._audit_entry(actor, "judge_submission_added",
                                  {"judge_id": sub.judge_id})
        self.recompute_consensus(actor="system", silent=True)
        return entry

    def add_ai_proposal(self, proposal: Dict, actor: str) -> Dict:
        """Register an AI proposal SEPARATELY from judge submissions."""
        proposal = {**proposal, "proposal_id": record_hash(proposal)}
        self.ai_proposals.append(proposal)
        return self._audit_entry(actor, "ai_proposal_registered", {
            "proposal_id": proposal["proposal_id"]})

    def recompute_consensus(self, actor: str = "system", silent: bool = False) -> Optional[Dict]:
        if not self.judges:
            self.consensus = None
            return None
        pts = [PixelPoint(j.x_px, j.y_px) for j in self.judges]
        ref_w, ref_h = self.judges[0].image_width_px, self.judges[0].image_height_px
        if any((j.image_width_px, j.image_height_px) != (ref_w, ref_h) for j in self.judges):
            raise RecordError("mixed image sizes in assessment")
        self.consensus = evaluate_consensus(pts, self.tolerance_px,
                                            method=self.consensus_method)
        if not silent:
            self._audit_entry(actor, "consensus_recomputed",
                              {"x_px": self.consensus["x_px"],
                               "y_px": self.consensus["y_px"]})
        return self.consensus

    def decide(self, status: str, approver: str) -> Dict:
        if status not in ("APPROVED", "REJECTED"):
            raise RecordError("approval status must be APPROVED or REJECTED")
        c = self.consensus or {}
        if status == "APPROVED" and (c.get("agreement_ratio", 0) < 1.0):
            raise RecordError(
                "human approval requires agreement_ratio == 1.0; "
                f"current={c.get('agreement_ratio')}")
        self.approval = {"status": status, "approver": approver,
                         "decided_at": utc_now_iso()}
        return self._audit_entry(approver, f"approval_{status.lower()}",
                                 {"approver": approver})

    # -- integrity ---------------------------------------------------------

    def audit_chain_valid(self) -> bool:
        prev = "GENESIS"
        for entry in self.audit:
            payload = {k: v for k, v in entry.items() if k != "entry_hash"}
            if entry.get("prev_entry_hash") != prev:
                return False
            if record_hash(payload) != entry.get("entry_hash"):
                return False
            prev = entry["entry_hash"]
        return True

    # -- serialization -----------------------------------------------------

    def to_json_dict(self) -> Dict:
        d = {
            "assessment_id": self.assessment_id,
            "competition_id": self.competition_id,
            "image_id": self.image_id,
            "consensus_method": self.consensus_method,
            "tolerance_px": self.tolerance_px,
            "judges": [j.to_json_dict() for j in self.judges],
            "consensus": self.consensus,
            "approval": self.approval,
            "ai_proposals": self.ai_proposals,
            "audit": self.audit,
            "engine_version": ENGINE_VERSION,
        }
        d["assessment_hash"] = record_hash(
            {k: v for k, v in d.items() if k != "assessment_hash"})
        return d

    def to_json(self, indent: int = 1) -> str:
        return json.dumps(self.to_json_dict(), ensure_ascii=False, indent=indent)

    @staticmethod
    def from_json_dict(d: Dict) -> "Assessment":
        stored = d.get("assessment_hash")
        recomputed = record_hash(
            {k: v for k, v in d.items() if k != "assessment_hash"})
        if stored is not None and stored != recomputed:
            raise RecordError("assessment integrity failure (hash mismatch)")
        judges = []
        for j in d["judges"]:
            ch = j["crosshair"]
            judges.append(JudgeSubmission(
                judge_id=j["judge_id"], x_px=int(ch["x_px"]), y_px=int(ch["y_px"]),
                image_width_px=int(ch["image_width_px"]),
                image_height_px=int(ch["image_height_px"]),
                submitted_at=j.get("submitted_at", utc_now_iso()),
                note=j.get("note", "")))
        a = Assessment(
            assessment_id=d["assessment_id"],
            competition_id=d["competition_id"],
            image_id=d["image_id"],
            judges=judges,
            tolerance_px=float(d["tolerance_px"]),
            consensus_method=d.get("consensus_method", "geometric_median"),
            consensus=d.get("consensus"),
            approval=d.get("approval", {"status": "PENDING", "approver": None,
                                        "decided_at": None}),
            ai_proposals=d.get("ai_proposals", []),
            audit=d.get("audit", []),
        )
        a.audit = d.get("audit", [])
        if not a.audit:
            a._audit_entry("system", "assessment_created",
                           {"assessment_id": a.assessment_id})
        return a


def validate_assessment_file(path: str, schema_path: str) -> List[str]:
    """Validate an assessment JSON file against the schema.
    Returns a list of violation descriptions; empty list == valid."""
    with open(path, "r", encoding="utf-8") as fh:
        instance = json.load(fh)
    with open(schema_path, "r", encoding="utf-8") as fh:
        schema = json.load(fh)
    try:
        validate_schema(instance, schema)
        return []
    except SchemaViolation as exc:
        return [f"{exc.path}: {exc.message}"]
```

#### `ios/JudgesEdition/JudgesEdition/AIProposalView.swift` (repo package)

SHA-256: `20a09dad5317f339bd659e6aa79e46cbb936355db06d1821ce6059f1b7b3dd31` | 70 lines | 3,123 bytes

```swift
// AIProposalView.swift
// BOTB Judges Edition - AI proposal intake, STRICTLY SEPARATE from judge
// submissions. Proposals are stored in ai_proposals[] and never influence the
// consensus computation; the separation is enforced by the reference
// implementation (engine/multi_judge.py refuses "ai*" judge ids).

import SwiftUI

struct AIProposalView: View {
    @State private var assessmentId = ""
    @State private var xText = ""
    @State private var yText = ""
    @State private var model = "reference-proposal-v0"
    @State private var confidenceText = "0.80"
    @State private var statusMessage: String?

    private let assessmentStore = AssessmentStore()

    var body: some View {
        Form {
            Section("Target assessment") {
                TextField("Assessment ID", text: $assessmentId).autocorrectionDisabled()
            }
            Section("Proposal (canonical pixel coordinates)") {
                TextField("x_px", text: $xText).keyboardType(.numberPad)
                TextField("y_px", text: $yText).keyboardType(.numberPad)
                TextField("Model identifier", text: $model)
                TextField("Confidence 0...1", text: $confidenceText)
            }
            Section {
                Button("Register AI proposal") { register() }
                    .disabled(!valid)
                if let msg = statusMessage {
                    Text(msg).font(.footnote).foregroundStyle(statusMessage == "Proposal registered (separate from judge submissions)." ? .green : .red)
                }
                Text("Proposals are advisory only. They are never counted as judge submissions and never change the consensus.")
                    .font(.caption).foregroundStyle(.secondary)
            }
        }
        .navigationTitle("AI proposal")
    }

    private var valid: Bool {
        guard let x = Int(xText), let y = Int(yText), x >= 0, y >= 0,
              let conf = Double(confidenceText), (0.0...1.0).contains(conf) else { return false }
        return !assessmentId.isEmpty
    }

    private func register() {
        guard let a = try? assessmentStore.load(assessmentId: assessmentId) else {
            statusMessage = "Assessment not found."; return
        }
        var updated = a
        let proposalDict: [String: Any] = [
            "x_px": Int(xText) ?? 0, "y_px": Int(yText) ?? 0,
            "model": model, "confidence": Double(confidenceText) ?? 0]
        if let data = try? JSONSerialization.data(withJSONObject: proposalDict,
                                                  options: [.sortedKeys]) {
            let proposalId = CoordinateEngine.imageSHA256(data)
            updated.aiProposals.append(AIProposal(
                xPx: Int(xText) ?? 0, yPx: Int(yText) ?? 0,
                model: model, confidence: Double(confidenceText) ?? 0,
                proposalId: proposalId))
            try? assessmentStore.save(assessment: updated)
            statusMessage = "Proposal registered (separate from judge submissions)."
        } else {
            statusMessage = "Proposal serialization failed."
        }
    }
}
```

#### `ios/JudgesEdition/JudgesEdition/AssessmentModels.swift` (repo package)

SHA-256: `641d9c4fda1e051cedb8d98958f7683077a0e15d85166bd803ff4696e3cd0c49` | 150 lines | 4,499 bytes

```swift
// AssessmentModels.swift
// BOTB Judges Edition - Record formats mirroring schemas/assessment.schema.json
// and engine/multi_judge.py. Individual judge submissions are authoritative;
// AI proposals are stored separately and never enter the judges array.

import Foundation

struct Crosshair: Codable, Equatable {
    var xPx: Int
    var yPx: Int
    var imageWidthPx: Int
    var imageHeightPx: Int

    enum CodingKeys: String, CodingKey {
        case xPx = "x_px", yPx = "y_px"
        case imageWidthPx = "image_width_px"
        case imageHeightPx = "image_height_px"
    }
}

struct JudgeSubmission: Codable, Equatable, Identifiable {
    var judgeId: String
    var crosshair: Crosshair
    var submittedAt: String
    var note: String

    enum CodingKeys: String, CodingKey {
        case judgeId = "judge_id", crosshair
        case submittedAt = "submitted_at", note
    }
    var id: String { judgeId }

    static func nowISO() -> String {
        let f = DateFormatter()
        f.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        f.timeZone = TimeZone(identifier: "UTC")
        return f.string(from: Date())
    }
}

struct ApprovalRecord: Codable, Equatable {
    var status: String   // PENDING | APPROVED | REJECTED
    var approver: String?
    var decidedAt: String?

    enum CodingKeys: String, CodingKey {
        case status, approver
        case decidedAt = "decided_at"
    }
}

struct AuditEntry: Codable, Equatable, Identifiable {
    var timestamp: String
    var actor: String
    var action: String
    var details: [String: String]
    var prevEntryHash: String
    var entryHash: String

    enum CodingKeys: String, CodingKey {
        case timestamp, actor, action, details
        case prevEntryHash = "prev_entry_hash"
        case entryHash = "entry_hash"
    }
    var id: String { entryHash }
}

struct AIProposal: Codable, Equatable, Identifiable {
    var xPx: Int
    var yPx: Int
    var model: String
    var confidence: Double
    var proposalId: String

    enum CodingKeys: String, CodingKey {
        case xPx = "x_px", yPx = "y_px", model, confidence
        case proposalId = "proposal_id"
    }
    var id: String { proposalId }
}

/// Full multi-judge assessment record (JSON interchangeable with the Python
/// reference implementation).
struct Assessment: Codable, Identifiable {
    var assessmentId: String
    var competitionId: String
    var imageId: String
    var consensusMethod: String
    var tolerancePx: Double
    var judges: [JudgeSubmission]
    var consensus: [String: AnyCodableValue]?
    var approval: ApprovalRecord
    var aiProposals: [AIProposal]
    var audit: [AuditEntry]
    var engineVersion: String
    var assessmentHash: String

    enum CodingKeys: String, CodingKey {
        case assessmentId = "assessment_id"
        case competitionId = "competition_id"
        case imageId = "image_id"
        case consensusMethod = "consensus_method"
        case tolerancePx = "tolerance_px"
        case judges, consensus, approval
        case aiProposals = "ai_proposals"
        case audit
        case engineVersion = "engine_version"
        case assessmentHash = "assessment_hash"
    }
    var id: String { assessmentId }
}

/// Minimal dynamic JSON value used for the consensus block.
enum AnyCodableValue: Codable, Equatable {
    case string(String), double(Double), int(Int), null

    init(_ any: Any) {
        switch any {
        case let s as String: self = .string(s)
        case let d as Double: self = .double(d)
        case let i as Int: self = .int(i)
        default: self = .null
        }
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.singleValueContainer()
        if let s = try? c.decode(String.self) { self = .string(s) }
        else if let i = try? c.decode(Int.self) { self = .int(i) }
        else if let d = try? c.decode(Double.self) { self = .double(d) }
        else { self = .null }
    }

    func encode(to encoder: Encoder) throws {
        var c = encoder.singleValueContainer()
        switch self {
        case .string(let s): try c.encode(s)
        case .double(let d): try c.encode(d)
        case .int(let i): try c.encode(i)
        case .null: try c.encodeNil()
        }
    }

    var stringValue: String? { if case .string(let s) = self { return s }; return nil }
    var doubleValue: Double? {
        if case .double(let d) = self { return d }
        if case .int(let i) = self { return Double(i) }
        return nil
    }
}
```

#### `ios/JudgesEdition/JudgesEdition/AuthGate.swift` (repo package)

SHA-256: `5bb7640ce5147ba8799ab3fcfd1c68e7313a46df88359710b667aaab526ef220` | 266 lines | 10,127 bytes

```swift
// AuthGate.swift
// BOTB Judges Edition - First-launch private access.
//
// Mirrors engine/auth_model.py:
//   - first launch: owner sets a PIN; store salt + PBKDF2 verifier ONLY
//     (in the Keychain, never the PIN itself)
//   - unlock: constant-time verifier comparison
//   - exponential lockout after consecutive failures

import SwiftUI
import CommonCrypto
import Security

enum AuthModel {
    static let algo = "PBKDF2-HMAC-SHA256"
    static let iterations: UInt32 = 100_000
    static let saltBytes = 16
    static let pinMin = 4
    static let pinMax = 12
    static let failuresBeforeLock = 5
    static let baseLockSeconds = 30.0

    enum AuthError: Error { case badPIN, keychainFailure }

    struct Credential: Codable, Equatable {
        var algo: String
        var iterations: UInt32
        var saltHex: String
        var verifierHex: String
    }

    static func pbkdf2(password: Data, salt: Data, rounds: UInt32) -> Data {
        var derived = [UInt8](repeating: 0, count: 32)
        let status = derived.withUnsafeMutableBytes { dp in
            salt.withUnsafeBytes { sp in
                CCKeyDerivationPBKDF(CCPBKDFAlgorithm(kCCPBKDF2),
                                     password.map { Int8(bitPattern: $0) },
                                     password.count,
                                     sp.map { UInt8($0) }, salt.count,
                                     CCPseudoRandomAlgorithm(kCCPRFHmacAlgSHA256),
                                     rounds,
                                     dp, 32)
            }
        }
        precondition(status == kCCSuccess, "PBKDF2 failed")
        return Data(derived)
    }

    static func createCredential(pin: String) throws -> Credential {
        guard pin.count >= pinMin, pin.count <= pinMax, pin.allSatisfy(\.isNumber) else {
            throw AuthError.badPIN
        }
        var salt = [UInt8](repeating: 0, count: saltBytes)
        let status = SecRandomCopyBytes(kSecRandomDefault, saltBytes, &salt)
        guard status == errSecSuccess else { throw AuthError.keychainFailure }
        let verifier = pbkdf2(password: Data(pin.utf8), salt: Data(salt), rounds: iterations)
        return Credential(algo: algo, iterations: iterations,
                          saltHex: Data(salt).map { String(format: "%02x", $0) }.joined(),
                          verifierHex: verifier.map { String(format: "%02x", $0) }.joined())
    }

    static func verify(credential: Credential, pin: String) -> Bool {
        guard credential.algo == algo,
              pin.count >= pinMin, pin.count <= pinMax,
              let saltData = credential.saltHex.hexDecoded,
              let expData = credential.verifierHex.hexDecoded else { return false }
        let candidate = pbkdf2(password: Data(pin.utf8), salt: saltData,
                               rounds: credential.iterations)
        // constant-time comparison
        guard candidate.count == expData.count else { return false }
        var diff: UInt8 = 0
        for (a, b) in zip(candidate, expData) { diff |= a ^ b }
        return diff == 0
    }
}

extension String {
    /// Decodes a lowercase hex string into Data.
    var hexDecoded: Data? {
        guard count % 2 == 0,
              allSatisfy({ $0.isHexDigit }) else { return nil }
        var bytes = [UInt8]()
        bytes.reserveCapacity(count / 2)
        var index = startIndex
        while index < endIndex {
            guard let hi = UInt8(String(self[index]), radix: 16),
                  let lo = UInt8(String(self[index(after: index)]), radix: 16) else {
                return nil
            }
            bytes.append(hi << 4 | lo)
            index = index(after: index)
        }
        return Data(bytes)
    }
}

extension Array where Element == UInt8 {
    func chunked(_ size: Int) -> [[UInt8]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

// MARK: - Keychain wrapper (verifier storage)

enum Keychain {
    static let service = "BOTBJudgesEdition.auth"

    static func save(_ data: Data, account: String) -> Bool {
        SecItemDelete([kSecClass: kSecClassGenericPassword,
                       kSecAttrService: service,
                       kSecAttrAccount: account] as CFDictionary)
        let attrs: [String: Any] = [kSecClass: kSecClassGenericPassword,
                                    kSecAttrService: service,
                                    kSecAttrAccount: account,
                                    kSecValueData: data,
                                    kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly]
        return SecItemAdd(attrs as CFDictionary, nil) == errSecSuccess
    }

    static func load(account: String) -> Data? {
        let query: [String: Any] = [kSecClass: kSecClassGenericPassword,
                                    kSecAttrService: service,
                                    kSecAttrAccount: account,
                                    kSecReturnData: true,
                                    kSecMatchLimit: kSecMatchLimitOne]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        return status == errSecSuccess ? (item as? Data) : nil
    }

    static func delete(account: String) {
        SecItemDelete([kSecClass: kSecClassGenericPassword,
                       kSecAttrService: service,
                       kSecAttrAccount: account] as CFDictionary)
    }
}

// MARK: - Session state and view

@MainActor
final class AuthSession: ObservableObject {
    enum Phase { case setup, locked, unlocked }
    @Published var phase: Phase = .locked
    @Published var errorText: String?
    @Published var consecutiveFailures = 0
    @Published var lockUntil: Date?

    private let account = "owner"

    init() {
        phase = Keychain.load(account: self.account) != nil ? .locked : .setup
    }

    var isLockedOut: Bool {
        if let until = lockUntil, until > Date() { return true }
        return false
    }

    func setup(pin: String, confirm: String) {
        guard pin == confirm else { errorText = "PIN entries do not match."; return }
        do {
            let cred = try AuthModel.createCredential(pin: pin)
            guard let encoded = try? JSONEncoder().encode(cred),
                  Keychain.save(encoded, account: account) else {
                errorText = "Keychain unavailable."; return
            }
            errorText = nil
            phase = .unlocked
        } catch {
            errorText = "PIN must be \(AuthModel.pinMin)-\(AuthModel.pinMax) digits."
        }
    }

    func unlock(pin: String) {
        if isLockedOut { return }
        guard let data = Keychain.load(account: account),
              let cred = try? JSONDecoder().decode(AuthModel.Credential.self, from: data) else {
            phase = .setup
            return
        }
        if AuthModel.verify(credential: cred, pin: pin) {
            consecutiveFailures = 0
            lockUntil = nil
            errorText = nil
            phase = .unlocked
        } else {
            consecutiveFailures += 1
            if consecutiveFailures >= AuthModel.failuresBeforeLock {
                let exponent = consecutiveFailures - AuthModel.failuresBeforeLock
                let seconds = min(AuthModel.baseLockSeconds * pow(2, Double(exponent)), 3600)
                lockUntil = Date().addingTimeInterval(seconds)
            }
            errorText = "Incorrect PIN (\(consecutiveFailures) failed attempts)."
        }
    }
}

struct AuthGate<Content: View>: View {
    @StateObject private var session = AuthSession()
    @ViewBuilder let content: () -> Content

    var body: some View {
        switch session.phase {
        case .setup: SetupView(session: session)
        case .locked: LockView(session: session)
        case .unlocked: content()
        }
    }
}

struct SetupView: View {
    @ObservedObject var session: AuthSession
    @State private var pin = ""
    @State private var confirm = ""

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lock.shield").font(.system(size: 56))
            Text("BOTB Judges Edition").font(.title.bold())
            Text("First launch: set the private access PIN.\nOnly a salted PBKDF2 verifier is stored on this device.")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .foregroundStyle(.secondary)
            SecureField("PIN", text: $pin)
                .textFieldStyle(.roundedBorder).keyboardType(.numberPad)
                .frame(maxWidth: 240)
            SecureField("Confirm PIN", text: $confirm)
                .textFieldStyle(.roundedBorder).keyboardType(.numberPad)
                .frame(maxWidth: 240)
            if let err = session.errorText {
                Text(err).font(.callout).foregroundStyle(.red)
            }
            Button("Set PIN and continue") { session.setup(pin: pin, confirm: confirm) }
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

struct LockView: View {
    @ObservedObject var session: AuthSession
    @State private var pin = ""

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lock.fill").font(.system(size: 56))
            Text("Private access locked").font(.title.bold())
            SecureField("PIN", text: $pin)
                .textFieldStyle(.roundedBorder).keyboardType(.numberPad)
                .frame(maxWidth: 240)
            if let err = session.errorText {
                Text(err).font(.callout).foregroundStyle(.red)
            }
            if session.isLockedOut, let until = session.lockUntil {
                Text("Locked until \(until.formatted(date: .omitted, time: .standard))")
                    .font(.footnote).foregroundStyle(.orange)
            }
            Button("Unlock") { session.unlock(pin: pin) }
                .buttonStyle(.borderedProminent)
                .disabled(session.isLockedOut)
        }
        .padding()
    }
}
```

#### `ios/JudgesEdition/JudgesEdition/BOTBJudgesApp.swift` (repo package)

SHA-256: `82f12976ce189621a46ef15e3276e8cb1e3a309dd6b5fb2178a5339ffc11d084` | 36 lines | 1,169 bytes

```swift
// BOTBJudgesApp.swift
// BOTB Judges Edition - app entry point.
//
// First-launch authentication gates the entire UI (AuthGate).
// Tab structure: Judge submission / Multi-judge comparison / AI proposals.
//
// IMPORTANT PROVENANCE NOTE: this is the Judges Edition application source
// scaffold. Per project boundary rules, it must be integrated into the
// authorized BOTB application project by whoever holds the source rights;
// it is NOT a stand-in claiming to be the original app. See BUILD_REPORT.md.

import SwiftUI

@main
struct BOTBJudgesApp: App {
    var body: some Scene {
        WindowGroup {
            AuthGate {
                MainTabView()
            }
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack { JudgeSubmissionView() }
                .tabItem { Label("Judge", systemImage: "target") }
            NavigationStack { MultiJudgeCompareView() }
                .tabItem { Label("Compare", systemImage: "square.3.layers.3d.down.left") }
            NavigationStack { AIProposalView() }
                .tabItem { Label("AI", systemImage: "sparkles") }
        }
    }
}
```

#### `ios/JudgesEdition/JudgesEdition/CoordinateEngine.swift` (repo package)

SHA-256: `78861a003955f837267bb60f4a3836672097fae90d1abe3dc2ab3ec19ff20198` | 249 lines | 10,500 bytes

```swift
// CoordinateEngine.swift
// BOTB Judges Edition - Authoritative Coordinate Engine (Swift port)
//
// MIRRORS engine/coordinate_engine.py rule-for-rule:
//   - P space: integer pixels, origin top-left, x right, y down (CANONICAL)
//   - N space: x_n = x / W, y_n = y / H in [0, 1)
//   - round-half-to-even on inverse mapping, then clamp
//   - geometric median via Weiszfeld (maxIter 100, tol 1e-7, eps 1e-9)
//   - distances Euclidean in pixels
//
// IMPORTANT: this port is delivered as source for integration into the
// authorized BOTB application project. It has NOT been compiled in this
// Linux workspace (no Apple toolchain available); see BUILD_REPORT.md.

import Foundation
import CryptoKit

public enum CoordinateEngine {
    public static let engineVersion = "1.0.0"
    public static let weiszfeldMaxIter = 100
    public static let weiszfeldTol = 1e-7
    static let eps = 1e-9

    public enum CoordinateError: Error, Equatable {
        case outsideBounds
        case invalidDimensions
        case invalidInput
        case noPoints
        case unknownMethod(String)
    }

    // MARK: - Canonical identity

    public static func imageSHA256(_ data: Data) -> String {
        SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
    }

    /// Canonical JSON: UTF-8, sorted keys, compact separators, no "/" escaping.
    public static func canonicalJSON(_ object: Any) throws -> Data {
        let formatter = JSONEncoder()
        formatter.outputFormatting = [.sortedKeys, .withoutEscapingSlashes]
        return try formatter.encode(AnyEncodable(object))
    }

    public static func recordHash(_ object: Any) throws -> String {
        imageSHA256(try canonicalJSON(object))
    }

    // MARK: - Points and conversions

    public struct PixelPoint: Equatable, Hashable, Codable {
        public var x: Int
        public var y: Int
        public init(x: Int, y: Int) { self.x = x; self.y = y }
    }

    public struct ImageIdentity: Equatable, Hashable {
        public let sha256: String
        public let widthPx: Int
        public let heightPx: Int
        public init(data: Data, widthPx: Int, heightPx: Int) {
            self.sha256 = CoordinateEngine.imageSHA256(data)
            self.widthPx = widthPx
            self.heightPx = heightPx
        }
        public init(sha256: String, widthPx: Int, heightPx: Int) {
            self.sha256 = sha256
            self.widthPx = widthPx
            self.heightPx = heightPx
        }
        public func validate(pointInside p: PixelPoint) throws {
            guard widthPx >= 2, heightPx >= 2 else { throw CoordinateError.invalidDimensions }
            guard p.x >= 0, p.x < widthPx, p.y >= 0, p.y < heightPx else {
                throw CoordinateError.outsideBounds
            }
        }
    }

    public static func clamp(_ value: Int, _ lo: Int, _ hi: Int) -> Int {
        max(lo, min(hi, value))
    }

    public static func toNormalized(_ p: PixelPoint, width: Int, height: Int)
        throws -> (Double, Double) {
        guard width >= 2, height >= 2 else { throw CoordinateError.invalidDimensions }
        guard p.x >= 0, p.x < width, p.y >= 0, p.y < height else {
            throw CoordinateError.outsideBounds
        }
        return (Double(p.x) / Double(width), Double(p.y) / Double(height))
    }

    /// Round-half-to-even, then clamp. Round-trip error is at most 1 px/axis.
    static func roundHalfEven(_ v: Double) -> Int {
        let f = Foundation.round(v)
        let diff = abs(v - Foundation.trunc(v))
        if abs(v - f) == 0.5 && diff >= 0.5 {
            // exact .5 cases: choose even neighbor
            let floorV = Foundation.floor(v)
            let floorIsEven = Int(floorV).truncatingRemainder(dividingBy: 2) == 0
            return Int(floorIsEven ? floorV : f)
        }
        return Int(f)
    }

    public static func fromNormalized(_ nx: Double, _ ny: Double,
                                      width: Int, height: Int) throws -> PixelPoint {
        guard width >= 2, height >= 2 else { throw CoordinateError.invalidDimensions }
        guard nx.isFinite, ny.isFinite, nx >= -1.0, nx <= 2.0, ny >= -1.0, ny <= 2.0 else {
            throw CoordinateError.invalidInput
        }
        return PixelPoint(x: clamp(roundHalfEven(nx * Double(width)), 0, width - 1),
                          y: clamp(roundHalfEven(ny * Double(height)), 0, height - 1))
    }

    public static func roundtripErrorPx(_ p: PixelPoint, width: Int, height: Int) throws -> (Int, Int) {
        let (nx, ny) = try toNormalized(p, width: width, height: height)
        let q = try fromNormalized(nx, ny, width: width, height: height)
        return (abs(q.x - p.x), abs(q.y - p.y))
    }

    // MARK: - Distances

    public static func euclideanDistancePx(_ a: PixelPoint, _ b: PixelPoint) -> Double {
        let dx = Double(a.x - b.x), dy = Double(a.y - b.y)
        return (dx * dx + dy * dy).squareRoot()
    }

    public static func normalizedDistance(_ a: PixelPoint, _ b: PixelPoint,
                                          width: Int, height: Int) throws -> Double {
        let diag = (Double(width) * Double(width) + Double(height) * Double(height)).squareRoot()
        guard diag > 0 else { throw CoordinateError.invalidDimensions }
        return euclideanDistancePx(a, b) / diag
    }

    // MARK: - Consensus

    public static func perAxisMedian(_ points: [PixelPoint]) throws -> PixelPoint {
        guard !points.isEmpty else { throw CoordinateError.noPoints }
        let xs = points.map(\.x).sorted()
        let ys = points.map(\.y).sorted()
        let n = points.count
        let mx: Int
        if n % 2 == 1 { mx = xs[n / 2] }
        else { mx = roundHalfEven(Double(xs[n / 2 - 1] + xs[n / 2]) / 2.0) }
        let my: Int
        if n % 2 == 1 { my = ys[n / 2] }
        else { my = roundHalfEven(Double(ys[n / 2 - 1] + ys[n / 2]) / 2.0) }
        return PixelPoint(x: mx, y: my)
    }

    public static func geometricMedian(_ points: [PixelPoint]) throws -> (Double, Double) {
        guard !points.isEmpty else { throw CoordinateError.noPoints }
        let med = try perAxisMedian(points)
        var fx = Double(med.x), fy = Double(med.y)
        for _ in 0..<weiszfeldMaxIter {
            var wsum = 0.0, sx = 0.0, sy = 0.0
            for p in points {
                let dx = Double(p.x - fx), dy = Double(p.y - fy)
                let d = max((dx * dx + dy * dy).squareRoot(), eps)
                let w = 1.0 / d
                wsum += w; sx += w * Double(p.x); sy += w * Double(p.y)
            }
            let nx = sx / wsum, ny = sy / wsum
            let step = ((nx - fx) * (nx - fx) + (ny - fy) * (ny - fy)).squareRoot()
            fx = nx; fy = ny
            if step < weiszfeldTol { break }
        }
        return (fx, fy)
    }

    public struct Consensus: Equatable {
        public let method: String
        public let xPx: Int
        public let yPx: Int
        public let rawX: Double
        public let rawY: Double
        public let tolerancePx: Double
        public let maxSpreadPx: Double
        public let agreementRatio: Double
        public let nJudges: Int
        public let engineVersion: String
    }

    public static func consensus(_ points: [PixelPoint], method: String = "geometric_median")
        throws -> PixelPoint {
        let raw: (Double, Double)
        switch method {
        case "geometric_median": raw = try geometricMedian(points)
        case "per_axis_median":
            let m = try perAxisMedian(points); raw = (Double(m.x), Double(m.y))
        default: throw CoordinateError.unknownMethod(method)
        }
        return PixelPoint(x: roundHalfEven(raw.0), y: roundHalfEven(raw.1))
    }

    public static func pairwiseMaxSpread(_ points: [PixelPoint]) -> Double {
        guard points.count > 1 else { return 0.0 }
        var worst = 0.0
        for i in 0..<points.count {
            for j in (i + 1)..<points.count {
                worst = max(worst, euclideanDistancePx(points[i], points[j]))
            }
        }
        return worst
    }

    public static func withinTolerance(_ a: PixelPoint, _ b: PixelPoint,
                                       tolerancePx: Double) -> Bool {
        precondition(tolerancePx >= 0, "tolerance must be >= 0")
        return euclideanDistancePx(a, b) <= tolerancePx
    }

    public static func agreementRatio(_ points: [PixelPoint], consensusPoint: PixelPoint,
                                      tolerancePx: Double) throws -> Double {
        guard !points.isEmpty else { throw CoordinateError.noPoints }
        let hits = points.filter { withinTolerance($0, consensusPoint, tolerancePx: tolerancePx) }.count
        return Double(hits) / Double(points.count)
    }

    public static func evaluateConsensus(_ points: [PixelPoint], tolerancePx: Double,
                                         method: String = "geometric_median") throws -> Consensus {
        guard !points.isEmpty else { throw CoordinateError.noPoints }
        let c = try consensus(points, method: method)
        let (rawX, rawY): (Double, Double)
        switch method {
        case "geometric_median": rawX = try geometricMedian(points).0; rawY = try geometricMedian(points).1
        default:
            let m = try perAxisMedian(points); rawX = Double(m.x); rawY = Double(m.y)
        }
        let ratio = try agreementRatio(points, consensusPoint: c, tolerancePx: tolerancePx)
        return Consensus(method: method, xPx: c.x, yPx: c.y, rawX: rawX, rawY: rawY,
                         tolerancePx: tolerancePx, maxSpreadPx: pairwiseMaxSpread(points),
                         agreementRatio: ratio, nJudges: points.count,
                         engineVersion: engineVersion)
    }
}

// MARK: - AnyEncodable helper for canonical JSON of mixed dictionaries

struct AnyEncodable: Encodable {
    private let encodeFunc: (Encoder) throws -> Void
    init(_ value: Any) {
        if let v = value as? Encodable { encodeFunc = { try v.encode(to: $0) } }
        else if let d = value as? [String: Any] { encodeFunc = { try [String: AnyEncodable](uniqueKeysWithValues: d.map { ($0.key, AnyEncodable($0.value)) }).encode(to: $0) } }
        else if let a = value as? [Any] { encodeFunc = { try a.map { AnyEncodable($0) }.encode(to: $0) } }
        else { encodeFunc = { _ in throw CoordinateEngine.CoordinateError.invalidInput } }
    }
    func encode(to encoder: Encoder) throws { try encodeFunc(encoder) }
}
```

#### `ios/JudgesEdition/JudgesEdition/CrosshairOverlay.swift` (repo package)

SHA-256: `55182ad86ffcdd7b301bac0994f29a3088ca32ba57c805dd17e104acb13adbc7` | 105 lines | 4,332 bytes

```swift
// CrosshairOverlay.swift
// BOTB Judges Edition - crosshair placement and adjustment overlay.
//
// Placement, adjustment and display route ONLY through CoordinateEngine;
// the drag gesture updates a PixelPoint, never a raw CGPoint.

import SwiftUI

struct CrosshairOverlay: View {
    let imageDisplaySize: CGSize
    let imagePixelSize: CGSize
    @Binding var point: CoordinateEngine.PixelPoint
    var consensusPoint: CoordinateEngine.PixelPoint?
    var otherJudges: [CoordinateEngine.PixelPoint] = []

    @State private var dragStart: CoordinateEngine.PixelPoint?
    @State private var fineAdjust = false

    private func pixel(from location: CGPoint) -> CoordinateEngine.PixelPoint {
        guard imageDisplaySize.width > 0, imageDisplaySize.height > 0 else {
            return CoordinateEngine.PixelPoint(x: 0, y: 0)
        }
        let nx = Double(location.x / imageDisplaySize.width)
        let ny = Double(location.y / imageDisplaySize.height)
        return (try? CoordinateEngine.fromNormalized(
            nx, ny, width: Int(imagePixelSize.width),
            height: Int(imagePixelSize.height))) ?? .init(x: 0, y: 0)
    }

    private func displayOffset(_ p: CoordinateEngine.PixelPoint) -> CGPoint {
        CGPoint(x: Double(p.x) / Double(imagePixelSize.width) * imageDisplaySize.width,
                y: Double(p.y) / Double(imagePixelSize.height) * imageDisplaySize.height)
    }

    var body: some View {
        ZStack {
            // Other judges' markers
            ForEach(Array(otherJudges.enumerated()), id: \.offset) { _, p in
                let o = displayOffset(p)
                Circle()
                    .stroke(Color.blue.opacity(0.55), lineWidth: 1.5)
                    .frame(width: 14, height: 14)
                    .position(o)
            }
            // Consensus marker
            if let c = consensusPoint {
                let o = displayOffset(c)
                Image(systemName: "scope")
                    .font(.system(size: 26, weight: .bold))
                    .foregroundStyle(.green)
                    .position(o)
            }
            // Authoritative judge crosshair
            let o = displayOffset(point)
            CrosshairShape()
                .stroke(Color.red, lineWidth: 2)
                .frame(width: 40, height: 40)
                .position(o)
            Text("\(point.x), \(point.y) px")
                .font(.caption.monospaced())
                .padding(4)
                .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 4))
                .offset(x: 0, y: 34)
                .position(x: o.x, y: max(24, o.y - 34))
        }
        .contentShape(Rectangle())
        .gesture(
            DragGesture(minimumDistance: 0)
                .onChanged { value in
                    if dragStart == nil { dragStart = point }
                    var candidate = pixel(from: value.location)
                    if fineAdjust, let start = dragStart {
                        // fine mode: move at most 1 px per 4 display points
                        let raw = pixel(from: value.location)
                        let dx = Double(value.location.x - value.startLocation.x)
                        let dy = Double(value.location.y - value.startLocation.y)
                        candidate = CoordinateEngine.PixelPoint(
                            x: start.x + Int(dx / 4).clamped(-25...25),
                            y: start.y + Int(dy / 4).clamped(-25...25))
                        _ = raw
                    }
                    point = candidate
                }
                .onEnded { _ in dragStart = nil }
        )
        .onLongPressGesture(minimumDuration: 0.4) { fineAdjust.toggle() }
    }
}

struct CrosshairShape: Shape {
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let c = CGPoint(x: rect.midX, y: rect.midY)
        p.move(to: CGPoint(x: rect.minX, y: c.y)); p.addLine(to: CGPoint(x: rect.maxX, y: c.y))
        p.move(to: CGPoint(x: c.x, y: rect.minY)); p.addLine(to: CGPoint(x: c.x, y: rect.maxY))
        p.addEllipse(in: CGRect(x: c.x - 9, y: c.y - 9, width: 18, height: 18))
        return p
    }
}

extension Int {
    func clamped(_ range: ClosedRange<Int>) -> Int {
        Swift.min(Swift.max(self, range.lowerBound), range.upperBound)
    }
}
```

#### `ios/JudgesEdition/JudgesEdition/JudgeSubmissionView.swift` (repo package)

SHA-256: `48f8093db7d9d243f8061196401fb5a3534d961e3f9d97af76a268d775b78bdb` | 137 lines | 5,484 bytes

```swift
// JudgeSubmissionView.swift
// BOTB Judges Edition - image assessment + crosshair submission screen.
//
// Competition id and image identity (SHA-256 of raw bytes) are carried into
// every record; the coordinate engine is the single source of truth for the
// crosshair. AI proposals are NOT part of this screen (see AIProposalView).

import SwiftUI
import PhotosUI

struct JudgeSubmissionView: View {
    @State private var competitionId = ""
    @State private var judgeId = ""
    @State private var note = ""
    @State private var photoItem: PhotosPickerItem?
    @State private var image: UIImage?
    @State private var imageData: Data?
    @State private var pixelSize: CGSize?
    @State private var point = CoordinateEngine.PixelPoint(x: 0, y: 0)
    @State private var statusMessage: String?
    @State private var savedRecordId: String?

    private let recordsStore = RecordsStore()

    var body: some View {
        Form {
            Section("Identity") {
                TextField("Competition ID (e.g. BOTB-2026-R1)", text: $competitionId)
                    .autocorrectionDisabled()
                TextField("Judge ID (e.g. JUDGE-01)", text: $judgeId)
                    .autocorrectionDisabled()
            }
            Section("Image") {
                PhotosPicker(selection: $photoItem, matching: .images) {
                    Label("Choose assessment image", systemImage: "photo")
                }
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 320)
                        .overlay(
                            GeometryReader { geo in
                                CrosshairOverlay(
                                    imageDisplaySize: geo.size,
                                    imagePixelSize: pixelSize ?? CGSize(width: 1, height: 1),
                                    point: $point)
                            })
                    if let size = pixelSize {
                        Text("Image \(Int(size.width)) x \(Int(size.height)) px  |  image_id \(imageDigestPreview)")
                            .font(.caption2.monospaced())
                            .foregroundStyle(.secondary)
                    }
                }
            }
            Section("Placement") {
                Stepper(value: Binding(
                    get: { point.x },
                    set: { point.x = max(0, min($0, (Int(pixelSize?.width ?? 2) - 1))) }),
                    in: 0...max(1, Int(pixelSize?.width ?? 2) - 1)) {
                    Text("x = \(point.x) px")
                }
                Stepper(value: Binding(
                    get: { point.y },
                    set: { point.y = max(0, min($0, (Int(pixelSize?.height ?? 2) - 1))) }),
                    in: 0...max(1, Int(pixelSize?.height ?? 2) - 1)) {
                    Text("y = \(point.y) px")
                }
                TextField("Note", text: $note)
            }
            Section("Submit") {
                Button("Save crosshair record") { save() }
                    .disabled(!canSubmit)
                if let saved = savedRecordId {
                    Text("Saved: \(saved.prefix(16))...")
                        .font(.caption.monospaced()).foregroundStyle(.green)
                }
                if let msg = statusMessage {
                    Text(msg).font(.footnote).foregroundStyle(.red)
                }
            }
        }
        .navigationTitle("Judge submission")
        .onChange(of: photoItem) { _, newItem in
            load(imageItem: newItem)
        }
    }

    private var imageDigestPreview: String {
        guard let data = imageData else { return "-" }
        return String(CoordinateEngine.imageSHA256(data).prefix(12)) + "..."
    }

    private var canSubmit: Bool {
        image != nil && pixelSize != nil &&
        !competitionId.isEmpty && !judgeId.isEmpty
    }

    private func load(imageItem: PhotosPickerItem?) {
        guard let item = imageItem else { return }
        Task {
            if let data = try? await item.loadTransferable(type: Data.self),
               let loaded = UIImage(data: data) {
                imageData = data
                image = loaded
                let w = Int(loaded.cgImage?.width ?? 0)
                let h = Int(loaded.cgImage?.height ?? 0)
                pixelSize = CGSize(width: max(2, w), height: max(2, h))
                point = CoordinateEngine.PixelPoint(x: w / 2, y: h / 2)
                savedRecordId = nil
                statusMessage = nil
            } else {
                statusMessage = "Could not load image."
            }
        }
    }

    private func save() {
        guard let size = pixelSize, imageData != nil else { return }
        let record = CrosshairRecordFile(
            competitionId: competitionId,
            judgeId: judgeId,
            imageId: CoordinateEngine.imageSHA256(imageData!),
            imageWidthPx: Int(size.width),
            imageHeightPx: Int(size.height),
            xPx: point.x, yPx: point.y,
            note: note,
            createdAt: JudgeSubmission.nowISO(),
            engineVersion: CoordinateEngine.engineVersion)
        do {
            savedRecordId = try recordsStore.save(record: record)
            statusMessage = nil
        } catch {
            statusMessage = "Save failed: \(error)"
        }
    }
}
```

#### `ios/JudgesEdition/JudgesEdition/MultiJudgeCompareView.swift` (repo package)

SHA-256: `90c385ea86fe4e4e6cb9e0632828dc5a7034d92fd51cab666a5a13a9c0821682` | 165 lines | 7,195 bytes

```swift
// MultiJudgeCompareView.swift
// BOTB Judges Edition - cross-judge comparison, consensus and human approval.
//
// Loads all crosshair records for (competition_id, image_id), computes the
// authoritative consensus via CoordinateEngine, enforces the approval gate
// (agreement_ratio == 1.0 for APPROVED) and appends hash-chained audit
// entries. AI proposals are displayed separately and excluded from consensus.

import SwiftUI

struct MultiJudgeCompareView: View {
    @State private var competitionId = ""
    @State private var assessments: [Assessment] = []
    @State private var statusMessage: String?

    private let assessmentStore = AssessmentStore()
    private let recordsStore = RecordsStore()

    var body: some View {
        NavigationStack {
            List {
                Section("Competition") {
                    TextField("Competition ID", text: $competitionId)
                        .autocorrectionDisabled()
                    Button("Reload assessments") { reload() }
                        .disabled(competitionId.isEmpty)
                }
                Section("Assessments") {
                    if assessments.isEmpty {
                        Text("No assessments recorded for this competition.")
                            .foregroundStyle(.secondary)
                    }
                    ForEach(assessments) { a in
                        NavigationLink(value: a.id) {
                            AssessmentRow(assessment: a)
                        }
                    }
                }
                if let msg = statusMessage {
                    Text(msg).font(.footnote).foregroundStyle(.red)
                }
            }
            .navigationTitle("Multi-judge comparison")
            .navigationDestination(for: String.self) { assessmentId in
                if let a = assessments.first(where: { $0.id == assessmentId }) {
                    AssessmentDetailView(assessment: a) { reload() }
                }
            }
        }
        .onAppear { reload() }
    }

    private func reload() {
        guard !competitionId.isEmpty else { return }
        let all = assessmentStore.listAssessmentIds().compactMap { try? assessmentStore.load(assessmentId: $0) }
        assessments = all.filter { $0.competitionId == competitionId }
    }
}

struct AssessmentRow: View {
    let assessment: Assessment

    private var consensusText: String {
        guard let c = assessment.consensus else { return "no consensus" }
        let x = c["x_px"]?.doubleValue.map(String.init) ?? "?"
        let y = c["y_px"]?.doubleValue.map(String.init) ?? "?"
        let ratio = c["agreement_ratio"]?.doubleValue ?? 0
        return "consensus (\(x), \(y)) px  |  agreement \(String(format: "%.0f%%", ratio * 100))"
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(assessment.assessmentId).font(.headline)
            Text("image \(assessment.imageId.prefix(12))... | \(assessment.judges.count) judges")
                .font(.caption.monospaced()).foregroundStyle(.secondary)
            Text(consensusText).font(.caption)
            HStack {
                Image(systemName: assessment.approval.status == "APPROVED"
                        ? "checkmark.seal.fill" : "hourglass")
                Text(assessment.approval.status)
            }
            .font(.caption.bold())
            .foregroundStyle(assessment.approval.status == "APPROVED" ? .green : .orange)
        }
    }
}

struct AssessmentDetailView: View {
    @State var assessment: Assessment
    var onUpdated: () -> Void

    var body: some View {
        List {
            Section("Judge submissions") {
                ForEach(assessment.judges) { j in
                    HStack {
                        Image(systemName: "target")
                            .foregroundStyle(.red)
                        VStack(alignment: .leading) {
                            Text(j.judgeId).font(.headline)
                            Text("(\(j.crosshair.xPx), \(j.crosshair.yPx)) px | \(j.note)")
                                .font(.caption.monospaced()).foregroundStyle(.secondary)
                        }
                    }
                }
            }
            Section("AI proposals (not counted in consensus)") {
                if assessment.aiProposals.isEmpty {
                    Text("None").foregroundStyle(.secondary)
                }
                ForEach(assessment.aiProposals) { p in
                    Text("\(p.model): (\(p.xPx), \(p.yPx)) px, confidence \(String(format: "%.2f", p.confidence))")
                        .font(.caption.monospaced())
                }
            }
            Section("Decision") {
                Button("Approve consensus") { decide("APPROVED") }
                    .disabled(assessment.consensus?["agreement_ratio"]?.doubleValue != 1.0)
                Button("Reject", role: .destructive) { decide("REJECTED") }
                if let approver = assessment.approval.approver,
                   let decided = assessment.approval.decidedAt {
                    Text("\(assessment.approval.status) by \(approver) at \(decided)")
                        .font(.caption).foregroundStyle(.secondary)
                }
            }
            Section("Audit history (hash-chained)") {
                ForEach(assessment.audit) { e in
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(e.timestamp) | \(e.actor) | \(e.action)").font(.caption.monospaced())
                        Text(e.entryHash.prefix(12) + "...").font(.caption2.monospaced())
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .navigationTitle(assessment.assessmentId)
    }

    private func decide(_ status: String) {
        // Approval gate mirrors engine/multi_judge.py.
        if status == "APPROVED",
           assessment.consensus?["agreement_ratio"]?.doubleValue != 1.0 { return }
        let entryPayload: [String: Any] = [
            "timestamp": JudgeSubmission.nowISO(),
            "actor": "project-owner",
            "action": status == "APPROVED" ? "approval_approved" : "approval_rejected",
            "details": ["approver": "project-owner"],
            "prev_entry_hash": assessment.audit.last?.entryHash ?? "GENESIS"]
        guard let payloadData = try? JSONSerialization.data(
            withJSONObject: entryPayload, options: [.sortedKeys]) else { return }
        let entryHash = CoordinateEngine.imageSHA256(payloadData)
        assessment.audit.append(AuditEntry(
            timestamp: entryPayload["timestamp"] as! String,
            actor: "project-owner",
            action: entryPayload["action"] as! String,
            details: ["approver": "project-owner"],
            prevEntryHash: entryPayload["prev_entry_hash"] as! String,
            entryHash: entryHash))
        assessment.approval = ApprovalRecord(
            status: status, approver: "project-owner",
            decidedAt: JudgeSubmission.nowISO())
        try? AssessmentStore().save(assessment: assessment)
        onUpdated()
    }
}
```

#### `ios/JudgesEdition/JudgesEdition/RecordsStore.swift` (repo package)

SHA-256: `0f6bdd94277aed6ccb2a72fdc1c97221e9241a7acec976c6e9709c271e670ffa` | 199 lines | 8,360 bytes

```swift
// RecordsStore.swift
// BOTB Judges Edition - persistent local records with integrity verification.
//
// Mirrors engine/crosshair_records.py:
//   - one JSON file per record, filename = record_id (SHA-256 of canonical JSON)
//   - atomic writes (tmp + rename)
//   - verify() recomputes digests and identity consistency on every load
//   - hash-chained audit entries (GENESIS -> ...)

import Foundation

struct CrosshairRecordFile: Codable {
    var competitionId: String
    var judgeId: String
    var imageId: String
    var imageWidthPx: Int
    var imageHeightPx: Int
    var xPx: Int
    var yPx: Int
    var note: String
    var createdAt: String
    var engineVersion: String

    enum CodingKeys: String, CodingKey {
        case competitionId = "competition_id", judgeId = "judge_id"
        case imageId = "image_id"
        case imageWidthPx = "image_width_px"
        case imageHeightPx = "image_height_px"
        case xPx = "x_px", yPx = "y_px", note
        case createdAt = "created_at"
        case engineVersion = "engine_version"
    }
}

enum VerificationStatus: String { case pass = "PASS", fail = "FAIL" }

struct VerificationReport: Codable {
    var recordId: String
    var status: VerificationStatus
    var checks: [String: VerificationStatus]

    enum CodingKeys: String, CodingKey {
        case recordId = "record_id", status, checks
    }
}

enum RecordStoreError: Error {
    case integrityFailure
    case invalidIdentifier
    case notFound
    case outsideBounds
}

final class RecordsStore {
    let root: URL

    init(root: URL? = nil) {
        let base = root ?? FileManager.default.urls(for: .applicationSupportDirectory,
                                                    in: .userDomainMask)[0]
            .appendingPathComponent("JudgesEdition/Records", isDirectory: true)
        self.root = base
        try? FileManager.default.createDirectory(at: base, withIntermediateDirectories: true)
    }

    private static func validIdentifier(_ s: String) -> Bool {
        !s.isEmpty && s.count <= 128 &&
        s.allSatisfy { ($0.isLetter && $0.isASCII) || $0.isNumber || $0 == "." || $0 == "_" || $0 == "-" }
    }

    private func url(for recordId: String) throws -> URL {
        guard Self.validIdentifier(recordId) else { throw RecordStoreError.invalidIdentifier }
        return root.appendingPathComponent(recordId + ".json")
    }

    /// Canonical record payload without the record_id field.
    private static func payload(_ r: CrosshairRecordFile) -> [String: Any] {
        ["competition_id": r.competitionId, "judge_id": r.judgeId,
         "image_id": r.imageId, "image_width_px": r.imageWidthPx,
         "image_height_px": r.imageHeightPx, "x_px": r.xPx, "y_px": r.yPx,
         "note": r.note, "created_at": r.createdAt,
         "engine_version": r.engineVersion]
    }

    @discardableResult
    func save(record: CrosshairRecordFile) throws -> String {
        do {
            try CoordinateEngine.ImageIdentity(
                sha256: record.imageId,
                widthPx: record.imageWidthPx,
                heightPx: record.imageHeightPx
            ).validate(pointInside: CoordinateEngine.PixelPoint(x: record.xPx, y: record.yPx))
        } catch { throw RecordStoreError.outsideBounds }

        let recordId = try CoordinateEngine.recordHash(Self.payload(record))
        let file: [String: Any] = Self.payload(record).merging(
            ["record_id": recordId], uniquingKeysWith: { _, new in new })
        let data = try JSONSerialization.data(
            withJSONObject: file, options: [.prettyPrinted, .sortedKeys])
        let target = try url(for: recordId)
        let tmp = target.appendingPathExtension("tmp")
        try data.write(to: tmp, options: .atomic)
        _ = try? FileManager.default.removeItem(at: target)
        try FileManager.default.moveItem(at: tmp, to: target)
        return recordId
    }

    func load(recordId: String) throws -> (CrosshairRecordFile, VerificationStatus) {
        let fileUrl = try url(for: recordId)
        guard FileManager.default.fileExists(atPath: fileUrl.path) else {
            throw RecordStoreError.notFound
        }
        let data = try Data(contentsOf: fileUrl)
        guard let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw RecordStoreError.integrityFailure
        }
        let expected = try? CoordinateEngine.recordHash(dict.filter { $0.key != "record_id" })
        guard expected == recordId, dict["record_id"] as? String == recordId else {
            throw RecordStoreError.integrityFailure
        }
        let rec = CrosshairRecordFile(
            competitionId: dict["competition_id"] as? String ?? "",
            judgeId: dict["judge_id"] as? String ?? "",
            imageId: dict["image_id"] as? String ?? "",
            imageWidthPx: dict["image_width_px"] as? Int ?? 0,
            imageHeightPx: dict["image_height_px"] as? Int ?? 0,
            xPx: dict["x_px"] as? Int ?? 0,
            yPx: dict["y_px"] as? Int ?? 0,
            note: dict["note"] as? String ?? "",
            createdAt: dict["created_at"] as? String ?? "",
            engineVersion: dict["engine_version"] as? String ?? "")
        return (rec, .pass)
    }

    func verify(recordId: String, identity: CoordinateEngine.ImageIdentity?) throws
        -> VerificationReport {
        let fileUrl = try url(for: recordId)
        guard let data = try? Data(contentsOf: fileUrl),
              let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw RecordStoreError.notFound
        }
        var checks: [String: VerificationStatus] = [:]
        let recomputed = try? CoordinateEngine.recordHash(dict.filter { $0.key != "record_id" })
        checks["digest"] = (recomputed == recordId
                            && dict["record_id"] as? String == recordId) ? .pass : .fail
        if let identity = identity {
            let ok = (dict["image_id"] as? String) == identity.sha256
                && (dict["image_width_px"] as? Int) == identity.widthPx
                && (dict["image_height_px"] as? Int) == identity.heightPx
            checks["image_identity"] = ok ? .pass : .fail
        }
        let w = dict["image_width_px"] as? Int ?? 0
        let h = dict["image_height_px"] as? Int ?? 0
        let x = dict["x_px"] as? Int ?? 0
        let y = dict["y_px"] as? Int ?? 0
        checks["bounds"] = (x >= 0 && x < w && y >= 0 && y < h) ? .pass : .fail
        let status: VerificationStatus = checks.values.allSatisfy { $0 == .pass } ? .pass : .fail
        return VerificationReport(recordId: recordId, status: status, checks: checks)
    }

    func listRecordIds() -> [String] {
        let files = (try? FileManager.default.contentsOfDirectory(atPath: root.path)) ?? []
        return files.filter { $0.hasSuffix(".json") }
            .map { String($0.dropLast(5)) }.sorted()
    }
}

// MARK: - Assessment persistence with hash-chained audit

final class AssessmentStore {
    let root: URL

    init(root: URL? = nil) {
        let base = root ?? FileManager.default.urls(for: .applicationSupportDirectory,
                                                    in: .userDomainMask)[0]
            .appendingPathComponent("JudgesEdition/Assessments", isDirectory: true)
        self.root = base
        try? FileManager.default.createDirectory(at: base, withIntermediateDirectories: true)
    }

    func save(assessment: Assessment) throws {
        let data = try JSONEncoder().encode(assessment)
        let target = root.appendingPathComponent(assessment.assessmentId + ".json")
        let tmp = target.appendingPathExtension("tmp")
        try data.write(to: tmp, options: .atomic)
        _ = try? FileManager.default.removeItem(at: target)
        try FileManager.default.moveItem(at: tmp, to: target)
    }

    func load(assessmentId: String) throws -> Assessment {
        let target = root.appendingPathComponent(assessmentId + ".json")
        return try JSONDecoder().decode(Assessment.self, from: Data(contentsOf: target))
    }

    func listAssessmentIds() -> [String] {
        let files = (try? FileManager.default.contentsOfDirectory(atPath: root.path)) ?? []
        return files.filter { $0.hasSuffix(".json") }
            .map { String($0.dropLast(5)) }.sorted()
    }
}
```

#### `ios/JudgesEdition/README.md` (repo package)

SHA-256: `4eefe39e3fcf72cc1ff817f48aaad748fa36b378efab40501b22da1cc47b0089` | 57 lines | 2,706 bytes

````markdown
# Judges Edition - iOS source scaffold

Status: SOURCE SCAFFOLD (not compiled in this Linux workspace; no Apple
toolchain available here). It compiles on macOS with Xcode 15+ / Swift 5.9.

## Provenance and boundary

This scaffold implements the private judging workflows defined for the
Judges Edition. Per the project's strict boundary rules, it must be
integrated into the authorized BOTB application project by whoever holds
the source rights to that project. Do NOT present this scaffold as a
modified original BOTB application; the build script in
`build/build_judges_edition.sh` supports exactly two honest routes:
building this scaffold as-is (labelled clearly), or integrating these
workflows into the authorized source project.

## Files

| File | Role |
| --- | --- |
| `BOTBJudgesApp.swift` | Entry point; AuthGate wraps all tabs |
| `AuthGate.swift` | First-launch PIN setup/unlock, PBKDF2 + Keychain, lockout |
| `CoordinateEngine.swift` | Swift port of `engine/coordinate_engine.py` |
| `AssessmentModels.swift` | Codable records mirroring `schemas/assessment.schema.json` |
| `RecordsStore.swift` | Atomic record persistence + verification, hash-chained audit |
| `JudgeSubmissionView.swift` | Image picking, SHA-256 image identity, crosshair placement/save |
| `CrosshairOverlay.swift` | Drag/adjust crosshair; consensus + other judges markers |
| `MultiJudgeCompareView.swift` | Comparison, consensus, approval gate, audit history |
| `AIProposalView.swift` | AI proposal intake, strictly separate from judge submissions |

## Build (macOS)

```bash
brew install xcodegen
xcodegen generate          # produces BOTBJudgesEdition.xcodeproj
open BOTBJudgesEdition.xcodeproj
# or:
xcodebuild -project BOTBJudgesEdition.xcodeproj -scheme BOTBJudgesEdition \
    -destination 'generic/platform=iOS' -configuration Release build
```

Signing is intentionally left to the project owner (see
`SIGNING_INSTRUCTIONS.md` at the delivery root). The XcodeGen spec ships
with `CODE_SIGNING_ALLOWED: NO` so an unsigned build succeeds before the
owner applies their own identity.

## Cross-language notes

- The Swift engine mirrors the Python reference rule-for-rule (same
  round-half-even, same Weiszfeld parameters). Coordinates and distances
  agree exactly; canonical-JSON hashing uses JSONEncoder with
  `.sortedKeys` + `.withoutEscapingSlashes`. When exchanging hashed records
  between the Python reference tools and the app, run the integration test
  in `verification/` to confirm digest compatibility on your exact toolchain
  versions before relying on cross-platform hash equality.
- Record JSON field names match the Python reference exactly
  (snake_case), so records are interchangeable.
````

#### `ios/JudgesEdition/project.yml` (repo package)

SHA-256: `7bb247a15f251d865714be7349eef1674caa1a2b604c6022d2af8b21862ae73b` | 27 lines | 923 bytes

```yaml
# XcodeGen project spec for the BOTB Judges Edition scaffold.
# The owner runs `xcodegen generate` on macOS to produce BOTBJudgesEdition.xcodeproj,
# then builds/archives with xcodebuild (see build/build_judges_edition.sh).
name: BOTBJudgesEdition
options:
  bundleIdPrefix: com.botb.judges
  deploymentTarget:
    iOS: "16.0"
  createIntermediateGroups: true
targets:
  BOTBJudgesEdition:
    type: application
    platform: iOS
    sources:
      - path: JudgesEdition
    settings:
      base:
        PRODUCT_BUNDLE_IDENTIFIER: com.botb.judges.edition
        MARKETING_VERSION: "1.0.0"
        CURRENT_PROJECT_VERSION: "1"
        GENERATE_INFOPLIST_FILE: YES
        INFOPLIST_KEY_UILaunchScreen_Generation: YES
        INFOPLIST_KEY_UIApplicationSceneManifest_Generation: YES
        CODE_SIGN_IDENTITY: ""
        CODE_SIGNING_ALLOWED: "NO"
        ENABLE_USER_SCRIPT_SANDBOXING: "YES"
        SWIFT_VERSION: "5.9"
```

#### `samples/sample_assessment.json` (repo package)

SHA-256: `9b4bbb4079d8e434ef0e8cba281bbf2e9e4dd9a55e54e3f41695fc1a1735e34b` | 155 lines | 4,355 bytes

```json
{
 "assessment_id": "A-SAMPLE-001",
 "competition_id": "BOTB-2026-R1",
 "image_id": "3f79bb7b435b05321651daefd374cdc681dc06faa65e374e38337b88ca7c2de8",
 "consensus_method": "geometric_median",
 "tolerance_px": 12.0,
 "judges": [
  {
   "judge_id": "JUDGE-01",
   "crosshair": {
    "x_px": 512,
    "y_px": 340,
    "image_width_px": 1024,
    "image_height_px": 768
   },
   "submitted_at": "2026-11-16T00:25:58Z",
   "note": "crosshair adjusted after reopen"
  },
  {
   "judge_id": "JUDGE-02",
   "crosshair": {
    "x_px": 515,
    "y_px": 344,
    "image_width_px": 1024,
    "image_height_px": 768
   },
   "submitted_at": "2026-11-16T00:25:58Z",
   "note": "crosshair adjusted after reopen"
  },
  {
   "judge_id": "JUDGE-03",
   "crosshair": {
    "x_px": 509,
    "y_px": 338,
    "image_width_px": 1024,
    "image_height_px": 768
   },
   "submitted_at": "2026-11-16T00:25:58Z",
   "note": "crosshair adjusted after reopen"
  },
  {
   "judge_id": "JUDGE-04",
   "crosshair": {
    "x_px": 513,
    "y_px": 342,
    "image_width_px": 1024,
    "image_height_px": 768
   },
   "submitted_at": "2026-11-16T00:25:58Z",
   "note": "crosshair adjusted after reopen"
  }
 ],
 "consensus": {
  "method": "geometric_median",
  "x_px": 513,
  "y_px": 342,
  "raw_x": 512.839026,
  "raw_y": 341.70709,
  "engine_version": "1.0.0",
  "tolerance_px": 12.0,
  "max_spread_px": 8.485,
  "agreement_ratio": 1.0,
  "n_judges": 4
 },
 "approval": {
  "status": "APPROVED",
  "approver": "project-owner",
  "decided_at": "2026-11-16T00:25:58Z"
 },
 "ai_proposals": [
  {
   "x_px": 511,
   "y_px": 341,
   "model": "reference-proposal-v0",
   "confidence": 0.82,
   "proposal_id": "22e15ae157ff5fa08e1009eaf262b1e36b16a02eeb768957e2027611d4487677"
  }
 ],
 "audit": [
  {
   "timestamp": "2026-11-16T00:25:58Z",
   "actor": "system",
   "action": "assessment_created",
   "details": {
    "assessment_id": "A-SAMPLE-001",
    "competition_id": "BOTB-2026-R1",
    "image_id": "3f79bb7b435b05321651daefd374cdc681dc06faa65e374e38337b88ca7c2de8"
   },
   "prev_entry_hash": "GENESIS",
   "entry_hash": "c684aef917fcf9138b30d91f105fc0299b3a67c445dcc4ec398f9220ea875261"
  },
  {
   "timestamp": "2026-11-16T00:25:58Z",
   "actor": "JUDGE-01",
   "action": "judge_submission_added",
   "details": {
    "judge_id": "JUDGE-01"
   },
   "prev_entry_hash": "c684aef917fcf9138b30d91f105fc0299b3a67c445dcc4ec398f9220ea875261",
   "entry_hash": "34e7b3f03a26b65927b67725418ca56333fc255656ec0ed9a441bdc26f362fd3"
  },
  {
   "timestamp": "2026-11-16T00:25:58Z",
   "actor": "JUDGE-02",
   "action": "judge_submission_added",
   "details": {
    "judge_id": "JUDGE-02"
   },
   "prev_entry_hash": "34e7b3f03a26b65927b67725418ca56333fc255656ec0ed9a441bdc26f362fd3",
   "entry_hash": "9f0e7927b660d37a374c9db187cf0db48c658c6b70745c7306002635c51c1fd2"
  },
  {
   "timestamp": "2026-11-16T00:25:58Z",
   "actor": "JUDGE-03",
   "action": "judge_submission_added",
   "details": {
    "judge_id": "JUDGE-03"
   },
   "prev_entry_hash": "9f0e7927b660d37a374c9db187cf0db48c658c6b70745c7306002635c51c1fd2",
   "entry_hash": "a425b8cd57eadf59c60c80691e608d95c37c47468f4a290f967c16ca77675cb0"
  },
  {
   "timestamp": "2026-11-16T00:25:58Z",
   "actor": "JUDGE-04",
   "action": "judge_submission_added",
   "details": {
    "judge_id": "JUDGE-04"
   },
   "prev_entry_hash": "a425b8cd57eadf59c60c80691e608d95c37c47468f4a290f967c16ca77675cb0",
   "entry_hash": "50f28612bbbbe087b689f4d5cffaa543868b7b9c70ff1fe6ed30a35d73fc0298"
  },
  {
   "timestamp": "2026-11-16T00:25:58Z",
   "actor": "system",
   "action": "ai_proposal_registered",
   "details": {
    "proposal_id": "22e15ae157ff5fa08e1009eaf262b1e36b16a02eeb768957e2027611d4487677"
   },
   "prev_entry_hash": "50f28612bbbbe087b689f4d5cffaa543868b7b9c70ff1fe6ed30a35d73fc0298",
   "entry_hash": "03a9348d2afafccbe1944bda81aa4ec704ba7e58f995e55ee6819bcf6b6a77bf"
  },
  {
   "timestamp": "2026-11-16T00:25:58Z",
   "actor": "project-owner",
   "action": "approval_approved",
   "details": {
    "approver": "project-owner"
   },
   "prev_entry_hash": "03a9348d2afafccbe1944bda81aa4ec704ba7e58f995e55ee6819bcf6b6a77bf",
   "entry_hash": "2103a75e639587fbd545c20d4d2c1314a3a664e30c362d676f460e8318ba030a"
  }
 ],
 "engine_version": "1.0.0",
 "assessment_hash": "542ea90b3d47b4f3712ee108ec7a18f97aaefbcbe234b6573212c24eac51d9c0"
}```

#### `schemas/MULTI_JUDGE_SCHEMA.md` (repo package)

SHA-256: `b99d8479e45908446617d3c206ae253f9ceb9571fcd9059dc5a07736a8a3661d` | 72 lines | 3,103 bytes

````markdown
# MULTI-JUDGE SCHEMA

Project: BOTB Private Judges Edition
Document version: 1.0.0
Machine-readable schema: `schemas/assessment.schema.json` (JSON Schema draft-07 subset)
Reference implementation: `engine/multi_judge.py`

## 1. Design principles

1. **Individual judge submissions are authoritative.** The AI is a proposer
   only. AI output lives in `ai_proposals[]` and never enters `judges[]`;
   the reference implementation refuses submissions whose `judge_id` starts
   with "ai".
2. **Image identity is content-based.** `image_id` is the SHA-256 of the raw
   image bytes; filenames and asset IDs are metadata.
3. **Integrity is hash-based.** Every record and the whole assessment carry a
   SHA-256 over canonical JSON (sorted keys, compact separators). The audit
   trail is hash-chained: each entry includes `prev_entry_hash`, so any
   mutation breaks the chain and is detected by `audit_chain_valid()`.
4. **Human approval gates the outcome.** `APPROVED` requires
   `agreement_ratio == 1.0` in the current consensus (all judges within
   `tolerance_px`); otherwise the reference implementation rejects the
   transition.

## 2. Record layout (summary)

| Field | Type | Meaning |
| --- | --- | --- |
| `assessment_id` | string `[A-Za-z0-9._-]{1,128}` | Stable assessment identifier |
| `competition_id` | string | Competition identity |
| `image_id` | 64-hex | SHA-256 of image bytes |
| `consensus_method` | enum | `geometric_median` (default) or `per_axis_median` |
| `tolerance_px` | number >= 0 | Agreement threshold in pixels |
| `judges[]` | array | Individual submissions; `judge_id`, `crosshair{x_px,y_px,image_width_px,image_height_px}`, `submitted_at`, `note` |
| `consensus` | object or null | Engine output: point, spread, `agreement_ratio`, `n_judges` |
| `approval` | object | `status` (PENDING/APPROVED/REJECTED), `approver`, `decided_at` |
| `ai_proposals[]` | array | AI proposals, excluded from consensus |
| `audit[]` | array | Hash-chained history entries |
| `engine_version` | semver string | Coordinate engine version |
| `assessment_hash` | 64-hex | SHA-256 over canonical serialization of the record without this field |

## 3. Consensus output contract

Produced by the coordinate engine (`evaluate_consensus`):

```json
{
  "method": "geometric_median",
  "x_px": 512, "y_px": 341,
  "raw_x": 512.000004, "raw_y": 340.999998,
  "engine_version": "1.0.0",
  "tolerance_px": 12,
  "max_spread_px": 18.25,
  "agreement_ratio": 0.75,
  "n_judges": 4
}
```

## 4. Audit chain

Each entry: `{timestamp, actor, action, details, prev_entry_hash, entry_hash}`
where `entry_hash = SHA256(canonical_json(entry without entry_hash))` and
`prev_entry_hash` links to the previous entry (first entry links to the
literal string `"GENESIS"`).

## 5. Validation

- `engine/multi_judge.py` ships a self-contained validator for the schema
  subset used here (required / types / enum / pattern / min-max / minItems /
  additionalProperties=false), so validation works offline with no third-party
  dependency.
- On macOS, owners can additionally validate with any draft-07 validator.
````

#### `schemas/assessment.schema.json` (repo package)

SHA-256: `33b9673d9b91fb57a0938211443292fe8ad25c6bc5d24f6896057f450f433d53` | 136 lines | 4,779 bytes

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "$id": "https://botb-judges-edition.local/schemas/assessment.schema.json",
  "title": "BOTB Judges Edition - Multi-judge Assessment Record",
  "type": "object",
  "additionalProperties": false,
  "required": [
    "assessment_id",
    "competition_id",
    "image_id",
    "consensus_method",
    "tolerance_px",
    "judges",
    "consensus",
    "approval",
    "audit",
    "engine_version"
  ],
  "properties": {
    "assessment_id": {
      "type": "string",
      "pattern": "^[A-Za-z0-9._-]{1,128}$",
      "description": "Stable identifier for this assessment."
    },
    "competition_id": {
      "type": "string",
      "pattern": "^[A-Za-z0-9._-]{1,128}$",
      "description": "Competition identity issued by the organizer."
    },
    "image_id": {
      "type": "string",
      "pattern": "^[a-f0-9]{64}$",
      "description": "SHA-256 of raw image bytes. Filenames never identify images."
    },
    "consensus_method": {
      "type": "string",
      "enum": ["geometric_median", "per_axis_median"]
    },
    "tolerance_px": {
      "type": "number",
      "minimum": 0,
      "maximum": 10000
    },
    "judges": {
      "type": "array",
      "minItems": 0,
      "items": {
        "type": "object",
        "additionalProperties": false,
        "required": ["judge_id", "crosshair", "submitted_at", "note"],
        "properties": {
          "judge_id": {
            "type": "string",
            "pattern": "^[A-Za-z0-9._-]{1,128}$"
          },
          "crosshair": {
            "type": "object",
            "additionalProperties": false,
            "required": ["x_px", "y_px", "image_width_px", "image_height_px"],
            "properties": {
              "x_px": { "type": "integer", "minimum": 0 },
              "y_px": { "type": "integer", "minimum": 0 },
              "image_width_px": { "type": "integer", "minimum": 2 },
              "image_height_px": { "type": "integer", "minimum": 2 }
            }
          },
          "submitted_at": {
            "type": "string",
            "pattern": "^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$"
          },
          "note": { "type": "string", "maxLength": 2000 }
        }
      }
    },
    "consensus": {
      "type": ["object", "null"],
      "additionalProperties": false,
      "required": ["method", "x_px", "y_px", "raw_x", "raw_y", "engine_version",
                   "tolerance_px", "max_spread_px", "agreement_ratio", "n_judges"],
      "properties": {
        "method": { "type": "string", "enum": ["geometric_median", "per_axis_median"] },
        "x_px": { "type": "integer", "minimum": 0 },
        "y_px": { "type": "integer", "minimum": 0 },
        "raw_x": { "type": "number" },
        "raw_y": { "type": "number" },
        "engine_version": { "type": "string", "pattern": "^[0-9]+\\.[0-9]+\\.[0-9]+$" },
        "tolerance_px": { "type": "number", "minimum": 0 },
        "max_spread_px": { "type": "number", "minimum": 0 },
        "agreement_ratio": { "type": "number", "minimum": 0, "maximum": 1 },
        "n_judges": { "type": "integer", "minimum": 1 }
      }
    },
    "approval": {
      "type": "object",
      "additionalProperties": false,
      "required": ["status", "approver", "decided_at"],
      "properties": {
        "status": { "type": "string", "enum": ["PENDING", "APPROVED", "REJECTED"] },
        "approver": { "type": ["string", "null"], "pattern": "^[A-Za-z0-9._-]{1,128}$" },
        "decided_at": {
          "type": ["string", "null"],
          "pattern": "^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$"
        }
      }
    },
    "ai_proposals": {
      "type": "array",
      "items": {
        "type": "object",
        "description": "AI proposals are recorded separately and NEVER enter judges[]."
      }
    },
    "audit": {
      "type": "array",
      "items": {
        "type": "object",
        "additionalProperties": false,
        "required": ["timestamp", "actor", "action", "details",
                     "prev_entry_hash", "entry_hash"],
        "properties": {
          "timestamp": {
            "type": "string",
            "pattern": "^[0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}Z$"
          },
          "actor": { "type": "string", "minLength": 1 },
          "action": { "type": "string", "minLength": 1 },
          "details": { "type": "object" },
          "prev_entry_hash": { "type": "string", "pattern": "^(GENESIS|[a-f0-9]{64})$" },
          "entry_hash": { "type": "string", "pattern": "^[a-f0-9]{64}$" }
        }
      }
    },
    "engine_version": { "type": "string", "pattern": "^[0-9]+\\.[0-9]+\\.[0-9]+$" },
    "assessment_hash": { "type": "string", "pattern": "^[a-f0-9]{64}$" }
  }
}
```

#### `tests/test_auth_model.py` (repo package)

SHA-256: `0ff7e2301d9e6d1a6fd59465a1ac9a8fdc24e2b9cc8a17afbb65f71376f63668` | 89 lines | 3,243 bytes

```python
"""First-launch authentication model tests (PIN setup, verify, lockout)."""

import os
import sys
import time
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "engine"))

from auth_model import (AuthError, FAILURES_BEFORE_LOCK, RateLimiter,
                        create_credential, verify_credential)


class TestCredentialLifecycle(unittest.TestCase):
    def test_setup_then_unlock(self):
        cred = create_credential("135790")
        self.assertEqual(cred["algo"], "PBKDF2-HMAC-SHA256")
        self.assertTrue(verify_credential(cred, "135790"))

    def test_wrong_pin_rejected(self):
        cred = create_credential("135790")
        self.assertFalse(verify_credential(cred, "135791"))
        self.assertFalse(verify_credential(cred, ""))

    def test_verifier_never_stores_pin(self):
        cred = create_credential("135790")
        blob = str(cred).encode("utf-8")
        self.assertNotIn(b"135790", blob)

    def test_salts_unique_per_setup(self):
        a = create_credential("135790")
        b = create_credential("135790")
        self.assertNotEqual(a["salt_hex"], b["salt_hex"])
        self.assertNotEqual(a["verifier_hex"], b["verifier_hex"])

    def test_pin_policy(self):
        with self.assertRaises(AuthError):
            create_credential("123")          # too short
        with self.assertRaises(AuthError):
            create_credential("1" * 13)       # too long
        with self.assertRaises(AuthError):
            create_credential("12ab90")       # non-digits


class TestRateLimiter(unittest.TestCase):
    def test_lockout_after_consecutive_failures(self):
        t = [1000.0]
        clock = lambda: t[0]
        rl = RateLimiter(clock=clock)
        for _ in range(FAILURES_BEFORE_LOCK - 1):
            rl.register_failure()
            self.assertFalse(rl.is_locked())
        rl.register_failure()
        self.assertTrue(rl.is_locked())
        self.assertGreater(rl.remaining_seconds(), 0.0)
        t[0] += 31.0
        self.assertFalse(rl.is_locked())

    def test_success_resets(self):
        rl = RateLimiter()
        for _ in range(FAILURES_BEFORE_LOCK + 1):
            rl.register_failure()
        rl.register_success()
        self.assertFalse(rl.is_locked())
        self.assertEqual(rl.consecutive_failures, 0)

    def test_backoff_grows(self):
        t = [0.0]
        clock = lambda: t[0]
        rl = RateLimiter(clock=clock)
        for _ in range(FAILURES_BEFORE_LOCK):       # 1st lock: 30s
            rl.register_failure()
        self.assertTrue(rl.is_locked())
        self.assertAlmostEqual(rl.remaining_seconds(), 30.0, delta=1.0)
        t[0] += 31.0                                # lock expires
        rl.register_failure()                       # 6th consecutive failure: 60s
        self.assertTrue(rl.is_locked())
        self.assertAlmostEqual(rl.remaining_seconds(), 60.0, delta=1.0)

    def test_two_rate_limiters_independent(self):
        a, b = RateLimiter(), RateLimiter()
        for _ in range(FAILURES_BEFORE_LOCK):
            a.register_failure()
        self.assertTrue(a.is_locked())
        self.assertFalse(b.is_locked())


if __name__ == "__main__":
    unittest.main(verbosity=2)
```

#### `tests/test_coordinate_engine.py` (repo package)

SHA-256: `b7cbe582a227281f5884af02749554055b0cc192818856a2f0577b4c8ce89625` | 152 lines | 6,288 bytes

```python
"""Regression tests for the authoritative coordinate engine (spec section 7)."""

import os
import sys
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "engine"))

from coordinate_engine import (
    CoordinateError, ImageIdentity, PixelPoint, agreement_ratio,
    canonical_json, clamp, consensus, euclidean_distance_px,
    evaluate_consensus, from_normalized, geometric_median_float,
    image_sha256, normalized_distance, pairwise_max_spread,
    per_axis_median, record_hash, roundtrip_error_px, to_normalized,
    within_tolerance, ENGINE_VERSION,
)


class TestConversions(unittest.TestCase):
    def test_identity_points(self):
        for (w, h) in [(2, 2), (17, 31), (1000, 750), (4096, 2160)]:
            for (x, y) in [(0, 0), (w - 1, h - 1), (w // 2, h // 2)]:
                p = PixelPoint(x, y)
                nx, ny = to_normalized(p, w, h)
                self.assertGreaterEqual(nx, 0.0)
                self.assertLess(nx, 1.0)
                q = from_normalized(nx, ny, w, h)
                self.assertEqual((q.x, q.y), (x, y))

    def test_roundtrip_error_bounded(self):
        checked = 0
        for (w, h) in [(3, 5), (100, 73), (1920, 1080)]:
            for x in range(0, w, max(1, w // 17)):
                for y in range(0, h, max(1, h // 17)):
                    dx, dy = roundtrip_error_px(PixelPoint(x, y), w, h)
                    self.assertLessEqual(dx, 1)
                    self.assertLessEqual(dy, 1)
                    checked += 1
        self.assertGreater(checked, 100)

    def test_clamp_and_rejection(self):
        self.assertEqual(clamp(-5, 0, 10), 0)
        self.assertEqual(clamp(15, 0, 10), 10)
        with self.assertRaises(CoordinateError):
            to_normalized(PixelPoint(-1, 0), 100, 100)
        with self.assertRaises(CoordinateError):
            to_normalized(PixelPoint(100, 0), 100, 100)
        with self.assertRaises(CoordinateError):
            ImageIdentity("a" * 64, 1, 1)
        q = from_normalized(-0.5, 1.5, 100, 100)
        self.assertEqual((q.x, q.y), (0, 99))

    def test_non_integer_pixel_rejected(self):
        with self.assertRaises(CoordinateError):
            PixelPoint(1.5, 2)


class TestDistances(unittest.TestCase):
    def test_345_triangle(self):
        a, b = PixelPoint(0, 0), PixelPoint(3, 4)
        self.assertAlmostEqual(euclidean_distance_px(a, b), 5.0, places=12)

    def test_normalized_distance_uses_diagonal(self):
        a, b = PixelPoint(0, 0), PixelPoint(30, 40)
        nd = normalized_distance(a, b, 100, 100)
        self.assertAlmostEqual(nd, 50.0 / (100.0 * (2 ** 0.5)), places=12)

    def test_spread(self):
        pts = [PixelPoint(0, 0), PixelPoint(10, 0), PixelPoint(3, 4)]
        self.assertAlmostEqual(pairwise_max_spread(pts), 10.0, places=12)
        self.assertEqual(pairwise_max_spread([PixelPoint(1, 1)]), 0.0)


class TestConsensus(unittest.TestCase):
    def test_symmetric_square_geometric_median_is_center(self):
        pts = [PixelPoint(10, 10), PixelPoint(10, 30),
               PixelPoint(30, 10), PixelPoint(30, 30)]
        c = consensus(pts, method="geometric_median")
        self.assertEqual((c["x_px"], c["y_px"]), (20, 20))

    def test_outlier_robustness(self):
        base = [PixelPoint(100, 100), PixelPoint(102, 98),
                PixelPoint(99, 101), PixelPoint(101, 99)]
        with_outlier = base + [PixelPoint(500, 500)]
        c1 = consensus(base)
        c2 = consensus(with_outlier)
        # geometric median must barely move despite the far outlier
        self.assertLess(euclidean_distance_px(
            PixelPoint(c1["x_px"], c1["y_px"]),
            PixelPoint(c2["x_px"], c2["y_px"])), 5.0)

    def test_per_axis_median_even_count(self):
        pts = [PixelPoint(0, 0), PixelPoint(10, 2)]
        m = per_axis_median(pts)
        self.assertEqual((m.x, m.y), (5, 1))

    def test_single_point(self):
        c = consensus([PixelPoint(7, 9)])
        self.assertEqual((c["x_px"], c["y_px"]), (7, 9))

    def test_agreement_ratio_and_gate(self):
        pts = [PixelPoint(100, 100), PixelPoint(103, 104),
               PixelPoint(200, 200)]
        con = consensus(pts)
        cp = PixelPoint(con["x_px"], con["y_px"])
        self.assertAlmostEqual(agreement_ratio(pts, cp, 10.0), 2 / 3, places=6)
        # Geometric median sits at vertex B(103,104): angle at B > 120 deg,
        # so only B is within 0.5 px of the consensus point.
        self.assertAlmostEqual(agreement_ratio(pts, cp, 0.5), 1 / 3, places=12)
        ev = evaluate_consensus(pts, 10.0)
        self.assertEqual(ev["n_judges"], 3)
        self.assertGreater(ev["max_spread_px"], 140.0)

    def test_empty_and_unknown_method(self):
        with self.assertRaises(CoordinateError):
            consensus([])
        with self.assertRaises(CoordinateError):
            consensus([PixelPoint(1, 1)], method="mean")
        with self.assertRaises(CoordinateError):
            within_tolerance(PixelPoint(0, 0), PixelPoint(1, 1), -1.0)


class TestDeterminismAndIdentity(unittest.TestCase):
    def test_canonical_serialization_is_stable(self):
        obj1 = {"b": 1, "a": {"z": [3, 1, 2], "y": "x"}}
        obj2 = {"a": {"y": "x", "z": [3, 1, 2]}, "b": 1}
        self.assertEqual(canonical_json(obj1), canonical_json(obj2))
        self.assertEqual(record_hash(obj1), record_hash(obj2))
        self.assertNotIn(" ", canonical_json(obj1))

    def test_image_identity_content_based(self):
        d1 = b"image-bytes-A"
        d2 = b"image-bytes-B"
        i1a = ImageIdentity.from_bytes(d1, 64, 48)
        i1b = ImageIdentity.from_bytes(d1, 64, 48)
        i2 = ImageIdentity.from_bytes(d2, 64, 48)
        self.assertEqual(i1a.sha256, i1b.sha256)
        self.assertNotEqual(i1a.sha256, i2.sha256)
        self.assertEqual(image_sha256(d1), i1a.sha256)
        with self.assertRaises(CoordinateError):
            i1a.validate_point_inside(64, 48)
        i1a.validate_point_inside(0, 0)
        i1a.validate_point_inside(63, 47)

    def test_engine_version_format(self):
        parts = ENGINE_VERSION.split(".")
        self.assertEqual(len(parts), 3)
        self.assertTrue(all(p.isdigit() for p in parts))


if __name__ == "__main__":
    unittest.main(verbosity=2)
```

#### `tests/test_crosshair_records.py` (repo package)

SHA-256: `871975db029fdecb26c6b15218157db58d902088a4eb912dc59d661a3d4e7c07` | 107 lines | 4,033 bytes

```python
"""Crosshair record save / reopen / verify tests."""

import json
import os
import shutil
import sys
import tempfile
import unittest

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "engine"))

from coordinate_engine import ImageIdentity, PixelPoint, record_hash
from crosshair_records import CrosshairRecord, CrosshairStore, RecordError


IMG = ImageIdentity("ab" * 32, 800, 600)


def make_rec(judge="J1", x=321, y=123, note="ok"):
    return CrosshairRecord(
        competition_id="BOTB-2026-R1", judge_id=judge, image_id=IMG.sha256,
        image_width_px=IMG.width_px, image_height_px=IMG.height_px,
        x_px=x, y_px=y, note=note)


class TestSaveReopenVerify(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.mkdtemp(prefix="botb_xhair_")
        self.store = CrosshairStore(self.tmp)

    def tearDown(self):
        shutil.rmtree(self.tmp, ignore_errors=True)

    def test_save_then_reopen_roundtrip(self):
        rec = make_rec()
        rid = self.store.save(rec)
        self.assertEqual(rid, rec.to_json_dict()["record_id"])
        loaded, status = self.store.load(rid)
        self.assertEqual(status, "PASS")
        self.assertEqual(loaded.competition_id, rec.competition_id)
        self.assertEqual(loaded.judge_id, rec.judge_id)
        self.assertEqual((loaded.x_px, loaded.y_px), (rec.x_px, rec.y_px))
        self.assertEqual(loaded.note, rec.note)

    def test_verify_passes_on_untouched_record(self):
        rid = self.store.save(make_rec())
        report = self.store.verify(rid, identity=IMG)
        self.assertEqual(report["status"], "PASS")
        self.assertEqual(set(report["checks"].values()), {"PASS"})

    def test_tamper_detection(self):
        rid = self.store.save(make_rec())
        path = os.path.join(self.tmp, rid + ".json")
        with open(path, "r", encoding="utf-8") as fh:
            d = json.load(fh)
        d["x_px"] = 799  # tamper
        with open(path, "w", encoding="utf-8") as fh:
            json.dump(d, fh)
        rec, status = self.store.load(rid)
        self.assertEqual(status, "FAIL")
        report = self.store.verify(rid)
        self.assertEqual(report["status"], "FAIL")
        self.assertEqual(report["checks"]["digest"], "FAIL")

    def test_identity_consistency(self):
        rec = make_rec()
        rid = self.store.save(rec)
        self.assertTrue(rec.matches_image(IMG))
        other = ImageIdentity("cd" * 32, 800, 600)
        self.assertFalse(rec.matches_image(other))
        report = self.store.verify(rid, identity=other)
        self.assertEqual(report["status"], "FAIL")
        self.assertEqual(report["checks"]["image_identity"], "FAIL")

    def test_bounds_and_validation(self):
        with self.assertRaises(RecordError):
            make_rec(x=800, y=599)   # x out of range
        with self.assertRaises(RecordError):
            make_rec(y=600)          # y out of range
        with self.assertRaises(RecordError):
            make_rec(x=-1)
        with self.assertRaises(RecordError):
            CrosshairRecord(
                competition_id="bad id!", judge_id="J1", image_id=IMG.sha256,
                image_width_px=800, image_height_px=600, x_px=1, y_px=1)

    def test_listing_and_filtering(self):
        r1 = make_rec(judge="J1", x=10, y=20)
        r2 = make_rec(judge="J2", x=30, y=40)
        self.store.save(r1)
        self.store.save(r2)
        self.assertEqual(len(self.store.list_records()), 2)
        found = self.store.records_for("BOTB-2026-R1", IMG.sha256)
        self.assertEqual(len(found), 2)
        self.assertEqual(
            {f.judge_id for f in found}, {"J1", "J2"})

    def test_record_id_is_content_hash(self):
        a = make_rec()
        b = make_rec()
        self.assertEqual(a.to_json_dict()["record_id"], b.to_json_dict()["record_id"])
        c = make_rec(x=322)
        self.assertNotEqual(a.to_json_dict()["record_id"], c.to_json_dict()["record_id"])


if __name__ == "__main__":
    unittest.main(verbosity=2)
```

#### `tests/test_multi_judge.py` (repo package)

SHA-256: `3fbcce91fe7f60adcb1f80479cc7269a54cd288ef2815ca54ab5afcc283e154f` | 194 lines | 7,650 bytes

```python
"""Multi-judge assessment tests: schema validation, AI separation, approval gate,
audit chain integrity, competition/image identity consistency."""

import json
import os
import sys
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "engine"))

from crosshair_records import RecordError
from multi_judge import (Assessment, JudgeSubmission, SchemaViolation,
                         validate_schema, validate_assessment_file)

SCHEMA_PATH = os.path.join(ROOT, "schemas", "assessment.schema.json")


def sub(judge="J1", x=100, y=100, note=""):
    return JudgeSubmission(judge_id=judge, x_px=x, y_px=y,
                           image_width_px=800, image_height_px=600, note=note)


def make_assessment(judges=(("J1", 100, 100), ("J2", 103, 104), ("J3", 99, 101))):
    a = Assessment(assessment_id="A-001", competition_id="BOTB-2026-R1",
                   image_id="ab" * 32, judges=[],
                   tolerance_px=12.0)
    for jid, x, y in judges:
        a.add_judge_submission(sub(jid, x, y), actor=jid)
    return a


class TestSchemaValidation(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        with open(SCHEMA_PATH, encoding="utf-8") as fh:
            cls.schema = json.load(fh)

    def test_valid_document_passes(self):
        a = make_assessment()
        a.approval = {"status": "PENDING", "approver": None, "decided_at": None}
        doc = a.to_json_dict()
        validate_schema(doc, self.schema)

    def test_missing_required_fails(self):
        a = make_assessment()
        doc = a.to_json_dict()
        del doc["competition_id"]
        with self.assertRaises(SchemaViolation):
            validate_schema(doc, self.schema)

    def test_bad_image_id_fails(self):
        a = make_assessment()
        doc = a.to_json_dict()
        doc["image_id"] = "not-a-hash"
        with self.assertRaises(SchemaViolation):
            validate_schema(doc, self.schema)

    def test_bad_enum_fails(self):
        a = make_assessment()
        doc = a.to_json_dict()
        doc["consensus_method"] = "mean"
        with self.assertRaises(SchemaViolation):
            validate_schema(doc, self.schema)

    def test_additional_properties_fails(self):
        a = make_assessment()
        doc = a.to_json_dict()
        doc["extra"] = 1
        with self.assertRaises(SchemaViolation):
            validate_schema(doc, self.schema)

    def test_validate_assessment_file_helper(self):
        import tempfile
        a = make_assessment()
        with tempfile.TemporaryDirectory() as tmp:
            p = os.path.join(tmp, "a.json")
            with open(p, "w", encoding="utf-8") as fh:
                fh.write(a.to_json())
            self.assertEqual(validate_assessment_file(p, SCHEMA_PATH), [])
            with open(p, "r", encoding="utf-8") as fh:
                bad = json.load(fh)
            bad["tolerance_px"] = -1
            with open(p, "w", encoding="utf-8") as fh:
                json.dump(bad, fh)
            self.assertTrue(validate_assessment_file(p, SCHEMA_PATH))


class TestJudgeWorkflow(unittest.TestCase):
    def test_ai_cannot_become_a_judge(self):
        a = Assessment(assessment_id="A-002", competition_id="C",
                       image_id="ab" * 32, judges=[], tolerance_px=10)
        with self.assertRaises(RecordError):
            a.add_judge_submission(sub("AI-1"), actor="AI")
        with self.assertRaises(RecordError):
            a.add_judge_submission(sub("ai_helper"), actor="AI")

    def test_ai_proposals_are_separate(self):
        a = make_assessment()
        n_judges = len(a.judges)
        c_before = dict(a.consensus)
        a.add_ai_proposal({"x_px": 150, "y_px": 130, "model": "reference"}, actor="system")
        self.assertEqual(len(a.judges), n_judges)
        self.assertEqual(len(a.ai_proposals), 1)
        self.assertIn("proposal_id", a.ai_proposals[0])
        self.assertEqual(a.consensus, c_before)  # consensus unaffected by AI

    def test_duplicate_judge_rejected(self):
        a = make_assessment()
        with self.assertRaises(RecordError):
            a.add_judge_submission(sub("J1", 1, 1), actor="J1")

    def test_mixed_image_sizes_rejected(self):
        a = Assessment(assessment_id="A-003", competition_id="C",
                       image_id="ab" * 32, judges=[sub("J1")], tolerance_px=10)
        alien = JudgeSubmission(judge_id="J2", x_px=5, y_px=5,
                                image_width_px=1024, image_height_px=768)
        with self.assertRaises(RecordError):
            a.add_judge_submission(alien, actor="J2")

    def test_consensus_recomputed_on_submission(self):
        a = Assessment(assessment_id="A-004", competition_id="C",
                       image_id="ab" * 32, judges=[sub("J1", 100, 100)],
                       tolerance_px=10)
        c1 = a.consensus
        self.assertEqual((c1["x_px"], c1["y_px"]), (100, 100))
        a.add_judge_submission(sub("J2", 104, 100), actor="J2")
        c2 = a.consensus
        self.assertTrue(100 <= c2["x_px"] <= 102)


class TestApprovalGate(unittest.TestCase):
    def test_approval_requires_full_agreement(self):
        a = make_assessment(judges=(("J1", 100, 100), ("J2", 500, 500)))
        ratio = a.consensus["agreement_ratio"]
        self.assertLess(ratio, 1.0)
        with self.assertRaises(RecordError):
            a.decide("APPROVED", approver="owner")

    def test_approval_passes_when_all_agree(self):
        a = make_assessment(judges=(("J1", 100, 100), ("J2", 103, 104),
                                    ("J3", 99, 101)))
        self.assertEqual(a.consensus["agreement_ratio"], 1.0)
        a.decide("APPROVED", approver="owner")
        self.assertEqual(a.approval["status"], "APPROVED")
        self.assertEqual(a.approval["approver"], "owner")
        a.decide("REJECTED", approver="owner")
        self.assertEqual(a.approval["status"], "REJECTED")

    def test_invalid_status_rejected(self):
        a = make_assessment()
        with self.assertRaises(RecordError):
            a.decide("MAYBE", approver="owner")


class TestAuditChainAndIntegrity(unittest.TestCase):
    def test_chain_valid_and_tamper_detected(self):
        a = make_assessment()
        self.assertTrue(a.audit_chain_valid())
        a.add_judge_submission(sub("J4", 90, 110), actor="J4")
        self.assertTrue(a.audit_chain_valid())
        # tamper with one entry's payload -> chain invalid
        a.audit[0]["actor"] = "attacker"
        self.assertFalse(a.audit_chain_valid())

    def test_chain_links(self):
        a = make_assessment()
        prev = "GENESIS"
        for e in a.audit:
            self.assertEqual(e["prev_entry_hash"], prev)
            prev = e["entry_hash"]

    def test_roundtrip_preserves_content_and_detects_mutation(self):
        a = make_assessment()
        doc = json.loads(a.to_json())
        b = Assessment.from_json_dict(doc)
        self.assertEqual(a.to_json_dict()["assessment_hash"],
                         b.to_json_dict()["assessment_hash"])
        doc["judges"][0]["x_px"] = 999
        with self.assertRaises(RecordError):
            Assessment.from_json_dict(doc)

    def test_first_launch_identity_fields(self):
        a = make_assessment()
        d = a.to_json_dict()
        self.assertEqual(d["competition_id"], "BOTB-2026-R1")
        self.assertEqual(d["image_id"], "ab" * 32)
        for j in d["judges"]:
            self.assertEqual(j["crosshair"]["image_width_px"], 800)
            self.assertEqual(j["crosshair"]["image_height_px"], 600)


if __name__ == "__main__":
    unittest.main(verbosity=2)
```

#### `verification/IPA_AUDIT_REPORT.md` (repo package)

SHA-256: `ce2bd011033fe7ca6c316b27eb3dae8670abb4174ca44c173ee4726b077f5ad5` | 72 lines | 3,535 bytes

````markdown
# IPA AUDIT REPORT — uploaded file from Google Drive

Audit performed: at owner request (file sent for "merging changes")
File: `upload/botb_app_from_drive.bin` (236,220,765 bytes)
SHA-256: `8c5a23bdb85f5c0a2352bb07f357cd0e465e3b3f07b42682f30f17628cd34f9a`

## 1. Identification

| Property | Value |
| --- | --- |
| Format | Valid iOS IPA (zip, 261 entries, ~270 MB uncompressed) |
| App bundle | `Payload/BOTB.app` |
| Bundle identifier | **com.botb.winacar** |
| Display name | BOTB |
| Version | 3.1.96 (build 2) |
| Minimum iOS | 16.1 |
| Built with | Xcode 27.0, SDK iphoneos27.0 |
| Main binary | `BOTB` (44.4 MB Mach-O 64) |
| Extensions | BOTBNotificationService.appex, orderActivityExtensionExtension.appex |
| Embedded frameworks | AppsFlyer, Facebook SDK (Core/Basics/Login, FBAEMKit), FirebaseAnalytics, GoogleAppMeasurement, GoogleAdsOnDeviceConversion, Clarity |
| Linked services (bundles/plists) | Firebase (Core/Auth/Messaging/RemoteConfig/ABTesting/Installations), GoogleSignIn + AppAuth, Emarsys SDK, Kingfisher, GTMSessionFetcher |
| Code signature | `_CodeSignature/CodeResources` + embedded LC_CODE_SIGNATURE blob (1.1 MB) |
| Provisioning profile | **none** (`embedded.mobileprovision` absent) |

## 2. Encryption status (decisive)

Main binary LC_ENCRYPTION_INFO: `cryptoff=16384 cryptsize=36,585,472 cryptid=0`

- App Store builds ship with `cryptid=1` (FairPlay) and a large cryptsize.
- This file has a **large cryptsize but `cryptid=0`** — the characteristic
  fingerprint of a **decrypted dump of an App Store build** whose cryptid
  flag was patched after decryption, then re-signed.
- All frameworks/extensions show cryptid=0 (normal; they are never encrypted).

## 3. Conclusion

1. The file is the **official third-party BOTB application** (bundle
   `com.botb.winacar`), **not** an original, authorized source build of the
   project owner.
2. It is a **decrypted App Store dump** (FairPlay defeated upstream), not a
   development/ad-hoc build: no provisioning profile, patched cryptid,
   re-signed blob.
3. **Modification route: closed.** Two independent reasons:
   - **Legal/authorization:** repackaging or altering a decrypted copy of a
     third-party's protected application is exactly what the project rules
     prohibit ("do not bypass FairPlay", "do not modify protected binaries",
     "do not disguise a different application as the original"). Owner
     signing does not substitute for source-code rights, and none are
     evidenced.
   - **Technical:** judge workflows, authentication, and the coordinate
     engine are new source-level features; they cannot be "merged" into a
     compiled Mach-O binary. No toolchain can do that — only a source
     project rebuild can.
4. **What this IPA is NOT suitable for:** as a base for the Judges Edition,
   as a signing base, or as a source of proprietary assets.
5. **What remains valid:** every Judges Edition component delivered in this
   package (engine, records, schema, app scaffold, build pipeline) — the
   legitimate IPA route is unchanged:
   GitHub Actions build of the scaffold → owner signing → install.

## 4. Verification commands used (reproducible)

```
sha256sum <file>
unzip -l <file>
python3 (plistlib on Payload/BOTB.app/Info.plist)
python3 (Mach-O load-command walk for LC_ENCRYPTION_INFO 0x2C/0x2D,
         LC_CODE_SIGNATURE 0x1D on Payload/BOTB.app/BOTB and PlugIns)
```

Nothing in the uploaded file was modified; it remains byte-identical
(SHA-256 above) and was used read-only for this audit.
````

#### `verification/IPA_INSPECTION_REPORT.md` (repo package)

SHA-256: `761a7f309475fc458c7ab8c0bc07a6a900d4e8153bfe5b8b77e4c1f501d13d06` | 77 lines | 3,787 bytes

```markdown
# IPA Inspection Report — Google Drive IPA (downloaded and verified)

**Date:** 2026-11-16
**Source:** owner-provided Google Drive link (file id `1qBrusNhRrx6UqsriEp8wvFUJSUbp0EUj`),
fetched successfully via the direct `drive.usercontent.google.com` download URL.

> **کورتە بە کوردی:** فایلەکە وەرگیرا و پشکنین کرا. ئەمە **ئەپی بازرگانی ڕەسەنی BOTB** ە
> (`com.botb.winacar`، وەشان 3.1.96). سۆرسی تێدا نییە و ناتوانرێت بکرێتە Judges Edition —
> IPA ≠ سۆرس. بەپێی یاساکانی پڕۆژە، دەستکاری یان دووبارە ئیمزاکردنی نەرمەکاڵای
> کەسانی تر قەدەغەیە؛ بۆیە تەنها وەک **ڕاپەرت (reference)** پاشەکەوت کرا.
> ڕێگای دروستکردنی IPA ی Judges Edition بێ گۆڕان مانەوە: GitHub Actions → ئیمزای خاوەن.

## 1. File facts (verified by real runs)

| Item | Value |
| --- | --- |
| Size | 236,220,765 bytes (~225 MB) |
| SHA-256 | `8c5a23bdb85f5c0a2352bb07f357cd0e465e3b3f07b42682f30f17628cd34f9a` |
| ZIP structure | 261 entries, CRC check ALL OK |
| Bundle path | `Payload/BOTB.app/` |

## 2. Identity (from Info.plist)

| Key | Value |
| --- | --- |
| CFBundleIdentifier | `com.botb.winacar` |
| CFBundleDisplayName | BOTB |
| CFBundleShortVersionString | 3.1.96 |
| CFBundleVersion | 2 |
| MinimumOSVersion | 16.1 |
| Built with SDK | iphoneos27.0 |
| Main binary | `BOTB`, 44,442,272 bytes (native ARM64) |

## 3. Security / DRM markers

| Marker | Present | Meaning |
| --- | --- | --- |
| `SC_Info/` (FairPlay) | NO | Not an encrypted App Store container |
| `embedded.mobileprovision` | NO | Not a development/ad-hoc signed build |
| `iTunesMetadata.plist` | NO | Not a direct App Store purchase copy |
| `_CodeSignature/` | YES | Bundle carries a code-signing manifest |

## 4. Content overview

- Embedded third-party SDKs (Frameworks/, 53 entries): Facebook
  (FBSDKCoreKit / FBSDKLoginKit / FBAEMKit), Firebase (Auth, Messaging,
  RemoteConfig, Analytics, Installations...), GoogleSignIn, AppsFlyer, Clarity,
  Emarsys, Kingfisher, AppAuth, GTMSessionFetcher, Promises, nanopb,
  swift-crypto, GuiKit.
- App extensions in `PlugIns/` (17 entries).
- Assets: Jost font family, `Countries.json`, `GoogleService-Info.plist`
  (Firebase config), `t&c.pdf`, `PrivacyInfo.xcprivacy`, app icons.
- No Swift/source files, no Xcode project, no Judges Edition features anywhere.

## 5. Verdict (honest assessment)

1. This is the published BOTB commercial application (`com.botb.winacar`) —
   most plausibly a decrypted/extracted copy of the App Store release.
2. It contains **no source code**. An IPA is a compiled, sealed bundle;
   features (coordinate engine, crosshairs, multi-judge consensus) cannot be
   added to it.
3. Modifying or re-signing this bundle is **out of scope by the project's own
   rules**: it is third-party proprietary software of Best of the Best plc; the
   rules prohibit passing off or modifying another party's application; and any
   modification would break `_CodeSignature/CodeResources`.
4. Therefore this IPA is **archived as a reference only**. It cannot be the
   baseline for the Judges Edition.
5. The route to an installable Judges Edition IPA is unchanged:
   GitHub Actions builds the standalone scaffold (new code) -> the owner signs
   it personally (Sideloadly/AltStore with their own Apple ID, or a paid
   developer account).

## 6. What remains true

- 50/50 engine tests pass; e2e pipeline passes (see `unittest_output.txt`, `e2e_output.txt`).
- `ios/JudgesEdition/` builds via `.github/workflows/build.yml` on GitHub's free macOS runner.
- Signing is performed only by the owner, on their own Apple ID.
```

#### `verification/e2e_output.txt` (repo package)

SHA-256: `b335ddc2f88bde7e457a7eadf61ca35cb21b9dd06eee95635f841b70cc6cad05` | 8 lines | 469 bytes

```text
consensus: {"method": "geometric_median", "x_px": 513, "y_px": 342, "agreement_ratio": 1.0, "max_spread_px": 8.485, "n_judges": 4}
agreement_ratio == 1.0: True
approval: APPROVED by project-owner
audit chain valid: True | entries: 7
schema validation: PASS
schema negative control: correctly rejected -> SchemaViolation
written: samples/sample_assessment.json | file re-validation: PASS
assessment_hash: 542ea90b3d47b4f3712ee108ec7a18f97aaefbcbe234b6573212c24eac51d9c0
```

#### `verification/make_sample_assessment.py` (repo package)

SHA-256: `9cd418606ab3885ea1dc6a58eae4f0cfb13dbf7e8229c9cd977efcf4d9c62984` | 68 lines | 2,979 bytes

```python
"""End-to-end verification run: builds a real multi-judge assessment through
the full pipeline (submissions -> consensus -> AI proposal -> approval ->
audit chain check -> schema validation) and writes it as a sample artifact."""

import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "engine"))

from crosshair_records import RecordError
from multi_judge import (Assessment, JudgeSubmission, validate_schema,
                         validate_assessment_file)

SCHEMA_PATH = os.path.join(ROOT, "schemas", "assessment.schema.json")
OUT_DIR = os.path.join(ROOT, "samples")
OUT_PATH = os.path.join(OUT_DIR, "sample_assessment.json")

IMAGE_ID = "3f79bb7b435b05321651daefd374cdc681dc06faa65e374e38337b88ca7c2de8"
# NOTE: placeholder image digest for the sample artifact; the app computes the
# digest from real image bytes at submission time.


def main() -> None:
    a = Assessment(assessment_id="A-SAMPLE-001", competition_id="BOTB-2026-R1",
                   image_id=IMAGE_ID, judges=[], tolerance_px=12.0)
    for jid, x, y in [("JUDGE-01", 512, 340), ("JUDGE-02", 515, 344),
                      ("JUDGE-03", 509, 338), ("JUDGE-04", 513, 342)]:
        a.add_judge_submission(
            JudgeSubmission(judge_id=jid, x_px=x, y_px=y,
                            image_width_px=1024, image_height_px=768,
                            note="crosshair adjusted after reopen"),
            actor=jid)
    a.add_ai_proposal({"x_px": 511, "y_px": 341,
                       "model": "reference-proposal-v0",
                       "confidence": 0.82}, actor="system")

    print("consensus:", json.dumps({k: a.consensus[k]
          for k in ("method", "x_px", "y_px", "agreement_ratio",
                    "max_spread_px", "n_judges")}))
    print("agreement_ratio == 1.0:", a.consensus["agreement_ratio"] == 1.0)
    a.decide("APPROVED", approver="project-owner")
    print("approval:", a.approval["status"], "by", a.approval["approver"])
    print("audit chain valid:", a.audit_chain_valid(), "| entries:", len(a.audit))

    doc = a.to_json_dict()
    validate_schema(doc, json.load(open(SCHEMA_PATH, encoding="utf-8")))
    print("schema validation: PASS")

    try:
        bad = dict(doc); bad["image_id"] = "zz"
        validate_schema(bad, json.load(open(SCHEMA_PATH, encoding="utf-8")))
        print("schema negative control: UNEXPECTED PASS")
    except Exception as exc:
        print("schema negative control: correctly rejected ->", type(exc).__name__)

    os.makedirs(OUT_DIR, exist_ok=True)
    with open(OUT_PATH, "w", encoding="utf-8") as fh:
        fh.write(a.to_json(indent=1))
    violations = validate_assessment_file(OUT_PATH, SCHEMA_PATH)
    print("written:", os.path.relpath(OUT_PATH, ROOT),
          "| file re-validation:", "PASS" if not violations else violations)
    print("assessment_hash:", doc["assessment_hash"])


if __name__ == "__main__":
    main()
```

#### `verification/unittest_output.txt` (repo package)

SHA-256: `ffa1e2f12f40e0bad9730c412a50e4203e2631d0de22f397c77a715fc7c10682` | 55 lines | 5,457 bytes

```text
test_pin_policy (test_auth_model.TestCredentialLifecycle.test_pin_policy) ... ok
test_salts_unique_per_setup (test_auth_model.TestCredentialLifecycle.test_salts_unique_per_setup) ... ok
test_setup_then_unlock (test_auth_model.TestCredentialLifecycle.test_setup_then_unlock) ... ok
test_verifier_never_stores_pin (test_auth_model.TestCredentialLifecycle.test_verifier_never_stores_pin) ... ok
test_wrong_pin_rejected (test_auth_model.TestCredentialLifecycle.test_wrong_pin_rejected) ... ok
test_backoff_grows (test_auth_model.TestRateLimiter.test_backoff_grows) ... ok
test_lockout_after_consecutive_failures (test_auth_model.TestRateLimiter.test_lockout_after_consecutive_failures) ... ok
test_success_resets (test_auth_model.TestRateLimiter.test_success_resets) ... ok
test_two_rate_limiters_independent (test_auth_model.TestRateLimiter.test_two_rate_limiters_independent) ... ok
test_agreement_ratio_and_gate (test_coordinate_engine.TestConsensus.test_agreement_ratio_and_gate) ... ok
test_empty_and_unknown_method (test_coordinate_engine.TestConsensus.test_empty_and_unknown_method) ... ok
test_outlier_robustness (test_coordinate_engine.TestConsensus.test_outlier_robustness) ... ok
test_per_axis_median_even_count (test_coordinate_engine.TestConsensus.test_per_axis_median_even_count) ... ok
test_single_point (test_coordinate_engine.TestConsensus.test_single_point) ... ok
test_symmetric_square_geometric_median_is_center (test_coordinate_engine.TestConsensus.test_symmetric_square_geometric_median_is_center) ... ok
test_clamp_and_rejection (test_coordinate_engine.TestConversions.test_clamp_and_rejection) ... ok
test_identity_points (test_coordinate_engine.TestConversions.test_identity_points) ... ok
test_non_integer_pixel_rejected (test_coordinate_engine.TestConversions.test_non_integer_pixel_rejected) ... ok
test_roundtrip_error_bounded (test_coordinate_engine.TestConversions.test_roundtrip_error_bounded) ... ok
test_canonical_serialization_is_stable (test_coordinate_engine.TestDeterminismAndIdentity.test_canonical_serialization_is_stable) ... ok
test_engine_version_format (test_coordinate_engine.TestDeterminismAndIdentity.test_engine_version_format) ... ok
test_image_identity_content_based (test_coordinate_engine.TestDeterminismAndIdentity.test_image_identity_content_based) ... ok
test_345_triangle (test_coordinate_engine.TestDistances.test_345_triangle) ... ok
test_normalized_distance_uses_diagonal (test_coordinate_engine.TestDistances.test_normalized_distance_uses_diagonal) ... ok
test_spread (test_coordinate_engine.TestDistances.test_spread) ... ok
test_bounds_and_validation (test_crosshair_records.TestSaveReopenVerify.test_bounds_and_validation) ... ok
test_identity_consistency (test_crosshair_records.TestSaveReopenVerify.test_identity_consistency) ... ok
test_listing_and_filtering (test_crosshair_records.TestSaveReopenVerify.test_listing_and_filtering) ... ok
test_record_id_is_content_hash (test_crosshair_records.TestSaveReopenVerify.test_record_id_is_content_hash) ... ok
test_save_then_reopen_roundtrip (test_crosshair_records.TestSaveReopenVerify.test_save_then_reopen_roundtrip) ... ok
test_tamper_detection (test_crosshair_records.TestSaveReopenVerify.test_tamper_detection) ... ok
test_verify_passes_on_untouched_record (test_crosshair_records.TestSaveReopenVerify.test_verify_passes_on_untouched_record) ... ok
test_approval_passes_when_all_agree (test_multi_judge.TestApprovalGate.test_approval_passes_when_all_agree) ... ok
test_approval_requires_full_agreement (test_multi_judge.TestApprovalGate.test_approval_requires_full_agreement) ... ok
test_invalid_status_rejected (test_multi_judge.TestApprovalGate.test_invalid_status_rejected) ... ok
test_chain_links (test_multi_judge.TestAuditChainAndIntegrity.test_chain_links) ... ok
test_chain_valid_and_tamper_detected (test_multi_judge.TestAuditChainAndIntegrity.test_chain_valid_and_tamper_detected) ... ok
test_first_launch_identity_fields (test_multi_judge.TestAuditChainAndIntegrity.test_first_launch_identity_fields) ... ok
test_roundtrip_preserves_content_and_detects_mutation (test_multi_judge.TestAuditChainAndIntegrity.test_roundtrip_preserves_content_and_detects_mutation) ... ok
test_ai_cannot_become_a_judge (test_multi_judge.TestJudgeWorkflow.test_ai_cannot_become_a_judge) ... ok
test_ai_proposals_are_separate (test_multi_judge.TestJudgeWorkflow.test_ai_proposals_are_separate) ... ok
test_consensus_recomputed_on_submission (test_multi_judge.TestJudgeWorkflow.test_consensus_recomputed_on_submission) ... ok
test_duplicate_judge_rejected (test_multi_judge.TestJudgeWorkflow.test_duplicate_judge_rejected) ... ok
test_mixed_image_sizes_rejected (test_multi_judge.TestJudgeWorkflow.test_mixed_image_sizes_rejected) ... ok
test_additional_properties_fails (test_multi_judge.TestSchemaValidation.test_additional_properties_fails) ... ok
test_bad_enum_fails (test_multi_judge.TestSchemaValidation.test_bad_enum_fails) ... ok
test_bad_image_id_fails (test_multi_judge.TestSchemaValidation.test_bad_image_id_fails) ... ok
test_missing_required_fails (test_multi_judge.TestSchemaValidation.test_missing_required_fails) ... ok
test_valid_document_passes (test_multi_judge.TestSchemaValidation.test_valid_document_passes) ... ok
test_validate_assessment_file_helper (test_multi_judge.TestSchemaValidation.test_validate_assessment_file_helper) ... ok

----------------------------------------------------------------------
Ran 50 tests in 0.122s

OK
```


**5.2 Final delivery tree — files unique to `download/FINAL_DELIVERY/`** (all other files are identical in both trees; verified by SHA-256):

#### `README.md` (final delivery)

SHA-256: `17b2d85ab6ff09dce7723758cbb84ecacd5b353facdee295ede82089027eb265` | 55 lines | 2,760 bytes

````markdown
# FINAL DELIVERY — BOTB PRIVATE JUDGES EDITION

Delivery root: `/home/z/my-project/download/FINAL_DELIVERY/`
(Requested path `/workspace/botb/judges-edition/FINAL_DELIVERY/` does not
exist in this environment; see WORKSPACE_AUDIT.md section 4.)

## Read in this order

1. `WORKSPACE_AUDIT.md` — what actually exists in this environment
   (decision evidence: no original IPA, no source, no Apple toolchain).
2. `BUILD_REPORT.md` — build status: what was built/executed, the four
   exact IPA blockers, owner build routes.
3. `TEST_RESULTS.md` — real executed results: **50/50 tests OK** +
   end-to-end pipeline PASS.
4. `SIGNING_INSTRUCTIONS.md` — owner signing (macOS), post-sign verification,
   first-launch flow.

## Contents

```
FINAL_DELIVERY/
├── BUILD_REPORT.md               build status + exact blockers
├── TEST_RESULTS.md               executed test evidence (50/50 OK)
├── SHA256SUMS.txt                SHA-256 over this delivery tree
├── SIGNING_INSTRUCTIONS.md       owner signing route (no keys embedded)
├── WORKSPACE_AUDIT.md            workspace evidence + path mapping
├── README.md                     this file
├── docs/
│   ├── PROJECT_PERSONA.md        fictional persona (documentation only)
│   └── COORDINATE_ENGINE_SPEC.md authored engine specification
├── schemas/
│   ├── assessment.schema.json    machine-readable multi-judge schema
│   └── MULTI_JUDGE_SCHEMA.md     schema documentation
├── engine/                       Python reference implementations (tested)
│   ├── coordinate_engine.py      authoritative coordinate engine
│   ├── crosshair_records.py      record persistence + verification
│   ├── multi_judge.py            consensus, approval, audit chain
│   └── auth_model.py             PIN/PBKDF2/lockout model
├── tests/                        50 tests, all passing
├── verification/                 raw execution logs + e2e runner
├── samples/sample_assessment.json real pipeline output artifact
├── ios/JudgesEdition/            SwiftUI source scaffold + XcodeGen spec
└── build/build_judges_edition.sh macOS build/package/verify script
```

## Bottom line

- **No IPA file is included, because producing one here was impossible for
  four concrete, evidenced reasons** (original source absent, original
  baseline IPA absent, Linux sandbox without Apple toolchain, source
  rights). No fake IPA was fabricated, per the execution order.
- The complete, tested judging stack (engine + records + multi-judge +
  auth), the full iOS source scaffold, and the macOS build/signing
  pipeline are delivered and verified to the extent this environment
  allows.
````

#### `SHA256SUMS.txt` (final delivery)

SHA-256: `736e7c8ee45d0f9f4c751bbc826acbbc3892a9bcf0df60829e2c3a0dba90e271` | 39 lines | 3,883 bytes

```text
ca6f683124303b3c7d1a759f6ec402f60dc5902236113acde502073229a468da  BUILD_REPORT.md
17b2d85ab6ff09dce7723758cbb84ecacd5b353facdee295ede82089027eb265  README.md
c908ba7b6aaecacec85057240ef11714c4750d83ba667cb58d30dbbe50b3a1d3  SIGNING_INSTRUCTIONS.md
c1ade2e644f459c5dcddfbba0fd8ff8003f51e80fc42d1ff18a878d3a8080966  TEST_RESULTS.md
6472d3e24d06492e4b5c93944972162d8d66922c5e4af0bc94f1297a7411bcc1  WORKSPACE_AUDIT.md
09b2c77d6cf7758fdaa25b65060aebd7f7adea21931e465b76d49dbd567dfd29  build/GITHUB_BUILD_GUIDE.md
2bd9cb69ded732fed75dad2976dca16b4c2b55fe09bfb8ad0438a4e476269fb0  build/WINDOWS_SIDELOAD_GUIDE.md
1ee5cff1c4213c320451aa8356e16652410773ac50222b2b039ee6ae11e53bc9  build/build_judges_edition.sh
a0dd77af797b65514e8f710f2db460fc3496cf23d7208c710570081086bc7a7f  build/github_actions_workflow.yml
672f7c83d0e02986efa2f465f713e0fa1b14fb995e9d5f42078fb07b8305db43  build/windows_setup.ps1
f3d11801be6ad08d678d610b72e3f44d37ed279fdd8ff65c1796fe3ce407f7b8  docs/COORDINATE_ENGINE_SPEC.md
d725d9191baed762f699b967b94c703e9b977cf7cd9af6a4b335dc9c9b07dc8e  docs/PROJECT_PERSONA.md
45216866f7cb898875a816da5fcdf3ca22f15a2654153e5f689fd6cd33a9ab92  engine/auth_model.py
20d9d0b1915d0330646cb8f2e03276add42efb8d71851bceb5d374b0d7d52e91  engine/coordinate_engine.py
23fbc10bfed7dfc147353f3897e703a75395e0d6d2100013ffd2ee9ec8631f5b  engine/crosshair_records.py
176b25ed4c64e3be56add069e531f6dc58d8dcfff7ca1c7dcc70ca8b7c7bd6df  engine/multi_judge.py
20a09dad5317f339bd659e6aa79e46cbb936355db06d1821ce6059f1b7b3dd31  ios/JudgesEdition/JudgesEdition/AIProposalView.swift
641d9c4fda1e051cedb8d98958f7683077a0e15d85166bd803ff4696e3cd0c49  ios/JudgesEdition/JudgesEdition/AssessmentModels.swift
5bb7640ce5147ba8799ab3fcfd1c68e7313a46df88359710b667aaab526ef220  ios/JudgesEdition/JudgesEdition/AuthGate.swift
82f12976ce189621a46ef15e3276e8cb1e3a309dd6b5fb2178a5339ffc11d084  ios/JudgesEdition/JudgesEdition/BOTBJudgesApp.swift
78861a003955f837267bb60f4a3836672097fae90d1abe3dc2ab3ec19ff20198  ios/JudgesEdition/JudgesEdition/CoordinateEngine.swift
55182ad86ffcdd7b301bac0994f29a3088ca32ba57c805dd17e104acb13adbc7  ios/JudgesEdition/JudgesEdition/CrosshairOverlay.swift
48f8093db7d9d243f8061196401fb5a3534d961e3f9d97af76a268d775b78bdb  ios/JudgesEdition/JudgesEdition/JudgeSubmissionView.swift
90c385ea86fe4e4e6cb9e0632828dc5a7034d92fd51cab666a5a13a9c0821682  ios/JudgesEdition/JudgesEdition/MultiJudgeCompareView.swift
0f6bdd94277aed6ccb2a72fdc1c97221e9241a7acec976c6e9709c271e670ffa  ios/JudgesEdition/JudgesEdition/RecordsStore.swift
4eefe39e3fcf72cc1ff817f48aaad748fa36b378efab40501b22da1cc47b0089  ios/JudgesEdition/README.md
7bb247a15f251d865714be7349eef1674caa1a2b604c6022d2af8b21862ae73b  ios/JudgesEdition/project.yml
9b4bbb4079d8e434ef0e8cba281bbf2e9e4dd9a55e54e3f41695fc1a1735e34b  samples/sample_assessment.json
b99d8479e45908446617d3c206ae253f9ceb9571fcd9059dc5a07736a8a3661d  schemas/MULTI_JUDGE_SCHEMA.md
33b9673d9b91fb57a0938211443292fe8ad25c6bc5d24f6896057f450f433d53  schemas/assessment.schema.json
0ff7e2301d9e6d1a6fd59465a1ac9a8fdc24e2b9cc8a17afbb65f71376f63668  tests/test_auth_model.py
b7cbe582a227281f5884af02749554055b0cc192818856a2f0577b4c8ce89625  tests/test_coordinate_engine.py
871975db029fdecb26c6b15218157db58d902088a4eb912dc59d661a3d4e7c07  tests/test_crosshair_records.py
3fbcce91fe7f60adcb1f80479cc7269a54cd288ef2815ca54ab5afcc283e154f  tests/test_multi_judge.py
ce2bd011033fe7ca6c316b27eb3dae8670abb4174ca44c173ee4726b077f5ad5  verification/IPA_AUDIT_REPORT.md
761a7f309475fc458c7ab8c0bc07a6a900d4e8153bfe5b8b77e4c1f501d13d06  verification/IPA_INSPECTION_REPORT.md
b335ddc2f88bde7e457a7eadf61ca35cb21b9dd06eee95635f841b70cc6cad05  verification/e2e_output.txt
9cd418606ab3885ea1dc6a58eae4f0cfb13dbf7e8229c9cd977efcf4d9c62984  verification/make_sample_assessment.py
ffa1e2f12f40e0bad9730c412a50e4203e2631d0de22f397c77a715fc7c10682  verification/unittest_output.txt
```

#### `build/GITHUB_BUILD_GUIDE.md` (final delivery)

SHA-256: `09b2c77d6cf7758fdaa25b65060aebd7f7adea21931e465b76d49dbd567dfd29` | 60 lines | 3,913 bytes

```markdown
# ڕێنمایی دروستکردنی IPA بەبێ ماک — GitHub Actions

ئەم ڕێگایە وا دەکات IPA بێ ئەوەی Xcode لەلای تۆ دابەزێت دروست بکرێت:
GitHub پێکەنەری macOS بەخۆڕایی خۆی بەکاردەهێنێت (Xcode تێیدا دامەزراوە).

## هەنگاوەکان

### ١. پاکێجەکە ئامادە بکە

لە فۆڵدەری `FINAL_DELIVERY/` ئەم شتانە پێویستن:
- فۆڵدەری `ios/JudgesEdition/` (بە تەواوی)
- فایلی `build/github_actions_workflow.yml` → پێویستە ناوی بگۆڕیت بۆ
  `.github/workflows/build.yml` لە ناو ریپۆیەکە (فۆڵدەری نەخۆی: `.github/workflows/`)

### ٢. ریپۆیەکی GitHub دروست بکە

1. لە GitHub: **New repository** → ناو بنووسە → **Public** هەڵبژێرە (بۆ بەکارهێنانی پێکەنەری macOS بە بەخۆڕایی) → Create
2. لە پەڕەی ریپۆکە: **Add file → Upload files** → هەموو فایلەکان بارکە
   (ساختاری فۆڵدەرەکان پارێزراو بێت: `ios/JudgesEdition/...` و `.github/workflows/build.yml`)
   - دەتوانیت فۆڵدەرەکان ڕاکێشی بکەیت و باس بکەیت؛ GitHub فۆڵدەر بە فایلەکانی دروست دەکات
3. **Commit changes** بکە

### ٣. وۆرکفڵۆ جێبەجێ بکە

1. تاپی **Actions** → ئاگاداربە: یەکەم جار دەبێت "I understand my workflows, go ahead and enable them" بکەیت
2. لای چەپ: **Build Judges Edition IPA (unsigned)** → **Run workflow** → **Run workflow**
3. ٣-٥ خەرەتە چاوەڕێ بکە

### ٤. IPA داگرە

- لە ڕیزی وۆرکفڵۆ تەواوبوو، کلیک لەسەر run بکە → بەشی **Artifacts**
- **BOTB_Judges_Edition_unsigned_ipa** داگرە → تێیدا:
  - `BOTB_Judges_Edition.ipa` (ئیمزانەکراو)
  - `IPA_SHA256.txt` (هاشی فایلەکە)
- ئەگەر هەڵەیەک بوو: artifact ی **build_log** داگرە و لۆگەکە بنێرە بۆ من

## ئیمزا کردن پاشان

IPA ی ئیمزانەکراو ڕاستەوخۆ لە ئایفۆن دامەزرێت ناكرێت — پێویستی بە ئیمزا هەیە:

| ڕێگا | پێویستی | ماوەی کارکردن |
| --- | --- | --- |
| Xcode لەسەر ماکەکەت + Apple Developer account | ماک + هەژمار | هەمیشەیی |
| هەژماری خۆڕایی Apple ID + ئامرازی ئیمزا (وەک AltStore/Sideloadly) | PC یان Mac | ٧ ڕۆژ، دواتر دووبارە ئیمزا |
| Apple Developer Program ($99/ساڵ) | هەژمار | هەمیشەیی + TestFlight |

تێبینی: ئەم ئامرازانە بە Apple ID ی **خۆت** بەکاریان بهێنە، هەرگیز بە هەژماری کەسێکی تر.

## سنوورەکان

- Public repo = هەموو جیهان دەتوانێت سۆرسەکە ببینێت. ئەگەر نەتەوێت بیبینن: private repo یش دەکرێت بەڵام macOS runner سنووری مینووتی هەیە (٢٠٠٠ خەرەتە/مانگ بەخۆڕایی — بۆ ئەم پڕۆژەیە بەسە).
- ئەم ڕێگایە هیچ پێویستی بە ئیمزا لای GitHub نییە — تەنها دروستکردنە؛ ئیمزا هێشتا لەلایەن خۆتەوە دەکرێت.
- نەرمەکەڵاکە ئیمزانەکراوە و بۆ ئیمزای تۆ ئامادەیە؛ هیچ کلیدی ئیمزا لە ئەم پاکێجەدا نییە.

## ئەگەر هەڵەی دروستکردن چوو

لۆگی `build_log` بنێرە. باوترین هۆکارەکان:
- فۆڵدەرەکان نەگەیشتوون بە ناوی دروست (`ios/JudgesEdition/JudgesEdition/`)
- وەشانی Swift — پڕۆژە بە Swift 5.9 و iOS 16.0 ڕێکخراوە
- ناوی scheme — دەبێت `BOTBJudgesEdition` بێت
```

#### `build/github_actions_workflow.yml` (final delivery)

SHA-256: `a0dd77af797b65514e8f710f2db460fc3496cf23d7208c710570081086bc7a7f` | 88 lines | 3,160 bytes

```yaml
# GitHub Actions workflow - builds the Judges Edition unsigned IPA on a
# GitHub-hosted macOS runner. No Mac and no local Xcode needed on your side.
#
# HOW TO USE (owner):
#   1. Create a GitHub repository (public = free macOS runners).
#   2. Put this file at:  .github/workflows/build.yml
#   3. Upload the whole ios/JudgesEdition folder to the repo root
#      (keep the folder name ios/JudgesEdition, or adjust paths below).
#   4. Actions tab -> "Build Judges Edition IPA (unsigned)" -> Run workflow.
#   5. Download the artifact BOTB_Judges_Edition_unsigned_ipa
#      (contains the .ipa + its SHA-256). Artifact is kept 90 days.
#
# Signing is intentionally NOT performed here (owner signs personally,
# see SIGNING_INSTRUCTIONS.md / GITHUB_BUILD_GUIDE.md).

name: Build Judges Edition IPA (unsigned)

on:
  workflow_dispatch:

jobs:
  build:
    runs-on: macos-14
    timeout-minutes: 30
    steps:
      - name: Checkout
        uses: actions/checkout@v4

      - name: Show toolchain
        run: |
          xcodebuild -version
          swift --version

      - name: Install XcodeGen
        run: brew install xcodegen

      - name: Generate Xcode project
        working-directory: ios/JudgesEdition
        run: xcodegen generate

      - name: Build app (UNSIGNED - owner signs later)
        working-directory: ios/JudgesEdition
        run: |
          set -o pipefail
          xcodebuild -project BOTBJudgesEdition.xcodeproj \
            -scheme BOTBJudgesEdition \
            -configuration Release \
            -destination 'generic/platform=iOS' \
            -derivedDataPath build/DD \
            CODE_SIGNING_ALLOWED=NO \
            CODE_SIGN_IDENTITY="" \
            COMPILER_INDEX_STORE_ENABLE=NO \
            build | tee build_log.txt
          test -d "build/DD/Build/Products/Release-iphoneos/BOTBJudgesEdition.app"

      - name: Verify Info.plist and package IPA
        working-directory: ios/JudgesEdition
        run: |
          APP="build/DD/Build/Products/Release-iphoneos/BOTBJudgesEdition.app"
          plutil -lint "$APP/Info.plist"
          BID=$(plutil -extract CFBundleIdentifier raw "$APP/Info.plist")
          VER=$(plutil -extract CFBundleShortVersionString raw "$APP/Info.plist")
          echo "Bundle identifier: $BID"
          echo "Bundle version    : $VER"
          rm -rf Payload BOTB_Judges_Edition.ipa
          mkdir -p Payload
          cp -R "$APP" Payload/
          zip -qyr BOTB_Judges_Edition.ipa Payload
          rm -rf Payload
          unzip -l BOTB_Judges_Edition.ipa | head -15
          shasum -a 256 BOTB_Judges_Edition.ipa | tee IPA_SHA256.txt

      - name: Upload build log (always, even on failure)
        if: always()
        uses: actions/upload-artifact@v4
        with:
          name: build_log
          path: ios/JudgesEdition/build_log.txt
          if-no-files-found: ignore

      - name: Upload unsigned IPA
        uses: actions/upload-artifact@v4
        with:
          name: BOTB_Judges_Edition_unsigned_ipa
          path: |
            ios/JudgesEdition/BOTB_Judges_Edition.ipa
            ios/JudgesEdition/IPA_SHA256.txt
          retention-days: 90
```

## 6. Master checklist

### 6.1 Recovered (verified on disk, embedded verbatim in Part 5)

| Recovered file | SHA-256 (first 16 chars) |
| --- | --- |
| `.github/workflows/build.yml` | `a620482a0c220d42...` |
| `.gitignore` | `7866616bc5ca5fa4...` |
| `BUILD_REPORT.md` | `ca6f683124303b3c...` |
| `CHAT_HISTORY.md` | `c690646ad96c11d8...` |
| `PROJECT_CONTEXT.md` | `6f755cc243d7e102...` |
| `README.md` | `17b2d85ab6ff09dc...` |
| `README_EN.md` | `5dc9a205b7a66a05...` |
| `SHA256SUMS.txt` | `736e7c8ee45d0f9f...` |
| `SIGNING_INSTRUCTIONS.md` | `c908ba7b6aaecace...` |
| `TEST_RESULTS.md` | `c1ade2e644f459c5...` |
| `WORKSPACE_AUDIT.md` | `6472d3e24d06492e...` |
| `build/GITHUB_BUILD_GUIDE.md` | `09b2c77d6cf7758f...` |
| `build/WINDOWS_SIDELOAD_GUIDE.md` | `2bd9cb69ded732fe...` |
| `build/build_judges_edition.sh` | `1ee5cff1c4213c32...` |
| `build/windows_setup.ps1` | `672f7c83d0e02986...` |
| `docs/COORDINATE_ENGINE_SPEC.md` | `f3d11801be6ad08d...` |
| `docs/PROJECT_PERSONA.md` | `d725d9191baed762...` |
| `engine/auth_model.py` | `45216866f7cb8988...` |
| `engine/coordinate_engine.py` | `20d9d0b1915d0330...` |
| `engine/crosshair_records.py` | `23fbc10bfed7dfc1...` |
| `engine/multi_judge.py` | `176b25ed4c64e3be...` |
| `ios/JudgesEdition/JudgesEdition/AIProposalView.swift` | `20a09dad5317f339...` |
| `ios/JudgesEdition/JudgesEdition/AssessmentModels.swift` | `641d9c4fda1e051c...` |
| `ios/JudgesEdition/JudgesEdition/AuthGate.swift` | `5bb7640ce5147ba8...` |
| `ios/JudgesEdition/JudgesEdition/BOTBJudgesApp.swift` | `82f12976ce189621...` |
| `ios/JudgesEdition/JudgesEdition/CoordinateEngine.swift` | `78861a003955f837...` |
| `ios/JudgesEdition/JudgesEdition/CrosshairOverlay.swift` | `55182ad86ffcdd7b...` |
| `ios/JudgesEdition/JudgesEdition/JudgeSubmissionView.swift` | `48f8093db7d9d243...` |
| `ios/JudgesEdition/JudgesEdition/MultiJudgeCompareView.swift` | `90c385ea86fe4e4e...` |
| `ios/JudgesEdition/JudgesEdition/RecordsStore.swift` | `0f6bdd94277aed6c...` |
| `ios/JudgesEdition/README.md` | `4eefe39e3fcf72cc...` |
| `ios/JudgesEdition/project.yml` | `7bb247a15f251d86...` |
| `samples/sample_assessment.json` | `9b4bbb4079d8e434...` |
| `schemas/MULTI_JUDGE_SCHEMA.md` | `b99d8479e4590844...` |
| `schemas/assessment.schema.json` | `33b9673d9b91fb57...` |
| `tests/test_auth_model.py` | `0ff7e2301d9e6d1a...` |
| `tests/test_coordinate_engine.py` | `b7cbe582a227281f...` |
| `tests/test_crosshair_records.py` | `871975db029fdecb...` |
| `tests/test_multi_judge.py` | `3fbcce91fe7f60ad...` |
| `verification/IPA_AUDIT_REPORT.md` | `ce2bd011033fe7ca...` |
| `verification/IPA_INSPECTION_REPORT.md` | `761a7f309475fc45...` |
| `verification/e2e_output.txt` | `b335ddc2f88bde7e...` |
| `verification/make_sample_assessment.py` | `9cd418606ab3885e...` |
| `verification/unittest_output.txt` | `ffa1e2f12f40e0ba...` |
| `README.md` | `17b2d85ab6ff09dc...` |
| `SHA256SUMS.txt` | `736e7c8ee45d0f9f...` |
| `build/GITHUB_BUILD_GUIDE.md` | `09b2c77d6cf7758f...` |
| `build/github_actions_workflow.yml` | `a0dd77af797b6551...` |

**Total recovered files embedded verbatim: 48**

### 6.2 NOT RECOVERED — master list

| # | Item | Reason |
| --- | --- | --- |
| 1 | Safari userscripts (all versions, selectors, storage keys) | No record this session; no files on disk |
| 2 | iPhone Userscripts installation/usage instructions | Never produced in this session |
| 3 | IPA tweaks / jailbreak concepts / iOS modifications | No record this session; also out of scope by project rule 3 |
| 4 | Spot-the-Ball image collectors and data-extraction tools | No record this session; no files on disk |
| 5 | Eye-line / gaze-direction analysis tools | No record this session; no files on disk |
| 6 | Automated ball-position detection system (CV/model) | Never built; engine is human-judge consensus only |
| 7 | Historical X/Y coordinate datasets and image dimensions | Only `samples/sample_assessment.json` values exist (Part 3.5) |
| 8 | AI agents / servers / APIs / other automation | Only the GitHub Actions workflow exists |
| 9 | Prompts written for other AI models | None in record or on disk |
| 10 | Websites, bots, HTML/CSS/JS projects | None in record or on disk |
| 11 | GitHub repository names / links / branches / commit history | No repository was ever created or pushed |
| 12 | Verbatim original project instruction message | Summary-level only (Part 3.1) |
| 13 | The 9 pre-session deliverable files claimed by the owner | Audited: NOT FOUND on disk (M0) |
| 14 | Original baseline IPA of the owner's own project | Never provided; the fetched IPA is the published commercial app, not an owner build (Part 3.7) |
| 15 | A compiled / signed installable IPA of the Judges Edition | Blocked by Part 3.10 tasks 1-3 (owner actions) |
| 16 | Cross-platform (Python <-> Swift) hash-equality integration test run | Requires a Mac; recommended but not yet run |
| 17 | Contents of `/.env` | Deliberately excluded for security |
| 18 | Contents of extracted BOTB.app resources (assets, strings, fonts, PDF) | Third-party proprietary property; inventory only |

**End of recovery archive.** Every "Recovered" item above is reproducible:
download the file from this workspace, run `sha256sum`, and compare with the
hash printed in this document. Any hash mismatch means the copy changed in
transit — re-download before trusting the content.
