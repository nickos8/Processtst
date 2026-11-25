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

## Dependency correction

The original nine-file order assumed `Pokemon`, `SearchPokemon`, `CollectionBloc`, `PokemonDetailPage`, and packages already existed from the source worktree. The blank project has none of them. The order below is corrected for this project.

## Phase 1: read slice, "get all Pokemons"

1. `lib/domain/entities/pokemon_summary.dart` DONE
2. `lib/domain/entities/pokemon_page.dart` DONE
3. `lib/domain/entities/pokemon.dart` NEXT
4. `lib/domain/repositories/pokemon_catalog_repository.dart`
5. `lib/domain/usecases/fetch_pokemon_page.dart`
6. `lib/domain/usecases/search_pokemon.dart`
7. `pubspec.yaml`: add `http`, `flutter_bloc`, `bloc`
8. `lib/data/models/poke_api_page_dto.dart`
9. `lib/data/datasources/poke_api_service.dart`
10. `lib/data/repositories/poke_api_catalog_repository.dart`
11. `lib/presentation/blocs/discover_bloc.dart`
12. `lib/presentation/pages/pokemon_discover_page.dart`
13. `lib/main.dart`: composition root for this slice

Gate for this phase: app shows PokéAPI page one, appends with `Load more`, and stops when `hasMore` is false.

## Later phases

- Phase 2 detail: `poke_api_dto.dart`, detail use case, detail BLoC, detail page, network portrait widget.
- Phase 3 collect in memory: collection contract, in-memory repository, collection use cases, collection BLoC, list page, card, form dialog, theme.
- Phase 4 SQLite: `pokemon_database.dart`, `pokemon_row.dart`, `sqlite_collection_repository.dart`, `main.dart`.
- Phase 5 remaining actions: update, toggle favorite, remove, form dialog.
- Phase 6 parity and demo.

## Next step

Create `lib/domain/entities/pokemon.dart`. It is required before the repository contract because that contract returns `Future<Pokemon>`. Verify with `dart analyze lib/domain/entities/pokemon.dart` and `flutter test`, then commit.
