

import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_shadows.dart';
import '../theme/app_text_styles.dart';

enum NeonButtonSize { large, medium, compact }

enum NeonButtonTone { primary, accent }

/// Glowing call-to-action button (QUICK BOOK, RESERVE, JOIN...).
class NeonButton extends StatelessWidget {
  const NeonButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = NeonButtonSize.medium,
    this.tone = NeonButtonTone.primary,
    this.trailingIcon,
  });

  final String label;
  final VoidCallback? onPressed;
  final NeonButtonSize size;
  final NeonButtonTone tone;
  final IconData? trailingIcon;

  ({EdgeInsets padding, TextStyle style, double glow, double blur}) get _spec =>
      switch (size) {
        NeonButtonSize.large => (
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            style: AppTextStyles.buttonLarge,
            glow: 0.4,
            blur: 8.0,
          ),
        NeonButtonSize.medium => (
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            style: AppTextStyles.button,
            glow: 0.3,
            blur: 6.0,
          ),
        NeonButtonSize.compact => (
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            style: AppTextStyles.button,
            glow: 0.35,
            blur: 7.0,
          ),
      };

  @override
  Widget build(BuildContext context) {
    final isPrimary = tone == NeonButtonTone.primary;
    final background = isPrimary ? AppColors.primary : AppColors.accent;
    final foreground = isPrimary ? AppColors.onPrimary : AppColors.onAccent;
    final spec = _spec;

    return Opacity(
      opacity: onPressed == null ? 0.4 : 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: background,
          borderRadius: AppRadius.control,
          boxShadow: AppShadows.glow(background, alpha: spec.glow, blur: spec.blur),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onPressed,
            borderRadius: AppRadius.control,
            child: Padding(
              padding: spec.padding,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(label.toUpperCase(), style: spec.style.copyWith(color: foreground)),
                  if (trailingIcon != null) ...[
                    const SizedBox(width: AppSpacing.xs),
                    Icon(trailingIcon, size: 12, color: foreground),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
