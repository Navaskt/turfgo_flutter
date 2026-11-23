

import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_shadows.dart';
import '../theme/app_text_styles.dart';

/// 48 px search input with an optional trailing filter button.
class AppSearchField extends StatelessWidget {
  const AppSearchField({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.onFilterTap,
  });

  final String hint;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: const BoxDecoration(
        color: AppColors.surfaceHigh,
        borderRadius: AppRadius.control,
        boxShadow: AppShadows.soft,
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, size: 18, color: AppColors.accent),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              textInputAction: TextInputAction.search,
              style: AppTextStyles.bodyLarge.copyWith(color: AppColors.textPrimary),
              decoration: InputDecoration.collapsed(
                hintText: hint,
                hintStyle: AppTextStyles.bodyLarge.copyWith(color: AppColors.textHint),
              ),
            ),
          ),
          if (onFilterTap != null) ...[
            const SizedBox(width: AppSpacing.sm),
            Semantics(
              button: true,
              label: 'Filters',
              child: Material(
                color: AppColors.surface,
                borderRadius: AppRadius.small,
                child: InkWell(
                  onTap: onFilterTap,
                  borderRadius: AppRadius.small,
                  child: const SizedBox.square(
                    dimension: 32,
                    child: Icon(Icons.tune_rounded, size: 16, color: AppColors.textSecondary),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
