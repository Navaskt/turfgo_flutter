

import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Circular glass button (bookmark etc.).
///
/// Drawn at [visualSize] (32 in Figma) but with a [hitSize] (44) touch target.
/// When positioning it over a photo, offset by `(hitSize - visualSize) / 2`
/// so the visible circle lands where the design puts it.
class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.activeIcon,
    this.isActive = false,
    this.visualSize = 32,
    this.hitSize = 44,
    this.semanticLabel,
  });

  final IconData icon;
  final IconData? activeIcon;
  final bool isActive;
  final VoidCallback onPressed;
  final double visualSize;
  final double hitSize;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      toggled: isActive,
      label: semanticLabel,
      excludeSemantics: true,
      child: SizedBox.square(
        dimension: hitSize,
        child: InkResponse(
          onTap: onPressed,
          radius: hitSize / 2,
          child: Center(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.overlay70,
                shape: BoxShape.circle,
              ),
              child: SizedBox.square(
                dimension: visualSize,
                child: Icon(
                  isActive ? (activeIcon ?? icon) : icon,
                  size: 16,
                  color: isActive ? AppColors.primary : AppColors.textPrimary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
