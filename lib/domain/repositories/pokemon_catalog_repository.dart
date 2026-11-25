import '../entities/pokemon.dart';
import '../entities/pokemon_page.dart';

abstract class PokemonCatalogRepository {
  Future<PokemonPage> fetchPage({required int offset, int limit = 20});

  Future<Pokemon> fetchDetails(String name);
}