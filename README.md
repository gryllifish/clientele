# Clientele

A 3-screen Flutter demo focused on **smooth animations** and a **clean,
modern UI**, built on a production-grade architecture.

<!-- TODO: add a GIF of the dashboard filters and the Hero transition -->

## What it shows
- **Animated grid filtering.** Switching between All / Oldest / Newest / Hot
  doesn't rebuild the grid: each card slides to its new slot, removed cards
  fade out in place and new ones fade and scale in
  ([`animated_client_grid.dart`](lib/features/clients/presentation/widgets/animated_client_grid.dart)).
- **Hero transition.** Tapping a client flies their photo into the profile
  while its corners morph from the card's radius to the portrait's arch
  ([`client_photo.dart`](lib/features/clients/presentation/widgets/client_photo.dart)).
- **Polished details:** frosted bottom bar with a sliding indicator,
  animated chips and counters, staggered entrance.
- **Clean architecture:** feature-first layers, repository pattern, typed
  errors with `Result`/`Failure`, and Riverpod controllers. No business
  logic lives in widgets.
- **i18n:** English and Spanish, with locale-aware dates.

## Architecture
```
presentation → controllers → domain ← data
  widgets       @riverpod      entities   DTOs, data sources,
                notifiers      repo       repository impls
                               interfaces
```
- **State/DI:** Riverpod 3 with code generation.
- **Models:** freezed + json_serializable. DTOs are mapped to domain
  entities explicitly.
- **Errors:** data sources throw `AppException`; repositories return
  `Result<T>` through `guard()`; the UI renders localized `Failure`
  messages.
- **Routing:** go_router. **Lints:** very_good_analysis.

```
lib/
├── app/        App widget, bootstrap, router
├── core/       config, constants, error, l10n, network, router, theme, utils
├── shared/     cross-feature providers and widgets
└── features/
    └── clients/{data,domain,controllers,presentation}
```

## Getting started
Requires Flutter 3.44+.

```sh
flutter pub get
cp env/dev.json.example env/dev.json        # optional
flutter run --dart-define-from-file=env/dev.json
```

Generated code is committed, so the app runs right after cloning. After
changing annotated classes or ARB files:

```sh
dart run build_runner build --delete-conflicting-outputs
```

## Quality gate
```sh
scripts/verify.sh   # pub get, codegen, l10n, format, analyze, test
```

## Credits
Client photos from [Unsplash](https://unsplash.com) (Unsplash License).
