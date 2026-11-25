import '../entities/pokemon_page.dart';
import '../repositories/pokemon_catalog_repository.dart';

class FetchPokemonPage {
  final PokemonCatalogRepository _repository;

  const FetchPokemonPage(this._repository);

  Future<PokemonPage> call({required int offset, int limit = 20}) {
    return _repository.fetchPage(offset: offset, limit: limit);
  }
}