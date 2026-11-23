

import '../../domain/entities/arena.dart';
import '../../domain/entities/match_finder_info.dart';
import '../../domain/entities/prime_time_offer.dart';
import '../../domain/entities/turf_filter.dart';

abstract interface class ExploreDataSource {
  Future<List<Arena>> fetchArenas({required TurfFilter filter, required String query});

  Future<PrimeTimeOffer> fetchPrimeTimeOffer();

  Future<MatchFinderInfo> fetchMatchFinderInfo();
}

/// Mock data copied from the Figma frame.
/// Replace with a remote implementation (REST / Firebase) later.
/// Image values are empty so the placeholder shows; put downloaded asset
/// paths (e.g. 'assets/images/camp_nou.png') or real URLs here.
class ExploreMockDataSource implements ExploreDataSource {
  const ExploreMockDataSource();

  static const _arenas = [
    Arena(
      id: 'camp-nou-a',
      name: 'Camp Nou Arena',
      subtitle: 'Pitch A • Outdoor Floodlit',
      pricePerHour: 55,
      rating: 4.9,
      reviewCount: 140,
      distanceMiles: 1.2,
      format: '7-a-side',
      dimensions: '45 × 25 m',
      studType: 'AG / TF Rec.',
      amenities: [Amenity.floodlights, Amenity.changingRooms],
      tags: [
        ArenaTag('Fast booking', type: ArenaTagType.highlight),
        ArenaTag('FIFA quality pro', type: ArenaTagType.certification),
      ],
    ),
    Arena(
      id: 'volt-apex-3',
      name: 'Volt Apex Grounds',
      subtitle: 'Cage 3 • Enclosed Rebound Boards',
      pricePerHour: 40,
      rating: 4.8,
      reviewCount: 92,
      distanceMiles: 2.5,
      format: '5-a-side',
      dimensions: '32 × 16 m',
      studType: 'TF Turf Only',
      amenities: [Amenity.scoreboard, Amenity.matchReplay],
      tags: [ArenaTag('High tempo rebounds')],
    ),
    Arena(
      id: 'san-siro-2',
      name: 'San Siro Urban Turf',
      subtitle: 'Pitch 2 • Roofed Stadium Feel',
      pricePerHour: 65,
      rating: 4.7,
      reviewCount: 85,
      distanceMiles: 3.8,
      format: '7-a-side',
      dimensions: '40 × 20 m',
      studType: 'AG / FG / TF',
      amenities: [Amenity.rainProof, Amenity.freeParking],
      tags: [ArenaTag('Covered all-weather')],
    ),
  ];

  @override
  Future<List<Arena>> fetchArenas({
    required TurfFilter filter,
    required String query,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 350));
    final q = query.toLowerCase();
    return _arenas.where((arena) {
      final matchesFilter = switch (filter) {
        TurfFilter.fiveASide => arena.format == '5-a-side',
        TurfFilter.sevenASide => arena.format == '7-a-side',
        TurfFilter.elevenASide => arena.format == '11-a-side',
        _ => true,
      };
      final matchesQuery = q.isEmpty ||
          arena.name.toLowerCase().contains(q) ||
          arena.subtitle.toLowerCase().contains(q);
      return matchesFilter && matchesQuery;
    }).toList();
  }

  @override
  Future<PrimeTimeOffer> fetchPrimeTimeOffer() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return const PrimeTimeOffer(
      arenaId: 'kensington-sky-dome',
      arenaName: 'Kensington Sky Dome',
      slotNumber: 4,
      fromPricePerHour: 45,
      slotsLeft: 2,
      tagLabel: 'Prime floodlit',
      whenLabel: 'Tonight',
      distanceMiles: 0.8,
      slots: [
        TimeSlot(id: 's1', timeRange: '20:00 - 21:00', pitchLabel: 'Pitch 1 (Fast)'),
        TimeSlot(id: 's2', timeRange: '21:30 - 22:30', pitchLabel: 'Pitch 3'),
        TimeSlot(
          id: 's3',
          timeRange: '22:30 - 23:30',
          pitchLabel: 'Pitch 2',
          status: SlotStatus.filled,
        ),
      ],
    );
  }

  @override
  Future<MatchFinderInfo> fetchMatchFinderInfo() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return const MatchFinderInfo(
      teamsLooking: 14,
      teamNames: ['FC Volt Tigers', 'Camden United'],
      extraTeams: 12,
      avatarUrls: ['', '', ''],
    );
  }
}
