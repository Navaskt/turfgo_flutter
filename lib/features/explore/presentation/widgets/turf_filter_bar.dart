import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_choice_chip.dart';
import '../../domain/entities/turf_filter.dart';
import '../providers/explore_providers.dart';


/// Horizontally scrolling quick filters bound to [selectedTurfFilterProvider].
class TurfFilterBar extends ConsumerWidget {
  const TurfFilterBar({super.key});

  static const _filters = TurfFilter.values;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(selectedTurfFilterProvider);
    final notifier = ref.read(selectedTurfFilterProvider.notifier);

    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(AppSpacing.page, 12, AppSpacing.page, 4),
        itemCount: _filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (_, i) {
          final filter = _filters[i];
          return AppChoiceChip(
            label: filter.label,
            selected: filter == selected,
            onTap: () => notifier.select(filter),
          );
        },
      ),
    );
  }
}
