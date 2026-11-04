---
trigger: model_decision
description: Apply when investigating latency, throughput, memory, bundle size, database performance, or scaling.
---

# Performance Engineering

- Establish a baseline before optimizing.
- Measure the suspected bottleneck.
- Optimize the critical path, not code aesthetics.
- Consider latency percentiles, throughput, resource use, and cost.
- Check query plans and N+1 behavior.
- Use caching only with explicit invalidation and freshness rules.
- Bound queues, concurrency, payload size, and retries.
- Re-measure after changes.
- Include regression checks and trade-offs.