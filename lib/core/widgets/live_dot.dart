
import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../theme/app_shadows.dart';

/// Small status dot, optionally glowing (live / urgency indicators).
class LiveDot extends StatelessWidget {
  const LiveDot({
    super.key,
    this.size = 8,
    this.color = AppColors.accent,
    this.showGlow = true,
  });

  final double size;
  final Color color;
  final bool showGlow;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: showGlow ? AppShadows.glow(AppColors.primary, alpha: 1) : null,
      ),
      child: SizedBox.square(dimension: size),
    );
  }
}
