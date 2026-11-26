# Manual Rebuild Progress

Project: `C:\dev\mini_pokemon_from_zero`
Branch: `main`
Local only. No remote writes.

Workflow: assistant explains one file, gives complete code, user creates and saves it, assistant verifies, then commit. Do not start the next file until the current one is verified.

## Completed

- Blank scaffold created with `flutter create`.
- Baseline `flutter test` passed 1/1.
- Design and plan docs copied and committed in `6d92d2d`.
- `lib/domain/entities/pokemon_summary.dart` created by user.
- `dart analyze lib/domain/entities/pokemon_summary.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- Commit `16cf817 feat: add pokemon summary entity`.
- `lib/domain/entities/pokemon_page.dart` created by user.
- `dart analyze lib/domain/entities/pokemon_page.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- Commit `8a7c3dc feat: add pokemon page entity`.
- Progress tracker committed in `d9bbfcc`.
- `lib/domain/entities/pokemon.dart` created by user.
- `dart analyze lib/domain/entities/pokemon.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- `lib/domain/repositories/pokemon_catalog_repository.dart` created by user in the wrong folder, moved to the correct `lib/domain/repositories/` path.
- `dart analyze lib/domain/repositories/pokemon_catalog_repository.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- `lib/domain/usecases/fetch_pokemon_page.dart` created by user with filename typo `fecth_`, renamed to correct `fetch_`.
- `dart analyze lib/domain/usecases/fetch_pokemon_page.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- `lib/domain/usecases/search_pokemon.dart` created by user.
- `dart analyze lib/domain/usecases/search_pokemon.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- `pubspec.yaml` updated by user with `http: ^1.6.0`, `flutter_bloc: ^9.1.1`, `bloc: ^9.2.1`.
- `flutter pub get` resolved `bloc 9.2.2`, `flutter_bloc 9.1.1`, `http 1.6.0`; 8 dependencies changed.
- `flutter test` -> 1/1 pass.
- `lib/data/models/poke_api_page_dto.dart` created by user, first saved in `lib/data/`, moved to correct `lib/data/models/` path.
- `dart analyze lib/data/models/poke_api_page_dto.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- `lib/data/datasources/poke_api_service.dart` created by user with `fetchPage` only.
- `dart analyze lib/data/datasources/poke_api_service.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- `lib/data/repositories/poke_api_catalog_repository.dart` created by user. `fetchPage` implemented; `fetchDetails` left as `UnimplementedError` stub for Phase 2.
- `dart analyze lib/data/repositories/poke_api_catalog_repository.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- `lib/presentation/blocs/discover_bloc.dart` created by user with page-one load, `Load more`, and `Retry`. Search events deferred to Phase 2.
- `dart analyze lib/presentation/blocs/discover_bloc.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- `lib/presentation/pages/pokemon_discover_page.dart` created by user as empty placeholder, then filled. Import changed from `package:flutter/material.dart` to `package:material_ui/material_ui.dart` because Flutter flags the former as deprecated in this SDK.
- `dart analyze lib/presentation/pages/pokemon_discover_page.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass.
- `lib/main.dart` replaced with composition root for the read slice.
- `test/widget_test.dart` replaced with fake-repository smoke test; unused imports removed after analyzer warnings.
- `dart analyze lib/main.dart test/widget_test.dart` -> `No issues found!`
- `flutter test` -> 1/1 pass: `Discover page shows first Pokemon`.

## Dependency correction

The original nine-file order assumed `Pokemon`, `SearchPokemon`, `CollectionBloc`, `PokemonDetailPage`, and packages already existed from the source worktree. The blank project has none of them. The order below is corrected for this project.

## Phase 1: read slice, "get all Pokemons"

1. `lib/domain/entities/pokemon_summary.dart` DONE
2. `lib/domain/entities/pokemon_page.dart` DONE
3. `lib/domain/entities/pokemon.dart` DONE
4. `lib/domain/repositories/pokemon_catalog_repository.dart` DONE
5. `lib/domain/usecases/fetch_pokemon_page.dart` DONE
6. `lib/domain/usecases/search_pokemon.dart` DONE
7. `pubspec.yaml`: add `http`, `flutter_bloc`, `bloc` DONE
8. `lib/data/models/poke_api_page_dto.dart` DONE
9. `lib/data/datasources/poke_api_service.dart` DONE
10. `lib/data/repositories/poke_api_catalog_repository.dart` DONE
11. `lib/presentation/blocs/discover_bloc.dart` DONE
12. `lib/presentation/pages/pokemon_discover_page.dart` DONE
13. `lib/main.dart`: composition root for this slice DONE

Gate for this phase: app shows PokéAPI page one, appends with `Load more`, and stops when `hasMore` is false.

## Later phases

- Phase 2 detail: `poke_api_dto.dart`, detail use case, detail BLoC, detail page, network portrait widget.
- Phase 3 collect in memory: collection contract, in-memory repository, collection use cases, collection BLoC, list page, card, form dialog, theme.
- Phase 4 SQLite: `pokemon_database.dart`, `pokemon_row.dart`, `sqlite_collection_repository.dart`, `main.dart`.
- Phase 5 remaining actions: update, toggle favorite, remove, form dialog.
- Phase 6 parity and demo.

## Next step

Run the app manually with `flutter run` and confirm real PokéAPI page one loads, `Load more` appends rows, and the button disappears when `hasMore` is false. After that gate passes, start Phase 2 with `lib/data/models/poke_api_dto.dart`.
