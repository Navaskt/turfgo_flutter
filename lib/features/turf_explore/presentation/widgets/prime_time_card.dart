

import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_gradients.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_formatters.dart';
import '../../../../core/widgets/app_badge.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_image.dart';
import '../../../../core/widgets/icon_label.dart';
import '../../../../core/widgets/live_dot.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../../../core/widgets/price_tag.dart';
import '../../domain/entities/prime_time_offer.dart';
import 'slot_pill.dart';

/// Hero card: tonight's best slot with quick booking.
class PrimeTimeCard extends StatelessWidget {
  const PrimeTimeCard({
    super.key,
    required this.offer,
    required this.selectedSlotId,
    required this.onSlotSelected,
    required this.onQuickBook,
  });

  final PrimeTimeOffer offer;
  final String? selectedSlotId;
  final ValueChanged<String> onSlotSelected;
  final VoidCallback onQuickBook;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      boxShadow: AppShadows.hero,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Header(offer: offer),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.card),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _SlotList(slots: offer.slots, selectedId: selectedSlotId, onSelected: onSlotSelected),
                const SizedBox(height: AppSpacing.md),
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.xs),
                  child: Row(
                    children: [
                      IconLabel(icon: Icons.schedule_rounded, label: offer.whenLabel),
                      const SizedBox(width: AppSpacing.md),
                      IconLabel(
                        icon: Icons.near_me_outlined,
                        label: AppFormatters.milesShort(offer.distanceMiles),
                      ),
                      const Spacer(),
                      NeonButton(
                        label: 'Quick book',
                        size: NeonButtonSize.large,
                        onPressed: onQuickBook,
                      ),
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

class _Header extends StatelessWidget {
  const _Header({required this.offer});

  final PrimeTimeOffer offer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 176,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppImage(offer.imageUrl),
          const DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.heroScrim)),
          Positioned(
            top: AppSpacing.md,
            left: AppSpacing.md,
            child: AppBadge(
              label: '${offer.slotsLeft} slots left ${offer.whenLabel.toLowerCase()}',
              foreground: AppColors.warning,
              background: AppColors.overlay85,
              radius: AppRadius.pill,
              blur: 12,
              letterSpacing: 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              leading: const LiveDot(color: AppColors.warning, showGlow: false),
            ),
          ),
          Positioned(
            top: AppSpacing.md,
            right: AppSpacing.md,
            child: AppBadge(
              label: offer.tagLabel,
              foreground: AppColors.primary,
              background: AppColors.overlay90,
              radius: AppRadius.tag,
              blur: 12,
              letterSpacing: 1,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 6),
            ),
          ),
          Positioned(
            left: AppSpacing.md,
            right: AppSpacing.md,
            bottom: AppSpacing.sm,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'MATCHDAY SLOT #${offer.slotNumber.toString().padLeft(2, '0')}',
                        style: AppTextStyles.label.copyWith(color: AppColors.accent),
                      ),
                      Text(
                        offer.arenaName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.h1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                PriceTag(amount: offer.fromPricePerHour, caption: 'From'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SlotList extends StatelessWidget {
  const _SlotList({required this.slots, required this.selectedId, required this.onSelected});

  final List<TimeSlot> slots;
  final String? selectedId;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    // Falls back to the first available slot until the user picks one.
    final activeId = selectedId ?? slots.where((s) => s.isAvailable).firstOrNull?.id;
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 2),
        itemCount: slots.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (_, i) => SlotPill(
          slot: slots[i],
          isSelected: slots[i].id == activeId,
          onTap: () => onSelected(slots[i].id),
        ),
      ),
    );
  }
}
