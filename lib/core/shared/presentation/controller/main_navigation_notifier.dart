import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main_navigation_notifier.freezed.dart';
part 'main_navigation_notifier.g.dart';
part 'main_navigation_state.dart';


@Riverpod(keepAlive: true)
class MainNavigationNotifier extends _$MainNavigationNotifier {
  @override
  MainNavigationState build() {
    return const MainNavigationState();
  }

void setCurrentIndex(int index) {
  state = state.copyWith(currentIndex: index);
}

}