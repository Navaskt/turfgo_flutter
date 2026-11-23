import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimens.dart';
import '../../../../core/theme/app_gradients.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/avatars.dart';
import '../../../../core/widgets/live_dot.dart';
import '../../../../core/widgets/neon_button.dart';
import '../../domain/entities/match_finder_info.dart';


/// "Need an opponent?" call-out with a live indicator and avatar ticker.
class MatchFinderBanner extends StatelessWidget {
  const MatchFinderBanner({super.key, required this.info, required this.onJoin});

  final MatchFinderInfo info;
  final VoidCallback onJoin;

  @override
  Widget build(BuildContext context) {
    final teams = '${info.teamNames.join(', ')} +${info.extraTeams} others';

    return AppCard(
      gradient: AppGradients.banner,
      boxShadow: AppShadows.soft,
      child: Stack(
        children: [
          const Positioned(bottom: -32, right: -32, child: _GlowBlob()),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const LiveDot(),
                              const SizedBox(width: 6),
                              Text(
                                'MATCH FINDER LIVE',
                                style: AppTextStyles.label.copyWith(color: AppColors.accent),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.sm),
                          Text('Need an opponent?', style: AppTextStyles.bannerTitle),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            '${info.teamsLooking} teams are hunting for friendlies tonight in your zone.',
                            style: AppTextStyles.body,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    NeonButton(
                      label: 'Join',
                      tone: NeonButtonTone.accent,
                      size: NeonButtonSize.compact,
                      trailingIcon: Icons.arrow_forward_rounded,
                      onPressed: onJoin,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                Container(
                  padding: const EdgeInsets.only(top: AppSpacing.md),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: AppColors.outlineSoft)),
                  ),
                  child: Row(
                    children: [
                      AvatarStack(imageUrls: info.avatarUrls),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          teams,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.body.copyWith(color: AppColors.textSecondaryStrong),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Gradient instead of a real blur: same look, no offscreen layer.
class _GlowBlob extends StatelessWidget {
  const _GlowBlob();

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(
      child: DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, gradient: AppGradients.bannerGlow),
        child: SizedBox.square(dimension: 112),
      ),
    );
  }
}
