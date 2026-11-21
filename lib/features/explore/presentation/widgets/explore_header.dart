import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.page,
        10,
        AppSpacing.page,
        12,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              Column(
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'PITCH',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            letterSpacing: .7,
                          ),
                        ),
                        TextSpan(
                          text: 'VOLT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w900,
                            letterSpacing: .7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'EXPLORE PITCHES',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 7,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.surfaceHigh,
                  borderRadius: AppRadius.pillBorder,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, size: 11, color: AppColors.primary),
                    SizedBox(width: 3),
                    Text(
                      'MUMBAI, INDIA',
                      style: TextStyle(
                        fontSize: 8,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 11,
                      color: AppColors.textSecondary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: AppColors.surfaceHigh,
              borderRadius: AppRadius.mediumBorder,
            ),
            child: const Row(
              children: [
                Icon(Icons.search, size: 17, color: AppColors.primary),
                SizedBox(width: 9),
                Expanded(
                  child: Text(
                    'Search arenas, postcodes, or cages...',
                    style: TextStyle(fontSize: 11, color: AppColors.hint),
                  ),
                ),
                Icon(Icons.tune, size: 17, color: AppColors.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
