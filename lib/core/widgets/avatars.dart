

import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import 'app_image.dart';

/// Overlapping row of small round avatars.
class AvatarStack extends StatelessWidget {
  const AvatarStack({
    super.key,
    required this.imageUrls,
    this.size = 24,
    this.overlap = 8,
  });

  final List<String> imageUrls;
  final double size;
  final double overlap;

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) return const SizedBox.shrink();
    final step = size - overlap;
    return SizedBox(
      width: size + step * (imageUrls.length - 1),
      height: size,
      child: Stack(
        children: [
          for (var i = 0; i < imageUrls.length; i++)
            Positioned(
              left: i * step,
              child: ClipOval(
                child: SizedBox.square(dimension: size, child: AppImage(imageUrls[i])),
              ),
            ),
        ],
      ),
    );
  }
}

/// Profile avatar with a ring and optional online dot.
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.imageUrl,
    this.size = 32,
    this.showOnlineDot = false,
    this.onTap,
  });

  final String? imageUrl;
  final double size;
  final bool showOnlineDot;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: onTap != null,
      label: 'Profile',
      excludeSemantics: true,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Material(
            color: AppColors.surfaceHighest,
            shape: const CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: ClipOval(
                  child: SizedBox.square(dimension: size, child: AppImage(imageUrl)),
                ),
              ),
            ),
          ),
          if (showOnlineDot)
            const Positioned(
              right: 0,
              bottom: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: AppColors.background, spreadRadius: 2)],
                ),
                child: SizedBox.square(dimension: 10),
              ),
            ),
        ],
      ),
    );
  }
}
