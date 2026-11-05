---
name: diagram-design
description: Design publication-grade, editorial software architecture diagrams, system flows, and technical schematics in clean self-contained SVG and interactive HTML — eliminating generic "Mermaid slop".
---

# Diagram Design — Editorial-Grade Technical Architecture & System Schematics

Inspired by [cathrynlavery/diagram-design](https://github.com/cathrynlavery/diagram-design). This skill replaces ugly, cramped, pastel-tinted "Mermaid slop" with crisp, publication-ready diagrams formatted as pure SVG or self-contained HTML previews.

---

## 1. The "Anti-Mermaid Slop" Manifesto

Mermaid is useful for quick markdown notes, but default Mermaid outputs suffer from:
- ❌ Cramped node padding and overlapping connector lines.
- ❌ Washed-out pastel colors that lack visual hierarchy.
- ❌ Unpredictable line auto-routing that zig-zags erratically.
- ❌ Blurry low-res exports and lack of interactive inspection.

**Editorial Diagram Standard:**
- ✅ **Infinite Zoom Vector (SVG):** Always sharp on Retina/4K displays and printed documentation.
- ✅ **Intentional Visual Hierarchy:** Dominant primary services, secondary supporting nodes, subtle background zones.
- ✅ **Strict 8px Grid Alignment:** Clean spacing (16px, 24px, 32px), uniform corner radii (`rx="8"`), orthogonal connectors.
- ✅ **Design System Harmony:** Matches tokens from `DESIGN.md` (Zinc/Slate bases with semantic accent colors).
- ✅ **Self-Contained Preview:** Standalone HTML file featuring interactive pan/zoom, dark/light theme toggle, and 1-click SVG clipboard export.

---

## 2. 45 Supported Diagram Types

Whenever the user asks for a diagram, choose the optimal archetype from these 6 categories:

### A. Software & Cloud Architecture (12 Types)
1. **C4 Model - Context:** High-level system boundary, users, and external software systems.
2. **C4 Model - Container:** Applications, databases, microservices, mobile apps.
3. **C4 Model - Component:** Internal breakdown of a container into controllers, services, repositories.
4. **Cloud Infrastructure Topology:** VPCs, subnets, ALBs, ECS/EKS clusters, S3 buckets, RDS.
5. **Microservices Mesh:** Service-to-service RPC, service discovery, Envoy proxies, circuit breakers.
6. **Event-Driven & Message Bus:** Kafka / RabbitMQ topics, producers, consumer groups, dead-letter queues (DLQ).
7. **Serverless Architecture:** API Gateway, Lambda / Cloud Functions, DynamoDB, EventBridge.
8. **Hexagonal / Clean Architecture:** Domain core, use cases, ports, adapters, infrastructure layer.
9. **CQRS & Event Sourcing:** Command bus, Write database, Event store, Projector, Read replica.
10. **Data Lakehouse Pipeline:** Ingestion (Kafka/Debezium), Bronze (raw), Silver (cleaned), Gold (marts).
11. **Edge & CDN Architecture:** Cloudflare Workers / Fastly, PoP routing, caching layers, Origin shield.
12. **Multi-Region Disaster Recovery:** Active-Active / Active-Passive replication, Route53 health checks.

### B. Security, Auth & Networks (6 Types)
13. **OAuth2 / OIDC Authorization Code Flow:** User, Client app, Auth server, Token exchange, Resource server.
14. **Zero-Trust Network Architecture:** Identity-aware proxy, mTLS certificates, RBAC policies.
15. **JWT / Session Token Lifecycle:** Token issuance, validation, refresh token rotation, revocation.
16. **Network Security Zones:** Public DMZ, Private Application Tier, Isolated Database Subnet.
17. **Webhook Lifecycle & Retry:** Sender, HMAC signature header, receiver verification, exponential backoff.
18. **SSL/TLS Handshake Flow:** Client hello, server cert, key exchange, symmetric cipher establishment.

### C. Database & Data Models (6 Types)
19. **Entity-Relationship Diagram (ERD):** Tables, PK/FK links, column data types, cardinality (1:1, 1:N, N:M).
20. **Distributed Sharding & Partitioning:** Hash router, partition keys, node rebalancing.
21. **Cache-Aside / Write-Through Flow:** App layer, Redis cache check (hit/miss), Database sync.
22. **Data Flow Diagram (DFD Level 0/1):** External entities, processes, data stores, data flows.
23. **Graph Database Topology:** Nodes, edges, property graphs, traversal path representation.
24. **Time-Series / OLAP Storage:** Ingestion buffer, column-store partition, rollup aggregations.

### D. Process, State & Sequence (8 Types)
25. **Detailed Sequence Diagram:** Vertical lifelines, synchronous request, asynchronous callback, loops, alt blocks.
26. **Finite State Machine (FSM):** States, trigger events, transition guards, entry/exit actions.
27. **Complex Decision Tree:** Root criteria, branching conditions, leaf outcomes.
28. **Cross-Functional Swimlane Flowchart:** Lanes per department/role, approval gates, handoffs.
29. **CI/CD Deployment Pipeline:** Lint, unit test, container build, security scan, canary deploy, rollback.
30. **Saga Orchestration vs Choreography:** Order service, Payment service, Inventory service compensation.
31. **WebSocket Realtime Bidirectional Flow:** Handshake, heartbeats, channel subscriptions, broadcast.
32. **Rate Limiting & Token Bucket:** Leaky bucket, sliding window counter, Redis token refill.

### E. Strategy, Product & Operations (8 Types)
33. **Wardley Map:** Genesis -> Custom-Built -> Product -> Commodity vs Value Chain visibility.
34. **Customer Journey Map:** Stages (Discovery, Evaluation, Purchase, Retention), actions, thoughts, pain points.
35. **User Onboarding Flow:** Steps, drop-off points, activation checkpoints.
36. **Growth Flywheel:** Compounding feedback loops and acceleration inputs.
37. **2x2 Prioritization Matrix:** Effort vs Impact / Urgency vs Importance (Eisenhower).
38. **Conversion Funnel:** Impressions, clicks, signups, trial activations, paid conversions.
39. **RACI Responsibility Matrix:** Responsible, Accountable, Consulted, Informed across teams.
40. **Org Hierarchy & Team Topologies:** Stream-aligned, Enabling, Complicated-subsystem, Platform teams.

### F. Quantitative & Systems (5 Types)
41. **Sankey Diagram:** Flow distribution, resource allocation, cost breakdown.
42. **Roadmap & Gantt Timeline:** Milestones, sprints, dependency blockers, critical path.
43. **System Capacity & Bottleneck Graph:** Queuing latency vs throughput saturation curve.
44. **Mind Map / Taxonomic Tree:** Central concept, primary nodes, leaf attributes.
45. **Venn & Euler Intersections:** Overlapping sets, commonalities, unique subsets.

---

## 3. Design Tokens & Visual Hierarchy (Strict Specs)

Follow these color tokens and typography specifications for all SVG rendering:

### Palette Specification
| Role | Light Mode Hex | Dark Mode Hex | Usage |
|---|---|---|---|
| **Canvas Background** | `#F8FAFC` (Slate-50) | `#09090B` (Zinc-950) | Full SVG container fill |
| **Card / Node Background** | `#FFFFFF` | `#18181B` (Zinc-900) | Main service/component boxes |
| **Subtle Container / Zone** | `#F1F5F9` (Slate-100) | `#141416` | Grouping boundary (e.g. VPC, Tier) |
| **Borders & Dividers** | `#CBD5E1` (Slate-300) | `#27272A` (Zinc-800) | Node outlines, lane dividers (1.5px) |
| **Primary Text** | `#0F172A` (Slate-900) | `#F8FAFC` (Slate-50) | Service names, bold headers |
| **Secondary / Muted Text**| `#64748B` (Slate-500) | `#A1A1AA` (Zinc-400) | Descriptions, specs, ports, protocols |
| **Connector Lines** | `#64748B` (Slate-500) | `#71717A` (Zinc-500) | Directional flow arrows (`stroke-width="2"`) |

### Semantic Accent Colors
- **Compute / Logic:** Blue (`#3B82F6` / fill background `#EFF6FF` light, `#1E3A8A` dark)
- **Database / Storage:** Emerald (`#10B981` / fill background `#ECFDF5` light, `#064E3B` dark)
- **Queues / Streaming / Events:** Amber (`#F59E0B` / fill background `#FFFBEB` light, `#78350F` dark)
- **Security / Auth / Gateway:** Violet (`#8B5CF6` / fill background `#F5F3FF` light, `#4C1D95` dark)
- **Alert / Firewall / Critical:** Rose (`#EF4444` / fill background `#FEF2F2` light, `#7F1D1D` dark)
- **External Client / Mobile / Web:** Sky (`#0EA5E9` / fill background `#F0F9FF` light, `#0C4A6E` dark)

### Typography Stack
```xml
font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Inter", "Plus Jakarta Sans", sans-serif;
```
For code, ports, endpoints, or DB field types:
```xml
font-family: "JetBrains Mono", "Fira Code", monospace;
```

---

## 4. Production SVG Boilerplate Structure

When constructing an SVG diagram, always structure the elements inside clean semantic SVG tags:

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 600" width="100%" height="100%" style="background:#09090B; font-family: -apple-system, BlinkMacSystemFont, 'Inter', sans-serif;">
  <defs>
    <!-- Arrowhead Marker -->
    <marker id="arrow" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
      <path d="M 0 1 L 10 5 L 0 9 z" fill="#71717A"/>
    </marker>
    <!-- Accent Arrowhead -->
    <marker id="arrow-active" viewBox="0 0 10 10" refX="6" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
      <path d="M 0 1 L 10 5 L 0 9 z" fill="#3B82F6"/>
    </marker>
    <!-- Subtle Node Glow Filter -->
    <filter id="soft-shadow" x="-5%" y="-5%" width="110%" height="115%" filterUnits="userSpaceOnUse">
      <feDropShadow dx="0" dy="4" stdDeviation="6" flood-color="#000000" flood-opacity="0.3"/>
    </filter>
  </defs>

  <!-- Background Canvas Grid (Subtle 24px Dots) -->
  <pattern id="dot-grid" x="0" y="0" width="24" height="24" patternUnits="userSpaceOnUse">
    <circle cx="2" cy="2" r="1" fill="#27272A"/>
  </pattern>
  <rect width="100%" height="100%" fill="url(#dot-grid)"/>

  <!-- Zone / Boundary Group (e.g. VPC) -->
  <rect x="50" y="50" width="900" height="500" rx="12" fill="#141416" stroke="#27272A" stroke-width="1.5" stroke-dasharray="6 4"/>
  <text x="70" y="80" fill="#A1A1AA" font-size="12" font-weight="600" letter-spacing="0.05em">VPC (10.0.0.0/16) - PRODUCTION</text>

  <!-- Component Card Node -->
  <g filter="url(#soft-shadow)">
    <rect x="100" y="150" width="180" height="90" rx="8" fill="#18181B" stroke="#3B82F6" stroke-width="1.5"/>
    <!-- Status / Accent Badge Pill -->
    <rect x="116" y="166" width="46" height="18" rx="4" fill="#1E3A8A"/>
    <text x="124" y="179" fill="#93C5FD" font-size="10" font-weight="700">AUTH</text>
    <text x="116" y="206" fill="#F8FAFC" font-size="15" font-weight="600">Auth Gateway</text>
    <text x="116" y="224" fill="#A1A1AA" font-size="12">OAuth 2.1 / OIDC</text>
  </g>

  <!-- Orthogonal Connector Line -->
  <path d="M 280 195 L 380 195" fill="none" stroke="#71717A" stroke-width="2" marker-end="url(#arrow)"/>
  <!-- Connector Label Pill -->
  <rect x="300" y="180" width="60" height="18" rx="4" fill="#27272A"/>
  <text x="330" y="193" text-anchor="middle" fill="#CBD5E1" font-size="10" font-family="monospace">gRPC / TLS</text>
</svg>
```

---

## 5. Self-Contained Interactive HTML Preview Template

When delivering the diagram to the user, write a single-file `.html` preview with built-in Pan/Zoom and 1-Click Copy SVG capability:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>System Architecture Diagram</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { background: #09090b; color: #f8fafc; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif; display: flex; flex-direction: column; height: 100vh; overflow: hidden; }
    header { height: 56px; border-bottom: 1px solid #27272a; display: flex; align-items: center; justify-content: space-between; padding: 0 24px; background: #141416; }
    h1 { font-size: 16px; font-weight: 600; }
    .actions { display: flex; gap: 8px; }
    button { background: #27272a; color: #f8fafc; border: 1px solid #3f3f46; padding: 6px 14px; border-radius: 6px; font-size: 13px; font-weight: 500; cursor: pointer; transition: all 0.15s ease; }
    button:hover { background: #3f3f46; }
    button.primary { background: #3b82f6; border-color: #2563eb; }
    button.primary:hover { background: #2563eb; }
    #canvas-container { flex: 1; display: flex; align-items: center; justify-content: center; position: relative; overflow: hidden; cursor: grab; }
    #canvas-container:active { cursor: grabbing; }
    svg { max-width: 100%; max-height: 100%; user-select: none; }
  </style>
</head>
<body>
  <header>
    <h1>System Architecture Topology</h1>
    <div class="actions">
      <button onclick="resetZoom()">Reset View</button>
      <button class="primary" onclick="copySVG()">Copy SVG Code</button>
    </div>
  </header>
  <div id="canvas-container">
    <!-- EMBED RAW SVG HERE -->
  </div>
  <script>
    let scale = 1, panX = 0, panY = 0, isDragging = false, startX, startY;
    const container = document.getElementById('canvas-container');
    const svg = container.querySelector('svg');

    function updateTransform() {
      svg.style.transform = `translate(${panX}px, ${panY}px) scale(${scale})`;
      svg.style.transition = isDragging ? 'none' : 'transform 0.1s ease-out';
    }

    container.addEventListener('wheel', (e) => {
      e.preventDefault();
      const zoomFactor = e.deltaY < 0 ? 1.1 : 0.9;
      scale = Math.min(Math.max(0.4, scale * zoomFactor), 4);
      updateTransform();
    });

    container.addEventListener('mousedown', (e) => {
      if (e.target.closest('button')) return;
      isDragging = true;
      startX = e.clientX - panX;
      startY = e.clientY - panY;
    });

    window.addEventListener('mousemove', (e) => {
      if (!isDragging) return;
      panX = e.clientX - startX;
      panY = e.clientY - startY;
      updateTransform();
    });

    window.addEventListener('mouseup', () => { isDragging = false; });

    function resetZoom() {
      scale = 1; panX = 0; panY = 0;
      updateTransform();
    }

    function copySVG() {
      const svgText = document.querySelector('#canvas-container svg').outerHTML;
      navigator.clipboard.writeText(svgText).then(() => {
        alert('SVG copied to clipboard! You can paste directly into Figma, Illustrator, or Markdown.');
      });
    }
  </script>
</body>
</html>
```

---

## 6. Execution Checklist Before Handing Off

Before delivering the diagram to the user:
1. **Grid Check:** Are nodes aligned to standard multiples of 8px?
2. **Readability:** Are all text labels contrasting sufficiently against their background (WCAG AA minimum)?
3. **Connector Sanity:** Do orthogonal line paths have clear clearance without cutting through unrelated node texts?
4. **Export Readiness:** Is the output saved both as a raw `.svg` file (for embedding in READMEs or Figma) and an `.html` file (for interactive browser viewing)?
