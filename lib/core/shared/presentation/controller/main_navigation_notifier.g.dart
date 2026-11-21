// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_navigation_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MainNavigationNotifier)
final mainNavigationProvider = MainNavigationNotifierProvider._();

final class MainNavigationNotifierProvider
    extends $NotifierProvider<MainNavigationNotifier, MainNavigationState> {
  MainNavigationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mainNavigationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mainNavigationNotifierHash();

  @$internal
  @override
  MainNavigationNotifier create() => MainNavigationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MainNavigationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MainNavigationState>(value),
    );
  }
}

String _$mainNavigationNotifierHash() =>
    r'29407ec8855991c034814c523aab828be58d721c';

abstract class _$MainNavigationNotifier extends $Notifier<MainNavigationState> {
  MainNavigationState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MainNavigationState, MainNavigationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MainNavigationState, MainNavigationState>,
              MainNavigationState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
