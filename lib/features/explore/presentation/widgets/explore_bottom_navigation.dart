import 'package:material_ui/material_ui.dart';
import 'package:turfgo_flutter/core/shared/presentation/widgets/app_svg_icon.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';

class ExploreBottomNavigation extends StatelessWidget {
  const ExploreBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (AppAssets.iconExplore, 'EXPLORE'),
    (AppAssets.iconBooking, 'BOOKINGS'),
    (AppAssets.iconSplit, 'SPLIT PAY'),
    (AppAssets.iconTicket, 'PROFILE'),
  ];

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.overlayDark,
      border: const Border(top: BorderSide(color: AppColors.dividerSoft)),
      boxShadow: AppShadows.navbar,
    ),
    padding: EdgeInsets.only(
      top: 8,
      bottom: MediaQuery.paddingOf(context).bottom > 0 ? 5 : 9,
    ),
    child: Row(
      children: List.generate(_items.length, (index) {
        final item = _items[index];
        final selected = currentIndex == index;
        return Expanded(
          child: InkWell(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppSvgIcon(
                  item.$1,
                  color: selected ? AppColors.primary : AppColors.textSecondary,
                ),
                const SizedBox(height: 4),
                Text(
                  item.$2,
                  style: TextStyle(
                    fontSize: 7,
                    letterSpacing: .4,
                    fontWeight: FontWeight.w800,
                    color: selected
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 15,
                  height: 2,
                  decoration: BoxDecoration(
                    color: selected ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    ),
  );
}
