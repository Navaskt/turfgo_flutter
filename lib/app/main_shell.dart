import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../core/theme/app_text_styles.dart';
import '../core/widgets/glass_bottom_nav.dart';
import '../features/turf_explore/presentation/screens/explore_screen.dart';


class NavIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void select(int index) => state = index;
}

final navIndexProvider = NotifierProvider<NavIndexNotifier, int>(NavIndexNotifier.new);

/// Bottom-nav shell. Wire this into your router if you already have one.
class MainShell extends ConsumerWidget {
  const MainShell({super.key});

  static const _items = [
    NavItemData(icon: Icons.sports_soccer_rounded, label: 'Explore'),
    NavItemData(icon: Icons.event_note_rounded, label: 'Bookings'),
    NavItemData(icon: Icons.splitscreen_rounded, label: 'Split Pay'),
    NavItemData(icon: Icons.confirmation_number_outlined, label: 'Passes'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navIndexProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: index,
          children: const [
            ExplorePage(),
            _ComingSoon('Bookings'),
            _ComingSoon('Split Pay'),
            _ComingSoon('Passes'),
          ],
        ),
        bottomNavigationBar: GlassBottomNav(
          items: _items,
          currentIndex: index,
          onTap: ref.read(navIndexProvider.notifier).select,
        ),
      ),
    );
  }
}

class _ComingSoon extends StatelessWidget {
  const _ComingSoon(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('$title — coming soon', style: AppTextStyles.bodyLarge));
  }
}
