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
2. **Client detail** (todo): photo flies in from the card with a `Hero`; a
   calendar card leads to screen 3.
3. **Transaction history** (todo): dark screen with colorful cards and
   stacked client avatars.

### Out of scope
Auth, backend/API, creating or editing clients, bottom-nav destinations
other than Home, persistence.

## Design
- Figma (all screens): https://www.figma.com/design/nuaSmkMecIrbciL60Bxyv3/Untitled?node-id=103-3
- Per-screen frame links: _TODO (right click a frame → Copy link to
  selection)._ Read one frame at a time through the Figma MCP server; never
  load the whole file.
- Figma is the source of truth for visuals; tokens are mirrored in
  `lib/core/theme/`.

## Success criteria
- Animations run at 60 fps on a mid-range phone.
- `scripts/verify.sh` passes; the README has a GIF of every screen.

## Open questions
- _TODO_
