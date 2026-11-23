import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

abstract final class AppGradients {
  /// Hero card photo scrim (fades into the card surface).
  static const heroScrim = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [AppColors.surface, Color(0x991C211E), Color(0x001C211E)],
    stops: [0, 0.5, 1],
  );

  /// Arena card photo scrim (dark top for badges, surface bottom for chips).
  static const arenaScrim = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [AppColors.surface, Color(0x001C211E), Color(0x4D000000)],
    stops: [0, 0.5, 1],
  );

  static const banner = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [AppColors.surfaceHigh, AppColors.surface],
  );

  /// Cheap replacement for Figma's blurred glow blobs (no real blur filter).
  static const bannerGlow = RadialGradient(
    colors: [Color(0x1A41F978), Color(0x0041F978)],
  );
}
