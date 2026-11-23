
import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_shadows.dart';

/// Rounded surface used by every card on the screen.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.color = AppColors.surface,
    this.gradient,
    this.padding,
    this.boxShadow = AppShadows.card,
    this.onTap,
  });

  final Widget child;
  final Color color;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;
  final List<BoxShadow> boxShadow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    Widget content = child;
    if (padding != null) content = Padding(padding: padding!, child: content);
    if (onTap != null) {
      content = Material(
        type: MaterialType.transparency,
        child: InkWell(onTap: onTap, child: content),
      );
    }
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: gradient == null ? color : null,
        gradient: gradient,
        borderRadius: AppRadius.card,
        boxShadow: boxShadow,
      ),
      child: content,
    );
  }
}
