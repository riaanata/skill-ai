# DESIGN.md — Master UI/UX Design System Specification
> Canonical Design System guide for AI coding agents. Adheres to professional, modern, and accessible design patterns.

---

## 1. Atmosphere & Visual Tone
- **Vibe:** Clean, modern, confident, and clutter-free (Modern High-Craft SaaS / FinTech aesthetic).
- **Principles:**
  - **Content-first:** Interface exists to serve the data and user actions, not distract with excessive decoration.
  - **Intentional Whitespace:** Generous breathing room; avoid cramped layouts.
  - **Subtle Depth:** Use 1px micro-borders and soft ambient shadows instead of heavy skeuomorphic effects.
  - **Tactile Feedback:** Every interactive element must provide crisp visual feedback on hover, active, and focus.

---

## 2. Color System & Semantic Tokens
Use semantic color tokens (compatible with Tailwind CSS / CSS Variables). Avoid raw random hex values.

### Light & Dark Base
- **Surface / Background:**
  - Light: Canvas `#FAFAFA` (Zinc-50), Card/Surface `#FFFFFF`, Inset `#F4F4F5` (Zinc-100).
  - Dark: Canvas `#09090B` (Zinc-950), Card/Surface `#18181B` (Zinc-900), Inset `#27272A` (Zinc-800).
- **Borders & Dividers:**
  - Light: `#E4E4E7` (Zinc-200) or `rgba(0, 0, 0, 0.08)`.
  - Dark: `#27272A` (Zinc-800) or `rgba(255, 255, 255, 0.1)`.

### Typography Colors (WCAG AA Compliant)
- **Primary Text:** Light `#09090B` / Dark `#FAFAFA` (High contrast, 100% readability).
- **Secondary / Muted Text:** Light `#71717A` (Zinc-500) / Dark `#A1A1AA` (Zinc-400).
- **Disabled Text:** Light `#A1A1AA` / Dark `#52525B`.

### Brand & Accent
- **Primary Brand:** Deep Indigo / Slate Blue (`#3B82F6` to `#2563EB`) or Neutral Modern Black (`#18181B`).
- **States:**
  - **Success:** Emerald `#10B981` (Background: `#ECFDF5` light / `#064E3B` dark).
  - **Warning:** Amber `#F59E0B` (Background: `#FFFBEB` light / `#78350F` dark).
  - **Danger / Error:** Rose `#EF4444` (Background: `#FEF2F2` light / `#7F1D1D` dark).
  - **Info:** Sky `#0EA5E9` (Background: `#F0F9FF` light / `#0C4A6E` dark).

---

## 3. Typography Scale & Hierarchy
- **Font Stack:** Clean geometric sans-serif (Inter, Plus Jakarta Sans, Geist, or modern system UI sans).
- **Hierarchy:**
  - **Display / Hero:** `36px` - `48px` | Weight: `700 (Bold)` | Tracking: `-0.025em`.
  - **H1 (Page Title):** `28px` - `32px` | Weight: `700 (Bold)` | Tracking: `-0.02em`.
  - **H2 (Section Header):** `22px` - `24px` | Weight: `600 (Semibold)` | Tracking: `-0.015em`.
  - **H3 (Card Title / Subhead):** `18px` - `20px` | Weight: `600 (Semibold)`.
  - **Body (Standard):** `14px` - `16px` | Weight: `400 (Regular)` / `500 (Medium)` | Line-height: `1.5` - `1.6`.
  - **Caption / Meta / Badges:** `12px` - `13px` | Weight: `500 (Medium)` | Tracking: `0.01em`.

---

## 4. Spacing, Grid & Layout
- **Base Grid:** 8-point grid scale (use multiples: `4px`, `8px`, `12px`, `16px`, `24px`, `32px`, `48px`, `64px`).
- **Container Max-Widths:**
  - Dashboard / Full-bleed: `max-w-7xl` (`1280px`) with `px-4 sm:px-6 lg:px-8`.
  - Reading / Document / Articles: `max-w-3xl` (`768px`).
  - Modal / Dialog: `max-w-md` (`448px`) to `max-w-lg` (`512px`).
