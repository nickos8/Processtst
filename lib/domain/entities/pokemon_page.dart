import 'pokemon_summary.dart';

class PokemonPage {
  final List<PokemonSummary> results;
  final bool hasMore;

  const PokemonPage({required this.results, required this.hasMore});
}