import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';
import 'neon_button.dart';


/// Renders an [AsyncValue] with consistent loading / error states.
/// While a provider reloads (e.g. a filter changes) the previous data stays
/// on screen instead of flashing a spinner.
class AsyncValueView<T> extends StatelessWidget {
  const AsyncValueView({
    super.key,
    required this.value,
    required this.data,
    this.onRetry,
    this.loadingHeight = 160,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback? onRetry;
  final double loadingHeight;

  @override
  Widget build(BuildContext context) {
    return value.when(
      skipLoadingOnReload: true,
      data: data,
      loading: () => _LoadingBox(height: loadingHeight),
      error: (_, __) => _ErrorBox(onRetry: onRetry),
    );
  }
}

/// Sliver flavour of [AsyncValueView] for list sections.
class AsyncSliverView<T> extends StatelessWidget {
  const AsyncSliverView({
    super.key,
    required this.value,
    required this.data,
    this.onRetry,
    this.loadingHeight = 240,
  });

  final AsyncValue<T> value;
  final Widget Function(T data) data;
  final VoidCallback? onRetry;
  final double loadingHeight;

  @override
  Widget build(BuildContext context) {
    return value.when(
      skipLoadingOnReload: true,
      data: data,
      loading: () => SliverToBoxAdapter(child: _LoadingBox(height: loadingHeight)),
      error: (_, __) => SliverToBoxAdapter(child: _ErrorBox(onRetry: onRetry)),
    );
  }
}

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.message, this.icon = Icons.search_off_rounded});

  final String message;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.section * 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 32, color: AppColors.surfaceHighest),
          const SizedBox(height: AppSpacing.sm),
          Text(message, style: AppTextStyles.body, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _LoadingBox extends StatelessWidget {
  const _LoadingBox({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(child: CircularProgressIndicator(strokeWidth: 2.5)),
    );
  }
}

class _ErrorBox extends StatelessWidget {
  const _ErrorBox({this.onRetry});

  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.section),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Something went wrong.', style: AppTextStyles.body),
          if (onRetry != null) ...[
            const SizedBox(height: AppSpacing.md),
            NeonButton(label: 'Retry', onPressed: onRetry),
          ],
        ],
      ),
    );
  }
}
