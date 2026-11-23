import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/async_value_view.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/arena.dart';
import '../providers/explore_providers.dart';
import 'arena_card.dart';
import 'match_finder_banner.dart';
import 'prime_time_card.dart';


/// Thin Riverpod "glue" widgets: they watch providers and hand plain data to
/// the presentational widgets, which stay free of Riverpod and easy to test.

class PrimeTimeSection extends ConsumerWidget {
  const PrimeTimeSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueView(
      value: ref.watch(primeTimeOfferProvider),
      loadingHeight: 298,
      onRetry: () => ref.invalidate(primeTimeOfferProvider),
      data: (offer) => PrimeTimeCard(
        offer: offer,
        selectedSlotId: ref.watch(selectedSlotIdProvider),
        onSlotSelected: ref.read(selectedSlotIdProvider.notifier).select,
        onQuickBook: () {
          // TODO(navigation): open quick-book flow for offer.arenaId
        },
      ),
    );
  }
}

class MatchFinderSection extends ConsumerWidget {
  const MatchFinderSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueView(
      value: ref.watch(matchFinderProvider),
      loadingHeight: 157,
      onRetry: () => ref.invalidate(matchFinderProvider),
      data: (info) => MatchFinderBanner(
        info: info,
        onJoin: () {
          // TODO(navigation): open match finder
        },
      ),
    );
  }
}

class FeaturedArenasHeader extends StatelessWidget {
  const FeaturedArenasHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionHeader(
      title: 'Featured Arenas',
      subtitle: 'Tactical specs, ratings & confirmed slot availability',
      actionLabel: 'Map view',
      actionIcon: Icons.map_outlined,
      onActionTap: () {
        // TODO(navigation): open map view
      },
    );
  }
}

class FeaturedArenasSliver extends ConsumerWidget {
  const FeaturedArenasSliver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncSliverView<List<Arena>>(
      value: ref.watch(featuredArenasProvider),
      onRetry: () => ref.invalidate(featuredArenasProvider),
      data: (arenas) {
        if (arenas.isEmpty) {
          return const SliverToBoxAdapter(
            child: EmptyState(message: 'No arenas match your search yet.'),
          );
        }
        return SliverList.separated(
          itemCount: arenas.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.card),
          itemBuilder: (_, i) => RepaintBoundary(child: _ArenaItem(arena: arenas[i])),
        );
      },
    );
  }
}

class _ArenaItem extends ConsumerWidget {
  const _ArenaItem({required this.arena});

  final Arena arena;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // `select` rebuilds only the card whose bookmark state changed.
    final saved = ref.watch(bookmarkedArenaIdsProvider.select((ids) => ids.contains(arena.id)));
    return ArenaCard(
      arena: arena,
      isBookmarked: saved,
      onBookmarkTap: () => ref.read(bookmarkedArenaIdsProvider.notifier).toggle(arena.id),
      onReserve: () {
        // TODO(navigation): open booking flow for arena.id
      },
      onTap: () {
        // TODO(navigation): open arena details for arena.id
      },
    );
  }
}

/// "Pitch Surface Guide" shortcut row.
class SurfaceGuideTile extends StatelessWidget {
  const SurfaceGuideTile({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      color: AppColors.surfaceAlt,
      boxShadow: AppShadows.subtle,
      padding: const EdgeInsets.all(AppSpacing.card),
      onTap: onTap,
      child: Row(
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(color: AppColors.greenTint20, borderRadius: AppRadius.control),
            child: SizedBox.square(
              dimension: 40,
              child: Icon(Icons.grid_view_rounded, size: 18, color: AppColors.accent),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pitch Surface Guide', style: AppTextStyles.guideTitle),
                Text('Check stud regulations & shock pad ratings', style: AppTextStyles.body),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text('Specs', style: AppTextStyles.button.copyWith(color: AppColors.accent, letterSpacing: 0)),
          const Icon(Icons.chevron_right_rounded, size: 16, color: AppColors.accent),
        ],
      ),
    );
  }
}
