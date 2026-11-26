import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/pokemon_summary.dart';
import '../../domain/usecases/fetch_pokemon_page.dart';

abstract class DiscoverEvent {
  const DiscoverEvent();
}

class DiscoverStarted extends DiscoverEvent {
  const DiscoverStarted();
}

class LoadMore extends DiscoverEvent {
  const LoadMore();
}

class Retry extends DiscoverEvent {
  const Retry();
}

abstract class DiscoverState {
  const DiscoverState();
}

class DiscoverInitial extends DiscoverState {
  const DiscoverInitial();
}

class DiscoverLoading extends DiscoverState {
  const DiscoverLoading();
}

class DiscoverReady extends DiscoverState {
  final List<PokemonSummary> results;
  final bool hasMore;
  final bool isLoadingMore;
  final String? errorMessage;

  const DiscoverReady({
    required this.results,
    required this.hasMore,
    this.isLoadingMore = false,
    this.errorMessage,
  });
}

class DiscoverFailure extends DiscoverState {
  final String message;

  const DiscoverFailure(this.message);
}

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final FetchPokemonPage fetchPage;

  DiscoverBloc({required this.fetchPage}) : super(const DiscoverInitial()) {
    on<DiscoverStarted>(_onStarted);
    on<LoadMore>(_onLoadMore);
    on<Retry>(_onRetry);
  }

  Future<void> _onStarted(
    DiscoverStarted event,
    Emitter<DiscoverState> emit,
  ) async {
    emit(const DiscoverLoading());
    await _fetchPage(offset: 0, results: const [], emit: emit);
  }

  Future<void> _onLoadMore(
    LoadMore event,
    Emitter<DiscoverState> emit,
  ) async {
    final current = state;

    if (current is! DiscoverReady ||
        current.isLoadingMore ||
        !current.hasMore) {
      return;
    }

    emit(
      DiscoverReady(
        results: current.results,
        hasMore: current.hasMore,
        isLoadingMore: true,
      ),
    );

    await _fetchPage(
      offset: current.results.length,
      results: current.results,
      emit: emit,
    );
  }

  Future<void> _onRetry(Retry event, Emitter<DiscoverState> emit) async {
    emit(const DiscoverLoading());
    await _fetchPage(offset: 0, results: const [], emit: emit);
  }

  Future<void> _fetchPage({
    required int offset,
    required List<PokemonSummary> results,
    required Emitter<DiscoverState> emit,
  }) async {
    try {
      final page = await fetchPage(offset: offset);

      if (emit.isDone) return;

      emit(
        DiscoverReady(
          results: [...results, ...page.results],
          hasMore: page.hasMore,
        ),
      );
    } catch (_) {
      if (emit.isDone) return;

      if (results.isEmpty) {
        emit(const DiscoverFailure('Unable to load Pokemon.'));
        return;
      }

      emit(
        DiscoverReady(
          results: results,
          hasMore: true,
          errorMessage: 'Unable to load Pokemon.',
        ),
      );
    }
  }
}