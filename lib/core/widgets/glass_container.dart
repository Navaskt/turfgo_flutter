import 'dart:ui';

import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';

/// Translucent "glass" surface.
///
/// [blur] > 0 adds a [BackdropFilter]. Keep it for large, few surfaces
/// (header, bottom nav). For small chips inside scrolling lists leave it at 0:
/// an 85 % opaque tint looks the same and avoids one backdrop layer per item.
class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.child,
    this.blur = 0,
    this.color = AppColors.overlay85,
    this.borderRadius = BorderRadius.zero,
    this.padding,
    this.boxShadow,
  });

  final Widget child;
  final double blur;
  final Color color;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    Widget content = Container(color: color, padding: padding, child: child);
    if (blur > 0) {
      content = BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: content,
      );
    }
    return DecoratedBox(
      decoration: BoxDecoration(borderRadius: borderRadius, boxShadow: boxShadow),
      child: ClipRRect(borderRadius: borderRadius, child: content),
    );
  }
}

/// Small pill drawn over photos (rating, distance...).
class GlassChip extends StatelessWidget {
  const GlassChip({
    super.key,
    required this.child,
    this.color = AppColors.overlay85,
    this.blur = 0,
  });

  final Widget child;
  final Color color;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      blur: blur,
      color: color,
      borderRadius: AppRadius.pill,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: 2),
      child: child,
    );
  }
}
