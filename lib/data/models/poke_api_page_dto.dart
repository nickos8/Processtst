import '../../domain/entities/pokemon_page.dart';
import '../../domain/entities/pokemon_summary.dart';

class PokeApiPokemonSummaryDto {
  final String name;
  final String url;

  const PokeApiPokemonSummaryDto({required this.name, required this.url});

  factory PokeApiPokemonSummaryDto.fromJson(Map<String, dynamic> json) {
    return PokeApiPokemonSummaryDto(
      name: json['name'] as String,
      url: json['url'] as String,
    );
  }

  PokemonSummary toEntity() {
    return PokemonSummary(name: name, url: url);
  }
}

class PokeApiPageDto {
  final List<PokeApiPokemonSummaryDto> results;
  final bool hasMore;

  const PokeApiPageDto({required this.results, required this.hasMore});

  factory PokeApiPageDto.fromJson(Map<String, dynamic> json) {
    final results = json['results'] as List;

    return PokeApiPageDto(
      results: results
          .map(
            (item) =>
                PokeApiPokemonSummaryDto.fromJson(item as Map<String, dynamic>),
          )
          .toList(),
      hasMore: json['next'] != null,
    );
  }

  PokemonPage toEntity() {
    return PokemonPage(
      results: results.map((result) => result.toEntity()).toList(),
      hasMore: hasMore,
    );
  }
}