

import '../../domain/entities/arena.dart';
import '../../domain/entities/match_finder_info.dart';
import '../../domain/entities/prime_time_offer.dart';
import '../../domain/entities/turf_filter.dart';
import '../../domain/repositories/explore_repository.dart';
import '../datasources/explore_mock_data_source.dart';

class ExploreRepositoryImpl implements ExploreRepository {
  const ExploreRepositoryImpl(this._dataSource);

  final ExploreDataSource _dataSource;

  @override
  Future<List<Arena>> getFeaturedArenas({
    TurfFilter filter = TurfFilter.all,
    String query = '',
  }) =>
      _dataSource.fetchArenas(filter: filter, query: query);

  @override
  Future<PrimeTimeOffer> getPrimeTimeOffer() => _dataSource.fetchPrimeTimeOffer();

  @override
  Future<MatchFinderInfo> getMatchFinderInfo() => _dataSource.fetchMatchFinderInfo();
}
