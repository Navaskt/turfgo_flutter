

import 'package:material_ui/material_ui.dart';

import '../theme/app_text_styles.dart';
import '../utils/app_formatters.dart';

/// "$55 /hr" with a baseline-aligned suffix and an optional caption above.
class PriceTag extends StatelessWidget {
  const PriceTag({
    super.key,
    required this.amount,
    this.suffix = '/hr',
    this.caption,
  });

  final double amount;
  final String suffix;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    final price = AppFormatters.price(amount);
    return Semantics(
      label: '${caption != null ? '$caption ' : ''}$price per hour',
      excludeSemantics: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (caption != null) Text(caption!.toUpperCase(), style: AppTextStyles.label),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(price, style: AppTextStyles.price),
              const SizedBox(width: 3),
              Text(suffix, style: AppTextStyles.body),
            ],
          ),
        ],
      ),
    );
  }
}
