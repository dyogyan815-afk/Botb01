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
