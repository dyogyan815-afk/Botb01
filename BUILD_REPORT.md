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
