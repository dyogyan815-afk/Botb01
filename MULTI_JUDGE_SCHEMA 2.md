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