- **Card Spacing:** Inner padding `p-5` (`20px`) or `p-6` (`24px`). Gap between cards `gap-4` to `gap-6`.

---

## 5. Depth, Elevation & Corner Radii
- **Corner Radii:**
  - Buttons, Inputs, Badges: `rounded-lg` (`8px`) or `rounded-md` (`6px`).
  - Cards, Modals, Panels: `rounded-xl` (`12px`) or `rounded-2xl` (`16px`).
  - Chips / Avatars / Pills: `rounded-full` (`9999px`).
- **Shadow Scale:**
  - Card / Base: `shadow-xs` / `shadow-sm` + `border border-zinc-200 dark:border-zinc-800`.
  - Dropdown / Popover: `shadow-md border border-zinc-200 dark:border-zinc-800`.
  - Modal / Overlay: `shadow-2xl border border-zinc-200 dark:border-zinc-800`.

---

## 6. Core Component Guidelines

### Buttons
- **Primary:** High-contrast solid background, crisp white/dark text, subtle shadow, active slight shrink (`active:scale-[0.98]`).
- **Secondary / Outline:** 1px border, subtle background on hover (`hover:bg-zinc-100 dark:hover:bg-zinc-800`).
- **Ghost:** Transparent background, visible on hover only.
- **Destructive:** Red accent, never ambiguous.
- **Sizes:** Small (`h-8 px-3 text-xs`), Medium (`h-10 px-4 text-sm`), Large (`h-12 px-6 text-base`).

### Form Inputs & Fields
- Height: `h-10` (`40px`). Clear 1px border.
- Focus state: Highlight ring with clean offset (`focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:outline-none`).
- Always pair with unambiguous labels and inline error messages.

### Cards & Data Tables
- Always use subtle background separation (`bg-white dark:bg-zinc-900`).
- Tables: Sticky header, zebra striping or crisp border-b rows, right-aligned numeric data, monospace numbers (`tabular-nums font-mono`).

---

## 7. Motion & Micro-interactions
- **Duration:** Micro-actions: `150ms` - `200ms`. Page transitions: `250ms` - `300ms`.
- **Easing:** Standard `cubic-bezier(0.16, 1, 0.3, 1)` or `ease-out`.
- **Hover Transitions:** Subtle opacity or background color shifts (`transition-colors duration-150`).
- **Avoid:** Slow, bouncy, exaggerated animations that delay user productivity.

---

## 8. Anti-Patterns & Hard Rules (Dos and Don'ts)

| ❌ STRICTLY FORBIDDEN (AI Slop) | ✅ REQUIRED STANDARD |
| :--- | :--- |
| **No generic purple/pink AI gradients.** | Use purposeful, solid, neutral palettes with singular accent tones. |
| **No unreadable low-contrast grey text.** | Ensure text passes WCAG AA contrast (minimum 4.5:1 ratio). |
| **No buttons without interactive states.** | Every clickable element must have `hover`, `active`, and `focus` states. |
| **No random hardcoded pixel values.** | Use design tokens and Tailwind utility scale (`p-4`, `gap-3`, `text-sm`). |
| **No desktop-only rigid layouts.** | Build responsive layouts that adapt smoothly to mobile screens. |
| **No missing loading, error, or empty states.** | Always provide clear empty-state illustrations/text and skeleton loaders. |

---

## 9. Accessibility (a11y) & Mobile Readiness
- **Minimum Touch Target:** Buttons and links on mobile must be at least `44px x 44px`.
- **Keyboard Navigation:** All interactive elements must be focusable via `Tab` with visible focus rings.
- **Semantic HTML:** Use `<button>`, `<nav>`, `<main>`, `<header>`, `<article>`, `<dialog>` rather than nested `<div>`s with click handlers.

---

