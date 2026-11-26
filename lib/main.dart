import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import 'data/datasources/poke_api_service.dart';
import 'data/repositories/poke_api_catalog_repository.dart';
import 'domain/usecases/fetch_pokemon_page.dart';
import 'presentation/blocs/discover_bloc.dart';
import 'presentation/pages/pokemon_discover_page.dart';

void main() {
  final catalogRepository = PokeApiCatalogRepository(PokeApiService());
  final fetchPage = FetchPokemonPage(catalogRepository);
  final discoverBloc = DiscoverBloc(fetchPage: fetchPage)
    ..add(const DiscoverStarted());

  runApp(MyApp(discoverBloc: discoverBloc));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.discoverBloc});

  final DiscoverBloc discoverBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiscoverBloc>.value(
      value: discoverBloc,
      child: MaterialApp(
        title: 'Mini Pokemon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const PokemonDiscoverPage(),
      ),
    );
  }
}