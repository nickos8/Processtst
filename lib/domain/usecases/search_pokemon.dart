import '../entities/pokemon_summary.dart';
import '../repositories/pokemon_catalog_repository.dart';

class SearchPokemon {
  final PokemonCatalogRepository _repository;

  const SearchPokemon(this._repository);

  Future<PokemonSummary> call(String name) async {
    final pokemon = await _repository.fetchDetails(name);

    return PokemonSummary(name: pokemon.name, url: '');
  }
}