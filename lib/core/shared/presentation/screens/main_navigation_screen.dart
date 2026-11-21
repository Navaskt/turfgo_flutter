import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../features/explore/presentation/screens/explore_screen.dart';
import '../../../theme/app_colors.dart';
import '../controller/main_navigation_notifier.dart';
import '../widgets/app_header.dart';
import '../widgets/app_svg_icon.dart';

class MainNavigationScreen extends ConsumerWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(
      mainNavigationProvider.select((state) => state.currentIndex),
    );

    return Scaffold(
      appBar: AppHeader(title: _buildTitle()),
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: IndexedStack(
          index: currentIndex,
          children: _buildScreens(currentIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) =>
            ref.read(mainNavigationProvider.notifier).setCurrentIndex(index),
        items: _buildBottomNavBarItems(
          currentIndex,
          selectedColor: AppColors.primary,
          unselectedColor: AppColors.textSecondary,
          context: context,
        ),
      ),
    );
  }

  // Helper method to build screens based on feature flags
  List<Widget> _buildScreens(int currentIndex) {
    final screens = <Widget>[
      ExploreScreen(),
      Container(),
      Container(),
      Container(),
    ];

    return screens;
  }

  // get list of item with handle selected and unselected item
  List<BottomNavigationBarItem> _buildBottomNavBarItems(
    int currentIndex, {
    required Color selectedColor,
    required Color unselectedColor,
    required BuildContext context,
  }) {
    final items = [
      (AppAssets.iconExplore, 'EXPLORE'),
      (AppAssets.iconBooking, 'BOOKINGS'),
      (AppAssets.iconSplit, 'SPLIT PAY'),
      (AppAssets.iconTicket, 'PROFILE'),
    ];

    return List.generate(items.length, (i) {
      final item = items[i];
      final isSelected = i == currentIndex;
      return BottomNavigationBarItem(
        label: item.$2,
        icon: AppSvgIcon(
          item.$1,
          color: isSelected ? selectedColor : unselectedColor,
        ),
      );
    });
  }

  Widget _buildTitle() {
    return Column(
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
    );
  }
}
