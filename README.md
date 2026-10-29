# Clientele

[![CI](https://github.com/gryllifish/clientele/actions/workflows/ci.yml/badge.svg)](https://github.com/gryllifish/clientele/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A three-screen Flutter client dashboard: a filterable client grid, client
profiles and a payments tab. Data is mocked locally; there is no backend.

[Live demo](https://gryllifish.github.io/clientele/) (web build; on a
desktop it opens inside a phone frame).

| Filters | Profile | Payments |
|:---:|:---:|:---:|
| <img src="docs/gifs/filters.gif" width="240" alt="Client grid animating between filters"> | <img src="docs/gifs/hero.gif" width="240" alt="Client photo flying into the profile"> | <img src="docs/gifs/payments.gif" width="240" alt="Payments tab, then a profile opening its client payments"> |

## Features
- Client grid with filters (All, Oldest, Newest, Hot) and search by name
  or role.
- Client profile with the next session and a link to that client's
  payments.
- Payments tab: a rolling 30-day total, its change against the previous
  30 days, and the payments behind it.
- English and Spanish.

## Notes
Decisions that aren't obvious from the code alone.

- **The grid animates instead of rebuilding.** Cards are keyed by client
  id and positioned by slot, so on a filter or search change each card
  slides to its new slot, removed cards fade out where they were, and new
  ones enter after the others start moving
  ([`animated_client_grid.dart`](lib/features/clients/presentation/widgets/animated_client_grid.dart)).
- **The Hero interpolates its corner radius.** Card and profile photos
  use different radii; animating the radius during the flight avoids a
  snap at the end
  ([`client_photo.dart`](lib/features/clients/presentation/widgets/client_photo.dart)).
- **Mock dates follow today.** The bundled JSON was written against a
  fixed date; data sources shift every date by the days elapsed since,
  so "today" and the 30-day window always contain data
  ([`demo_dates.dart`](lib/core/utils/demo_dates.dart)).
- **Payments became a tab.** The design opened it from the next-session
  card, which didn't fit; it's a tab, and a profile opens it filtered to
  that client through a query parameter.
- **Out-of-scope controls say so.** Buttons outside the demo (add client,
  other tabs) show a short notice rather than doing nothing.
- **Reduce motion** turns page transitions, the Hero, the grid and the
  counters into instant changes.

## Architecture
```
presentation → controllers → domain ← data
```
Riverpod 3 with code generation, go_router, freezed and
json_serializable. Data sources throw `AppException`; repositories return
`Result<T>`; the UI shows localized `Failure` messages.

```
lib/
├── app/        App widget, bootstrap, router
├── core/       config, constants, error, l10n, router, theme, utils
├── shared/     cross-feature providers and widgets
└── features/
    ├── clients/{data,domain,controllers,presentation}
    └── transactions/{data,domain,controllers,presentation}
```

## Running it
Requires Flutter 3.44+.

```sh
flutter pub get
flutter run
```

Optional config goes in `env/dev.json` (copy `env/dev.json.example`), passed
with `--dart-define-from-file=env/dev.json`. Generated code is committed;
after changing annotated classes or ARB files, run
`dart run build_runner build --delete-conflicting-outputs`.

## Tests
`scripts/verify.sh` runs pub get, codegen, l10n, format, analyze and the
tests; CI runs it on every push and PR, fails on stale generated files,
and deploys the web demo from `main`.

Unit tests cover domain rules, data sources (including the bundled JSON),
repositories and controllers. Widget tests run the app on fixture data:
filtering, search, profile and payments navigation, Reduce motion and the
desktop frame.

## Credits and license
Client photos from [Unsplash](https://unsplash.com) (Unsplash License).
Manrope and DM Sans are bundled under the SIL Open Font License. Code under
the [MIT License](LICENSE); photos keep their Unsplash License.
