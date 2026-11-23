import 'package:flutter/painting.dart';

abstract final class AppShadows {
  /// Neon glow used on primary controls.
  static List<BoxShadow> glow(
    Color color, {
    double alpha = 0.35,
    double blur = 8,
  }) =>
      [BoxShadow(color: color.withValues(alpha: alpha), blurRadius: blur)];

  static const card = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 15, spreadRadius: -3, offset: Offset(0, 10)),
    BoxShadow(color: Color(0x1A000000), blurRadius: 6, spreadRadius: -4, offset: Offset(0, 4)),
  ];

  static const hero = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 25, spreadRadius: -5, offset: Offset(0, 20)),
    BoxShadow(color: Color(0x1A000000), blurRadius: 10, spreadRadius: -6, offset: Offset(0, 8)),
  ];

  static const soft = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 6, spreadRadius: -1, offset: Offset(0, 4)),
  ];

  static const subtle = [
    BoxShadow(color: Color(0x0D000000), blurRadius: 1, offset: Offset(0, 1)),
  ];

  static const header = [
    BoxShadow(color: Color(0x66000000), blurRadius: 20, offset: Offset(0, 4)),
  ];

  static const nav = [
    BoxShadow(color: Color(0x99000000), blurRadius: 24, offset: Offset(0, -4)),
  ];
}
