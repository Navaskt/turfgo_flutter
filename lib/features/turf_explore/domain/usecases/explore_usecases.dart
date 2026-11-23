

import '../entities/arena.dart';
import '../entities/match_finder_info.dart';
import '../entities/prime_time_offer.dart';
import '../entities/turf_filter.dart';
import '../repositories/explore_repository.dart';

class GetFeaturedArenas {
  const GetFeaturedArenas(this._repository);

  final ExploreRepository _repository;

  Future<List<Arena>> call({TurfFilter filter = TurfFilter.all, String query = ''}) =>
      _repository.getFeaturedArenas(filter: filter, query: query);
}

class GetPrimeTimeOffer {
  const GetPrimeTimeOffer(this._repository);

  final ExploreRepository _repository;

  Future<PrimeTimeOffer> call() => _repository.getPrimeTimeOffer();
}

class GetMatchFinderInfo {
  const GetMatchFinderInfo(this._repository);

  final ExploreRepository _repository;

  Future<MatchFinderInfo> call() => _repository.getMatchFinderInfo();
}
