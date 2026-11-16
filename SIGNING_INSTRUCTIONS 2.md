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
