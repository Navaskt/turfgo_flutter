import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';
import '../providers/explore_filter_provider.dart';

class TurfFilterChips extends ConsumerWidget {
  const TurfFilterChips({super.key});
  static const filters = ['ALL TURFS', '5-A-SIDE', '7-A-SIDE', '11-A-SIDE'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(exploreFilterProvider);
    return SizedBox(
      height: 31,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.page),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 7),
        itemBuilder: (context, index) {
          final item = filters[index];
          final active = selected == item;
          return InkWell(
            borderRadius: AppRadius.pillBorder,
            onTap: () => ref.read(exploreFilterProvider.notifier).select(item),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: active ? AppColors.primary : AppColors.surfaceHigh,
                borderRadius: AppRadius.pillBorder,
              ),
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  letterSpacing: .25,
                  color: active ? AppColors.onPrimary : AppColors.textSecondary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
