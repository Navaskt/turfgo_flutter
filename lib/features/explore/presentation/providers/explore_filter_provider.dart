import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreFilterNotifier extends Notifier<String> {
  @override
  String build() => 'ALL TURFS';

  void select(String value) => state = value;
}

final exploreFilterProvider =
    NotifierProvider<ExploreFilterNotifier, String>(ExploreFilterNotifier.new);
