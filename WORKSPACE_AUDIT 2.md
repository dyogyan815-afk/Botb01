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
