import 'package:flutter/widgets.dart';

abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double page = 16;
  static const double card = 14;
  static const double section = 20;
}

abstract final class AppRadius {
  static const badge = BorderRadius.all(Radius.circular(4));
  static const tag = BorderRadius.all(Radius.circular(6));
  static const small = BorderRadius.all(Radius.circular(8));
  static const control = BorderRadius.all(Radius.circular(12));
  static const card = BorderRadius.all(Radius.circular(16));
  static const pill = BorderRadius.all(Radius.circular(999));
}
