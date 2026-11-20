import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:turfgo_flutter/core/shared/presentation/controller/main_navigation_notifier.dart';

class MainNavigationScreen extends ConsumerWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

final currentIndex = ref.watch(mainNavigationProvider.select((state) => state.currentIndex));

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: IndexedStack
          index: state.enableSearch ? 1 : 0,
          children: [
            IndexedStack(
              index: currentIndex,
              children: _buildScreens(
                currentIndex,
                isStreamersEnabled,
                isNewsEnabled,
              ),
            ),
            SearchScreen(searchQuery: state.searchQuery),
          ],
        ),
      bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) =>
                  _handleNavigation(context, ref, currentIndex, index),
              selectedLabelStyle: context.customTextStyles.medium10_15,
              unselectedLabelStyle: context.customTextStyles.medium10_15,
              items: _buildBottomNavBarItems(
                currentIndex,
                selectedColor: navTheme.selectedItemColor!,
                unselectedColor: navTheme.unselectedItemColor!,
                context: context,
                isStreamersEnabled: isStreamersEnabled,
                isNewsEnabled: isNewsEnabled,
              ),
          
    );
  }
}