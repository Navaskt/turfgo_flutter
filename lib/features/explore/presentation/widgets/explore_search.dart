import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';

class ExploreSearch extends StatelessWidget {
  const ExploreSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.pageHorizontal.w,
        vertical: 10.h,
      ),
      child: Column(
        children: [
          
          Container(
            height: 42,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
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
