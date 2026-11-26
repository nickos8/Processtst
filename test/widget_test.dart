import 'package:flutter_test/flutter_test.dart';

import 'package:mini_pokemon_from_zero/domain/entities/pokemon.dart';
import 'package:mini_pokemon_from_zero/domain/entities/pokemon_page.dart';
import 'package:mini_pokemon_from_zero/domain/entities/pokemon_summary.dart';
import 'package:mini_pokemon_from_zero/domain/repositories/pokemon_catalog_repository.dart';
import 'package:mini_pokemon_from_zero/domain/usecases/fetch_pokemon_page.dart';
import 'package:mini_pokemon_from_zero/main.dart';
import 'package:mini_pokemon_from_zero/presentation/blocs/discover_bloc.dart';

class _FakeCatalogRepository implements PokemonCatalogRepository {
  const _FakeCatalogRepository();

  @override
  Future<PokemonPage> fetchPage({required int offset, int limit = 20}) async {
    return const PokemonPage(
      results: [
        PokemonSummary(
          name: 'bulbasaur',
          url: 'https://pokeapi.co/api/v2/pokemon/1/',
        ),
      ],
      hasMore: false,
    );
  }

  @override
  Future<Pokemon> fetchDetails(String name) async {
    throw UnimplementedError();
  }
}

void main() {
  testWidgets('Discover page shows first Pokemon', (tester) async {
    final bloc = DiscoverBloc(
      fetchPage: FetchPokemonPage(const _FakeCatalogRepository()),
    )..add(const DiscoverStarted());

    await tester.pumpWidget(MyApp(discoverBloc: bloc));
    await tester.pumpAndSettle();

    expect(find.text('BULBASAUR'), findsOneWidget);
    expect(find.text('Load more'), findsNothing);
  });
}
