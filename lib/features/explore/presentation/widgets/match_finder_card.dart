import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';

class MatchFinderCard extends StatelessWidget {
  const MatchFinderCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(
        horizontal: AppSpacing.pageHorizontal.w,
      ),
      padding: EdgeInsets.all(13.w),
      decoration: BoxDecoration(
        borderRadius: AppRadius.largeBorder,
        gradient: const LinearGradient(
          colors: [Color(0xFF173B2A), Color(0xFF1C2B22)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: AppColors.success.withValues(alpha: .12)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      'MATCH FINDER LIVE',
                      style: TextStyle(
                        fontSize: 8,
                        color: AppColors.successText,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .7,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                const Text(
                  'Need an opponent?',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  '15 teams are hunting for friends\nto light up the pitch.',
                  style: TextStyle(
                    fontSize: 9,
                    height: 1.4,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    SizedBox(
                      width: 48,
                      height: 18,
                      child: Stack(
                        children: List.generate(
                          3,
                          (i) => Positioned(
                            left: i * 12,
                            child: CircleAvatar(
                              radius: 9,
                              backgroundColor: [
                                const Color(0xFF5A806C),
                                const Color(0xFF9C754D),
                                const Color(0xFF426A8A),
                              ][i],
                              child: const Icon(
                                Icons.person,
                                size: 11,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Expanded(
                      child: Text(
                        'FC Volt Tigers, Camden United +12 others',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 7,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.accent,
              foregroundColor: AppColors.onAccent,
              minimumSize: const Size(58, 29),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(
                borderRadius: AppRadius.smallBorder,
              ),
            ),
            child: const Text(
              'JOIN',
              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
