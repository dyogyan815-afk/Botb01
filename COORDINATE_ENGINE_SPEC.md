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
