
import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';
import 'glass_container.dart';

/// Tiny uppercase label (FAST BOOKING, PRIME FLOODLIT, "2 slots left"...).
class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.label,
    this.foreground = AppColors.textPrimary,
    this.background = AppColors.overlay80,
    this.radius = AppRadius.badge,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
    this.blur = 0,
    this.letterSpacing = 0.25,
    this.leading,
  });

  final String label;
  final Color foreground;
  final Color background;
  final BorderRadius radius;
  final EdgeInsetsGeometry padding;
  final double blur;
  final double letterSpacing;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      color: background,
      borderRadius: radius,
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 6)],
          Text(
            label.toUpperCase(),
            style: AppTextStyles.label.copyWith(color: foreground, letterSpacing: letterSpacing),
          ),
        ],
      ),
    );
  }
}
