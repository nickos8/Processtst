import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/discover_bloc.dart';

class PokemonDiscoverPage extends StatelessWidget {
  const PokemonDiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokemon')),
      body: BlocBuilder<DiscoverBloc, DiscoverState>(
        builder: (context, state) {
          if (state is DiscoverInitial || state is DiscoverLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is DiscoverFailure) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<DiscoverBloc>().add(const Retry()),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is! DiscoverReady) {
            return const Center(child: Text('Unable to load Pokemon.'));
          }

          return _list(context, state);
        },
      ),
    );
  }

  Widget _list(BuildContext context, DiscoverReady state) {
    final showFooter =
        state.hasMore || state.isLoadingMore || state.errorMessage != null;

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      itemCount: state.results.length + (showFooter ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.results.length) {
          return _footer(context, state);
        }

        final summary = state.results[index];

        return ListTile(
          leading: const Icon(Icons.catching_pokemon),
          title: Text(summary.name.toUpperCase()),
        );
      },
    );
  }

  Widget _footer(BuildContext context, DiscoverReady state) {
    if (state.isLoadingMore) {
      return const Padding(
        padding: EdgeInsets.all(16),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (state.errorMessage != null) ...[
            Text(state.errorMessage!),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () => context.read<DiscoverBloc>().add(const Retry()),
              child: const Text('Retry'),
            ),
          ] else if (state.hasMore)
            OutlinedButton(
              onPressed: () =>
                  context.read<DiscoverBloc>().add(const LoadMore()),
              child: const Text('Load more'),
            ),
        ],
      ),
    );
  }
}