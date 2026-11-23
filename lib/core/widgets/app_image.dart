
import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Image from a URL (http/https), an asset path, or a placeholder when empty.
/// Swap [Image.network] for `CachedNetworkImage` here if you add that package;
/// every screen picks the change up automatically.
class AppImage extends StatelessWidget {
  const AppImage(
    this.source, {
    super.key,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
  });

  final String? source;
  final BoxFit fit;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final src = source;
    if (src == null || src.isEmpty) return const _ImagePlaceholder();

    Widget error(BuildContext _, Object __, StackTrace? ___) => const _ImagePlaceholder();

    if (src.startsWith('http')) {
      return Image.network(
        src,
        fit: fit,
        alignment: alignment,
        errorBuilder: error,
        loadingBuilder: (_, child, progress) =>
            progress == null ? child : const _ImagePlaceholder(),
      );
    }
    return Image.asset(src, fit: fit, alignment: alignment, errorBuilder: error);
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.surfaceHigh,
      child: LayoutBuilder(
        builder: (_, constraints) {
          final size = (constraints.biggest.shortestSide * 0.4).clamp(8.0, 32.0);
          return Center(
            child: Icon(Icons.sports_soccer_rounded, size: size, color: AppColors.surfaceHighest),
          );
        },
      ),
    );
  }
}
