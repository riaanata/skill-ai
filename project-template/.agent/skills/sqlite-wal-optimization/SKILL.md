---
name: sqlite-wal-optimization
description: Configure high-performance, concurrent SQLite databases for scrapers, bots, and local caches using WAL mode, busy timeouts, and pragmatic pragmas.
---

# SQLite Performance & WAL Optimization

## 1. Mandatory Performance Pragmas
Upon establishing any SQLite connection (Python `sqlite3`, Node.js `better-sqlite3`, Go, or Rust), execute:

```sql
-- 1. Enable Write-Ahead Logging (Allows concurrent reads while writing)
PRAGMA journal_mode = WAL;

-- 2. Relax disk sync without risking severe corruption
PRAGMA synchronous = NORMAL;

-- 3. Set a busy timeout so concurrent writes wait instead of throwing "database is locked"
PRAGMA busy_timeout = 5000;

-- 4. Enable foreign key enforcement
PRAGMA foreign_keys = ON;

-- 5. Increase memory cache size (-64000 = ~64MB cache in RAM)
PRAGMA cache_size = -64000;

-- 6. Store temporary tables in memory
PRAGMA temp_store = MEMORY;
```

## 2. Bulk Insertion & Transaction Grouping
- Never execute single-row `INSERT` in a bare loop. Bare inserts cause a disk fsync per row.
- Always wrap batch writes in an explicit transaction:
  ```python
  with db.transaction():
      # Insert thousands of rows rapidly
  ```
- Use prepared statements with parameterized inputs (`?` or `:key`) to prevent SQL injection and enable statement cache reuse.

## 3. Indexing Guidelines
- Create indexes on columns used in `WHERE`, `JOIN`, and `ORDER BY` clauses.
- Avoid over-indexing columns with low cardinality (e.g., boolean flags).
- Periodically run `PRAGMA optimize;` or `ANALYZE;` to keep query planner statistics fresh.
