

import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_gradients.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/widgets/glass_icon_button.dart';
import '../../../../core/widgets/icon_label.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../../../core/widgets/price_tag.dart';
import '../../../../core/widgets/specs_grid.dart';
import '../../domain/entities/arena.dart';
import '../mappers/arena_ui.dart';

/// Featured arena: photo with badges, price, specs and a reserve button.
/// Stateless on purpose: bookmark state and actions are passed in.
class ArenaCard extends StatelessWidget {
  const ArenaCard({
    super.key,
    required this.arena,
    required this.isBookmarked,
    required this.onBookmarkTap,
    required this.onReserve,
    this.onTap,
  });

  final Arena arena;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;
  final VoidCallback onReserve;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ImageHeader(arena: arena, isBookmarked: isBookmarked, onBookmarkTap: onBookmarkTap),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.card),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _TitleRow(arena: arena),
                const SizedBox(height: AppSpacing.md),
                SpecsGrid(
                  items: [
                    SpecItem('Format', arena.format),
                    SpecItem('Dimensions', arena.dimensions),
                    SpecItem('Stud type', arena.studType),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.xs),
                  child: Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          spacing: AppSpacing.sm,
                          runSpacing: AppSpacing.xs,
                          children: [
                            for (final a in arena.amenities) IconLabel(icon: a.icon, label: a.label),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      NeonButton(label: 'Reserve', onPressed: onReserve),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({
    required this.arena,
    required this.isBookmarked,
    required this.onBookmarkTap,
  });

  final Arena arena;
  final bool isBookmarked;
  final VoidCallback onBookmarkTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppImage(arena.imageUrl),
          const DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.arenaScrim)),
          Positioned(
            top: 10,
            left: 10,
            child: Wrap(
              spacing: 6,
              children: [for (final tag in arena.tags) tag.toBadge()],
            ),
          ),
          // 44 px hit area, 32 px visible circle at 10 px from the corner.
          Positioned(
            top: 4,
            right: 4,
            child: GlassIconButton(
              icon: Icons.bookmark_border_rounded,
              activeIcon: Icons.bookmark_rounded,
              isActive: isBookmarked,
              semanticLabel: isBookmarked ? 'Remove bookmark' : 'Bookmark ${arena.name}',
              onPressed: onBookmarkTap,
            ),
          ),
          Positioned(
            left: AppSpacing.md,
            bottom: 10,
            child: Row(
              children: [
                GlassChip(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star_rounded, size: 11, color: AppColors.warning),
                      const SizedBox(width: 3),
                      Text(
                        arena.rating.toStringAsFixed(1),
                        style: AppTextStyles.value.copyWith(fontSize: 10),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '(${arena.reviewCount})',
                        style: AppTextStyles.body.copyWith(
                          fontSize: 10,
                          color: AppColors.textSecondarySoft,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                GlassChip(
                  child: Text(
                    AppFormatters.milesAway(arena.distanceMiles),
                    style: AppTextStyles.body.copyWith(fontSize: 10, color: AppColors.textOnChip),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TitleRow extends StatelessWidget {
  const _TitleRow({required this.arena});

  final Arena arena;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(arena.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.title),
              Text(
                arena.subtitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.body.copyWith(color: AppColors.accent),
              ),
            ],
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        PriceTag(amount: arena.pricePerHour),
      ],
    );
  }
}
