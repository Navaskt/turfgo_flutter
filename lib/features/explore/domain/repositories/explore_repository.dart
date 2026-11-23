

import '../entities/arena.dart';
import '../entities/match_finder_info.dart';
import '../entities/prime_time_offer.dart';
import '../entities/turf_filter.dart';

abstract interface class ExploreRepository {
  Future<List<Arena>> getFeaturedArenas({
    TurfFilter filter = TurfFilter.all,
    String query = '',
  });

  Future<PrimeTimeOffer> getPrimeTimeOffer();

  Future<MatchFinderInfo> getMatchFinderInfo();
}