## 10. The 8 Modern UI Presets (Code XR & Neo-FinTech Suite)

When building new apps or dashboards, you can activate any of these 8 pre-calibrated modern aesthetic archetypes:

### 1. Electric Cobalt Clean Admin
- **Best For:** Enterprise dashboards, analytics suites, SaaS control panels.
- **Tokens:** Canvas `#F8FAFC` | Card `#FFFFFF` | Brand Primary `#2563EB` | Active Pill `linear-gradient(135deg, #1D4ED8, #3B82F6)` | Shadow `0 16px 32px -12px rgba(37,99,235, 0.08)` | Radius `20px`.
- **Chart Style:** Smooth spline area chart with cobalt line and fading vertical gradient fill.

### 2. Volt Lime Neo-FinTech Bento
- **Best For:** Modern CRM, FinTech apps, high-conversion growth dashboards.
- **Tokens:** Canvas `#FAFAFA` | Card `#FFFFFF` | Hero Accent `#B7F538` (Electric Lime) | Accent Text `#0F172A` (Bold Charcoal) | Shadow `0 20px 40px -15px rgba(0,0,0,0.06)` | Radius `20px`.
- **Key Element:** High-contrast lime badge pills (`v2`, `Source Code Included`) and doodle scribble vectors.

### 3. Translucent Glassmorphism (Purple & Cyan)
- **Best For:** Checkout flows, payment gateways, premium consumer apps.
- **Tokens:** Canvas `#F1F5F9` (Light) / `#0B0F19` (Dark) | Glass Card `rgba(255, 255, 255, 0.7)` with `backdrop-filter: blur(16px)` | Border `1px solid rgba(255, 255, 255, 0.3)` | Shadow `0 20px 30px rgba(0,0,0,0.05)`.
- **Accent:** Royal Purple `#7C3AED` to Indigo `#6366F1`.

### 4. 3D Claymorphism & Soft Neumorphism
- **Best For:** Creative dashboards, Web3 apps, playful interactive tools.
- **Tokens:** Canvas `#EEF2F6` | Card `#FFFFFF` | Dual Shadow `8px 8px 20px rgba(166, 180, 200, 0.4), -8px -8px 20px rgba(255, 255, 255, 0.8)` | Radius `24px` | Accent Sky Blue `#38BDF8`.

### 5. Futuristic Dark Cyber-AI
- **Best For:** AI models, bot orchestrators, developer telemetry, dark mode enthusiasts.
- **Tokens:** Canvas `#09090B` | Card `#18181B` | Border `#27272A` | Glowing Accents: Cyan `#06B6D4`, Emerald `#10B981`, Violet `#8B5CF6` | Text `#F8FAFC`.
- **Chart Style:** High-glow neon path lines with dark grid background dots.

### 6. Warm Coral & Sunset Orange
- **Best For:** Marketing analytics, HR platforms, community dashboards.
- **Tokens:** Canvas `#FFFDFB` | Card `#FFFFFF` | Brand Coral `#FB7185` | Primary Orange `#EA580C` | Border `#F3E8E2` | Radius `18px`.

### 7. Clean Minimalist Developer Portfolio & E-Commerce
- **Best For:** Portfolios, clothing closet, luxury catalogs.
- **Tokens:** Canvas `#FFFFFF` | Typography Pure Black `#09090B` (High Contrast) | Monospace Subheaders | 1px Slate Dividers `#E2E8F0` | Uncluttered generous whitespace.

### 8. Kinetic Micro-Interaction Suite
- **Animation Tokens:**
  - Card Entrance: `staggerChildren: 0.08`, `y: [16, 0]`, `opacity: [0, 1]` (duration `250ms`).
  - Chart Reveal: SVG path `strokeDasharray` and `strokeDashoffset` transition from `1000` to `0` (duration `800ms ease-out`).
  - Button Active: `scale(0.97)` on tap, `scale(1.02)` on hover.
  - OTP Input Jump: Focus state border glow with automatic auto-focus next cell on character entry.

