# Product

> Per-project file. Everything else in `.claude/steering/` is generic and can
> be copied to new projects unchanged.

## Purpose
Portfolio demo: a 3-screen client dashboard that showcases smooth
animations, a clean modern UI and a production-grade Flutter architecture.
It is intentionally **not** a complete app: data is mocked locally and there
is no backend or authentication.

## Target audience
- Recruiters and engineers reviewing the GitHub repo and the demo video.
- Secondary: the author, as a reusable architecture reference.

## Scope
### In scope
1. **Dashboard** (done): greeting, stats, filters (All / Oldest / Newest /
   Hot) and a client grid that animates between filter results.
2. **Client profile** (done): photo flies in from the card with a `Hero`
   that also morphs its corner radius; a calendar card leads to screen 3.
3. **Transaction history** (done): dark screen with a rolling 30-day total
   that counts up, its change against the previous 30 days, and colorful
   cards with stacked client avatars that rise in one by one. The design's
   "May 2024 / from April" becomes a rolling window so the shifted mock
   data never straddles a month boundary.

### Out of scope
Auth, backend/API, creating or editing clients, bottom-nav destinations
other than Home, persistence.

## Design
- Figma: https://www.figma.com/design/nuaSmkMecIrbciL60Bxyv3/Untitled?node-id=103-3
- Node `103:3` is a **React code layer** (not vector frames) holding all
  three screens. Read it through the Figma MCP: `get_design_context` returns
  links to `src/App.tsx` (structure, copy, data) and `src/index.css`
  (colors, type, spacing); read only the file you need. `get_screenshot`
  fails on code layers.
- Tokens are mirrored in `lib/core/theme/`. Labels the design sets at
  9–10px are raised to 11px for legibility.

## Success criteria
- Animations run at 60 fps on a mid-range phone.
- `scripts/verify.sh` passes; the README has a GIF of every screen.

## Open questions
- _TODO_
