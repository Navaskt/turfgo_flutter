import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_dimens.dart';
import '../../../../core/widgets/app_search_field.dart';
import '../providers/explore_providers.dart';
import '../widgets/explore_header.dart';
import '../widgets/explore_sections.dart';
import '../widgets/turf_filter_bar.dart';


/// Explore Arenas screen.
///
/// Expects to live inside a `Scaffold(extendBody: true)` (see MainShell) so the
/// glass header and bottom nav float above the scrolling content.
class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.paddingOf(context);

    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: insets.top + ExploreHeader.height)),
            const SliverToBoxAdapter(child: _SearchAndFilters()),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.section,
                AppSpacing.page,
                0,
              ),
              sliver: SliverList.list(
                children: const [
                  PrimeTimeSection(),
                  SizedBox(height: AppSpacing.section),
                  MatchFinderSection(),
                  SizedBox(height: AppSpacing.section),
                  FeaturedArenasHeader(),
                  SizedBox(height: AppSpacing.card),
                ],
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.page),
              sliver: FeaturedArenasSliver(),
            ),
            SliverPadding(
              // insets.bottom already includes the bottom nav (extendBody).
              padding: EdgeInsets.fromLTRB(
                AppSpacing.page,
                AppSpacing.section,
                AppSpacing.page,
                insets.bottom + AppSpacing.lg,
              ),
              sliver: SliverToBoxAdapter(
                child: SurfaceGuideTile(
                  onTap: () {
                    // TODO(navigation): show surface guide bottom sheet
                  },
                ),
              ),
            ),
          ],
        ),
        const Positioned(top: 0, left: 0, right: 0, child: ExploreHeader()),
      ],
    );
  }
}

class _SearchAndFilters extends ConsumerWidget {
  const _SearchAndFilters();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(AppSpacing.page, AppSpacing.xs, AppSpacing.page, 0),
          child: AppSearchField(
            hint: 'Search arenas, postcodes, or cages...',
            onChanged: ref.read(searchQueryProvider.notifier).update,
            onFilterTap: () {
              // TODO(navigation): open filter sheet
            },
          ),
        ),
        const TurfFilterBar(),
      ],
    );
  }
}
