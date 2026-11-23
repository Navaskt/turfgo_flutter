

import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/avatars.dart';
import '../../../../core/widgets/glass_container.dart';
import '../../../../core/widgets/live_dot.dart';

/// Frosted top bar: brand on the left, location pill + avatar on the right.
/// Place it in a `Stack` above the scroll view (see ExplorePage).
class ExploreHeader extends StatelessWidget {
  const ExploreHeader({
    super.key,
    this.title = 'PITCHVOLT', // swap for your app name
    this.subtitle = 'Explore pitches',
    this.locationLabel = 'Downtown Arena, 5km',
    this.avatarUrl,
    this.onLocationTap,
    this.onProfileTap,
  });

  /// Visible bar height (status-bar inset is added on top of this).
  static const double height = 64;

  final String title;
  final String subtitle;
  final String locationLabel;
  final String? avatarUrl;
  final VoidCallback? onLocationTap;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;
    return GlassContainer(
      blur: 24,
      color: AppColors.headerGlass,
      boxShadow: AppShadows.header,
      padding: EdgeInsets.only(top: topInset),
      child: SizedBox(
        height: height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page),
          child: Row(
            children: [
              Expanded(child: _Brand(title: title, subtitle: subtitle)),
              const SizedBox(width: AppSpacing.sm),
              LocationPill(label: locationLabel, onTap: onLocationTap),
              const SizedBox(width: AppSpacing.sm),
              AppAvatar(imageUrl: avatarUrl, showOnlineDot: true, onTap: onProfileTap),
            ],
          ),
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: AppTextStyles.brand),
            ),
            const SizedBox(width: AppSpacing.xs),
            const LiveDot(size: 6),
          ],
        ),
        Text(
          subtitle.toUpperCase(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.label.copyWith(letterSpacing: 1),
        ),
      ],
    );
  }
}

class LocationPill extends StatelessWidget {
  const LocationPill({super.key, required this.label, this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 150),
      child: Material(
        color: AppColors.surfaceHigh,
        shape: const StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 32,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.near_me_rounded, size: 12, color: AppColors.accent),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.textOnChip,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down_rounded, size: 14, color: AppColors.textSecondary),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
