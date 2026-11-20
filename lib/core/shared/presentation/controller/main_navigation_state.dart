part of 'main_navigation_notifier.dart';

@freezed
abstract class MainNavigationState with _$MainNavigationState {
  const factory MainNavigationState({
    @Default(0) int currentIndex,
  }) = _MainNavigationState;
}
