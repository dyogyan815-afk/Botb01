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
