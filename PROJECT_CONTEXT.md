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
