import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/explore_mock_data_source.dart';
import '../../data/repositories/explore_repository_impl.dart';
import '../../domain/entities/arena.dart';
import '../../domain/entities/match_finder_info.dart';
import '../../domain/entities/prime_time_offer.dart';
import '../../domain/entities/turf_filter.dart';
import '../../domain/repositories/explore_repository.dart';
import '../../domain/usecases/explore_usecases.dart';


// ── Dependencies ────────────────────────────────────────────────────────────

final exploreDataSourceProvider =
    Provider<ExploreDataSource>((ref) => const ExploreMockDataSource());

final exploreRepositoryProvider = Provider<ExploreRepository>(
  (ref) => ExploreRepositoryImpl(ref.watch(exploreDataSourceProvider)),
);

final getFeaturedArenasProvider =
    Provider((ref) => GetFeaturedArenas(ref.watch(exploreRepositoryProvider)));

final getPrimeTimeOfferProvider =
    Provider((ref) => GetPrimeTimeOffer(ref.watch(exploreRepositoryProvider)));

final getMatchFinderInfoProvider =
    Provider((ref) => GetMatchFinderInfo(ref.watch(exploreRepositoryProvider)));

// ── UI state ────────────────────────────────────────────────────────────────

class SelectedTurfFilterNotifier extends Notifier<TurfFilter> {
  @override
  TurfFilter build() => TurfFilter.all;

  void select(TurfFilter filter) => state = filter;
}

final selectedTurfFilterProvider =
    NotifierProvider<SelectedTurfFilterNotifier, TurfFilter>(SelectedTurfFilterNotifier.new);

/// Debounced so typing doesn't fire a request per keystroke.
class SearchQueryNotifier extends Notifier<String> {
  Timer? _debounce;

  @override
  String build() {
    ref.onDispose(() => _debounce?.cancel());
    return '';
  }

  void update(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () => state = query.trim());
  }
}

final searchQueryProvider =
    NotifierProvider<SearchQueryNotifier, String>(SearchQueryNotifier.new);

class SelectedSlotIdNotifier extends Notifier<String?> {
  @override
  String? build() => null; // null → first available slot is used

  void select(String id) => state = id;
}

final selectedSlotIdProvider =
    NotifierProvider<SelectedSlotIdNotifier, String?>(SelectedSlotIdNotifier.new);

class BookmarkedArenasNotifier extends Notifier<Set<String>> {
  @override
  Set<String> build() => const {};

  void toggle(String arenaId) {
    state = state.contains(arenaId)
        ? ({...state}..remove(arenaId))
        : {...state, arenaId};
  }
}

final bookmarkedArenaIdsProvider =
    NotifierProvider<BookmarkedArenasNotifier, Set<String>>(BookmarkedArenasNotifier.new);

// ── Data ────────────────────────────────────────────────────────────────────

final featuredArenasProvider = FutureProvider<List<Arena>>((ref) {
  final filter = ref.watch(selectedTurfFilterProvider);
  final query = ref.watch(searchQueryProvider);
  return ref.watch(getFeaturedArenasProvider)(filter: filter, query: query);
});

final primeTimeOfferProvider = FutureProvider<PrimeTimeOffer>(
  (ref) => ref.watch(getPrimeTimeOfferProvider)(),
);

final matchFinderProvider = FutureProvider<MatchFinderInfo>(
  (ref) => ref.watch(getMatchFinderInfoProvider)(),
);
