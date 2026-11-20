import 'package:material_ui/material_ui.dart';


abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double card = 14; // card inner padding
  static const double page = 16; // screen horizontal padding
  static const double section = 20; // gap between sections
}

abstract final class AppRadius {
  static const double badge = 4;
  static const double tag = 6;
  static const double small = 8; // slot pills, icon buttons
  static const double medium = 12; // buttons, search, spec grid
  static const double large = 16; // cards
  static const double pill = 9999; // chips, avatars

  static const badgeBorder = BorderRadius.all(Radius.circular(badge));
  static const smallBorder = BorderRadius.all(Radius.circular(small));
  static const mediumBorder = BorderRadius.all(Radius.circular(medium));
  static const largeBorder = BorderRadius.all(Radius.circular(large));
  static const pillBorder = BorderRadius.all(Radius.circular(pill));
}

abstract final class AppShadows {
  /// Standard card (arena cards, banners)
  static const card = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 15, spreadRadius: -3, offset: Offset(0, 10)),
    BoxShadow(color: Color(0x1A000000), blurRadius: 6, spreadRadius: -4, offset: Offset(0, 4)),
  ];

  /// Hero card
  static const hero = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 25, spreadRadius: -5, offset: Offset(0, 20)),
    BoxShadow(color: Color(0x1A000000), blurRadius: 10, spreadRadius: -6, offset: Offset(0, 8)),
  ];

  /// Neon glow behind primary buttons / active chips.
  /// Wrap the button: DecoratedBox(decoration: BoxDecoration(
  ///   borderRadius: AppRadius.mediumBorder, boxShadow: AppShadows.neonGlow), child: ...)
  static const neonGlow = [
    BoxShadow(color: Color(0x4D00FF87), blurRadius: 6), // ~30%
  ];
  static const neonGlowStrong = [
    BoxShadow(color: Color(0x6600FF87), blurRadius: 8), // ~40%
  ];

  static List<BoxShadow> glowOf(Color c, {double opacity = .35, double blur = 8}) =>
      [BoxShadow(color: c.withValues(alpha: opacity), blurRadius: blur)];

  static const navbar = [
    BoxShadow(color: Color(0x99000000), blurRadius: 24, offset: Offset(0, -4)),
  ];
}