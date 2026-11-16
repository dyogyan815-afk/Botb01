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
