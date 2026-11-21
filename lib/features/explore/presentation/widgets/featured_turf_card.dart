import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';
import 'pitch_artwork.dart';

class FeaturedTurfCard extends StatelessWidget {
  const FeaturedTurfCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(
        horizontal: AppSpacing.pageHorizontal.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.largeBorder,
        boxShadow: AppShadows.hero,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const PitchArtwork(height: 126),
              Positioned(
                left: 10,
                top: 9,
                child: _ImageBadge(
                  icon: Icons.local_fire_department,
                  text: '2 SLOTS LEFT TONIGHT',
                  color: AppColors.warning,
                ),
              ),
              Positioned(
                right: 10,
                top: 9,
                child: _ImageBadge(
                  icon: Icons.bolt,
                  text: 'PRIME FLOODLIGHT',
                  color: AppColors.primary,
                ),
              ),
              Positioned(
                left: 11,
                bottom: 9,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.glassBadge,
                    borderRadius: AppRadius.badgeBorder,
                  ),
                  child: const Text(
                    'FEATURED  /  SKY DOME',
                    style: TextStyle(
                      fontSize: 8,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .4,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kensington Sky Dome',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.1,
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'MATURAN  /  SKY DOME',
                            style: TextStyle(
                              fontSize: 8,
                              color: AppColors.successText,
                              fontWeight: FontWeight.w800,
                              letterSpacing: .5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'FROM',
                          style: TextStyle(
                            fontSize: 7,
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '₹45/hr',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Expanded(
                      child: _TimeSlot(
                        time: '22:00 - 23:00',
                        sub: 'Pitch 1',
                        selected: true,
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: _TimeSlot(time: '23:00 - 00:00', sub: 'Pitch 2'),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: _TimeSlot(
                        time: '00:00 - 01:00',
                        sub: 'Pitch 3',
                        disabled: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.nightlight_round,
                      size: 11,
                      color: AppColors.successText,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Tonight',
                      style: TextStyle(
                        fontSize: 9,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.near_me,
                      size: 11,
                      color: AppColors.successText,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '0.2 mi',
                      style: TextStyle(
                        fontSize: 9,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const Spacer(),
                    _PrimaryButton(label: 'QUICK BOOK', onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageBadge extends StatelessWidget {
  const _ImageBadge({
    required this.icon,
    required this.text,
    required this.color,
  });
  final IconData icon;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
    decoration: BoxDecoration(
      color: AppColors.glassBadge,
      borderRadius: AppRadius.badgeBorder,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 9, color: color),
        const SizedBox(width: 3),
        Text(
          text,
          style: TextStyle(
            fontSize: 7,
            color: color,
            fontWeight: FontWeight.w900,
            letterSpacing: .3,
          ),
        ),
      ],
    ),
  );
}

class _TimeSlot extends StatelessWidget {
  const _TimeSlot({
    required this.time,
    required this.sub,
    this.selected = false,
    this.disabled = false,
  });
  final String time;
  final String sub;
  final bool selected;
  final bool disabled;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 3),
    decoration: BoxDecoration(
      color: selected ? const Color(0xFF164A32) : AppColors.surfaceHigh,
      borderRadius: AppRadius.smallBorder,
      border: selected
          ? Border.all(color: AppColors.primary.withValues(alpha: .55))
          : null,
    ),
    child: Column(
      children: [
        Text(
          time,
          maxLines: 1,
          style: TextStyle(
            fontSize: 7,
            color: disabled ? AppColors.disabledText : AppColors.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          sub,
          style: TextStyle(
            fontSize: 7,
            color: disabled ? AppColors.disabledText : AppColors.textSecondary,
          ),
        ),
      ],
    ),
  );
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: AppRadius.smallBorder,
      boxShadow: AppShadows.neonGlow,
    ),
    child: FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: const Size(0, 30),
        padding: const EdgeInsets.symmetric(horizontal: 13),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.smallBorder),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w900,
          letterSpacing: .3,
        ),
      ),
    ),
  );
}
