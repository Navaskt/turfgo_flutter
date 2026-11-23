

import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';

class SpecItem {
  const SpecItem(this.label, this.value);

  final String label;
  final String value;
}

/// Equal-width columns of "LABEL / value" (FORMAT, DIMENSIONS, STUD TYPE).
class SpecsGrid extends StatelessWidget {
  const SpecsGrid({super.key, required this.items});

  final List<SpecItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: const BoxDecoration(
        color: AppColors.surfaceHigh,
        borderRadius: AppRadius.control,
      ),
      child: Row(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            if (i > 0) const SizedBox(width: 6),
            Expanded(child: _SpecCell(item: items[i])),
          ],
        ],
      ),
    );
  }
}

class _SpecCell extends StatelessWidget {
  const _SpecCell({required this.item});

  final SpecItem item;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '${item.label}: ${item.value}',
      excludeSemantics: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(item.label.toUpperCase(), style: AppTextStyles.label, textAlign: TextAlign.center),
          // Scales down instead of overflowing with large system fonts.
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(item.value, style: AppTextStyles.value, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
