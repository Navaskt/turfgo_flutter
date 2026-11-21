import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../domain/entities/arena.dart';
import '../providers/explore_filter_provider.dart';
import '../widgets/arena_card.dart';
import '../widgets/explore_search.dart';
import '../widgets/featured_turf_card.dart';
import '../widgets/match_finder_card.dart';
import '../widgets/pitch_surface_guide_card.dart';
import '../widgets/turf_filter_chips.dart';

class ExploreScreen extends ConsumerWidget {
  const ExploreScreen({super.key});

  static const _arenas = <Arena>[
    Arena(
      name: 'Camp Nou Arena',
      price: 55,
      pitchType: 'Pitch A - Outdoor Floodlit',
      format: '7-a-side',
      dimensions: '45 × 25 m',
      turf: 'AG / Turf',
      rating: '4.9 (120)',
      distance: '12 miles away',
      facilities: ['Floodlights', 'Changing'],
      indoor: false,
    ),
    Arena(
      name: 'Volt Apex Grounds',
      price: 40,
      pitchType: 'Cage 2 - Indoor Football',
      format: '5-a-side',
      dimensions: '32 × 18 m',
      turf: '7F Turf Only',
      rating: '4.8 (92)',
      distance: '3.6 miles away',
      facilities: ['Scoreboard', 'Match Parking'],
      indoor: true,
    ),
    Arena(
      name: 'San Siro Urban Turf',
      price: 65,
      pitchType: 'Pitch B - Indoor Facility',
      format: '7-a-side',
      dimensions: '48 × 23 m',
      turf: 'AG / 3G',
      rating: '4.9 (156)',
      distance: '5.3 miles away',
      facilities: ['Rain Roof', 'Free Parking'],
      indoor: true,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedFilter = ref.watch(exploreFilterProvider);
    final arenas = selectedFilter == 'ALL TURFS'
        ? _arenas
        : _arenas
              .where((arena) => arena.format.toUpperCase() == selectedFilter)
              .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: ExploreSearch()),
            const SliverToBoxAdapter(child: TurfFilterChips()),
            const SliverToBoxAdapter(child: SizedBox(height: 13)),
            const SliverToBoxAdapter(child: FeaturedTurfCard()),
            const SliverToBoxAdapter(child: SizedBox(height: 13)),
            const SliverToBoxAdapter(child: MatchFinderCard()),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.pageHorizontal.w,
                  vertical: 10.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Featured Arenas',
                            style: TextStyle(
                              fontSize: 19,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -.35,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Top local arenas, ratings & verified availability',
                            style: TextStyle(
                              fontSize: 9,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'MAP\nVIEW',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 8,
                        height: 1.2,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .5,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.map_outlined,
                      color: AppColors.primary,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            if (arenas.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Text(
                      'No arenas found for this format.',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.pageHorizontal.w,
                ),
                sliver: SliverList.separated(
                  itemCount: arenas.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 13),
                  itemBuilder: (context, index) =>
                      ArenaCard(arena: arenas[index]),
                ),
              ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.pageHorizontal.w,
                  vertical: 15.h,
                ),
                child: const PitchSurfaceGuideCard(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
