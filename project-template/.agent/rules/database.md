---
trigger: model_decision
description: Apply when changing SQL, schemas, ORM models, indexes, migrations, transactions, or data access.
---

# Database Engineering

- Inspect current schema and real query patterns first.
- Use constraints to enforce data integrity.
- Use parameterized queries.
- Choose indexes based on measured or explainable query patterns.
- Consider transaction boundaries, isolation, locking, and idempotency.
- Avoid N+1 access patterns.
- Make migrations reversible where practical and backward-compatible where possible.
- Test migrations on disposable/non-production data.
- Never run destructive production migrations without explicit approval and a verified backup/recovery plan.