import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';

class PitchSurfaceGuideCard extends StatelessWidget {
  const PitchSurfaceGuideCard({super.key});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(11),
    decoration: BoxDecoration(
      color: AppColors.surface,
      borderRadius: AppRadius.mediumBorder,
      border: Border.all(
        color: AppColors.outlineVariant.withValues(alpha: .45),
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF16432E),
            borderRadius: AppRadius.smallBorder,
          ),
          child: const Icon(
            Icons.grid_view_rounded,
            size: 17,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 9),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pitch Surface Guide',
                style: TextStyle(
                  fontSize: 10,
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Check ideal specifications & shock pad ratings',
                style: TextStyle(fontSize: 7, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
        const Text(
          'GO',
          style: TextStyle(
            fontSize: 8,
            color: AppColors.primary,
            fontWeight: FontWeight.w900,
            letterSpacing: .5,
          ),
        ),
        const SizedBox(width: 3),
        const Icon(Icons.arrow_forward_ios, size: 9, color: AppColors.primary),
      ],
    ),
  );
}
