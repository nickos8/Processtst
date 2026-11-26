import '../../domain/entities/pokemon.dart';
import '../../domain/entities/pokemon_page.dart';
import '../../domain/repositories/pokemon_catalog_repository.dart';
import '../datasources/poke_api_service.dart';

class PokeApiCatalogRepository implements PokemonCatalogRepository {
  final PokeApiService _service;

  const PokeApiCatalogRepository(this._service);

  @override
  Future<PokemonPage> fetchPage({required int offset, int limit = 20}) async {
    final dto = await _service.fetchPage(limit: limit, offset: offset);

    return dto.toEntity();
  }

  @override
  Future<Pokemon> fetchDetails(String name) async {
    throw UnimplementedError('fetchDetails($name) belongs to Phase 2');
  }
}