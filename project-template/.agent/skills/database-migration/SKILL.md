---
name: database-migration
description: Plan, implement, test, and document safe database schema and data migrations.
---

# Database Migration

1. Inspect current schema, data volume, constraints, and application readers/writers.
2. Define target schema and compatibility window.
3. Identify locks, downtime, backfill, and data-loss risks.
4. Design migration and rollback/recovery strategy.
5. Prefer expand-migrate-contract for changes requiring zero/low downtime.
6. Test against a disposable or staging database.
7. Validate row counts, constraints, indexes, and application behavior.
8. Document operational steps and monitoring.
9. Request explicit approval before production execution.

Never assume rollback restores deleted or transformed data. Confirm backups and restore viability.