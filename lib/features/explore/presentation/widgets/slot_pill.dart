

import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/prime_time_offer.dart';

/// Time-slot chip with three visual states: selected, available, filled.
class SlotPill extends StatelessWidget {
  const SlotPill({
    super.key,
    required this.slot,
    required this.isSelected,
    required this.onTap,
  });

  final TimeSlot slot;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = slot.isAvailable;
    final background = !enabled
        ? AppColors.surfaceAlt50
        : isSelected
            ? AppColors.surfaceHighest
            : AppColors.surfaceHigh;
    final timeColor = !enabled
        ? AppColors.disabled
        : isSelected
            ? AppColors.primary
            : AppColors.textSecondary;
    final noteColor = enabled ? AppColors.textSecondary : AppColors.disabledSoft;
    final decoration = enabled ? null : TextDecoration.lineThrough;

    return Semantics(
      button: true,
      enabled: enabled,
      selected: isSelected,
      label: '${slot.timeRange}, ${enabled ? slot.pitchLabel : 'filled'}',
      excludeSemantics: true,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: background,
          borderRadius: AppRadius.small,
          boxShadow: isSelected ? AppShadows.glow(AppColors.primary, alpha: 0.2, blur: 6) : const [],
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: enabled ? onTap : null,
            borderRadius: AppRadius.small,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    slot.timeRange,
                    style: AppTextStyles.value.copyWith(color: timeColor, decoration: decoration),
                  ),
                  Text(
                    enabled ? slot.pitchLabel : 'Filled',
                    style: AppTextStyles.label.copyWith(
                      color: noteColor,
                      letterSpacing: 0,
                      decoration: decoration,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
