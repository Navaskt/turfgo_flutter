
import 'package:google_fonts/google_fonts.dart';
import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';

/// Chivo for headings / labels / buttons, Space Grotesk for body copy.
/// Sizes, line-heights and tracking come straight from Figma.
abstract final class AppTextStyles {
  static TextStyle _chivo(
    double size,
    FontWeight weight,
    double lineHeight, {
    double tracking = 0,
    Color color = AppColors.textPrimary,
  }) =>
      GoogleFonts.chivo(
        fontSize: size,
        fontWeight: weight,
        height: lineHeight / size,
        letterSpacing: tracking,
        color: color,
      );

  static TextStyle _grotesk(
    double size,
    double lineHeight, {
    Color color = AppColors.textSecondary,
  }) =>
      GoogleFonts.spaceGrotesk(
        fontSize: size,
        fontWeight: FontWeight.w400,
        height: lineHeight / size,
        color: color,
      );

  static final h1 = _chivo(24, FontWeight.w800, 30, tracking: -0.6);
  static final title = _chivo(20, FontWeight.w700, 25);
  static final bannerTitle = _chivo(20, FontWeight.w700, 26, tracking: -0.5);
  static final price = _chivo(20, FontWeight.w700, 20, color: AppColors.primary);
  static final brand = _chivo(20, FontWeight.w700, 20, tracking: 1, color: AppColors.primary);
  static final guideTitle = _chivo(14, FontWeight.w700, 18);
  static final buttonLarge = _chivo(14, FontWeight.w700, 18, tracking: 0.7);
  static final button = _chivo(12, FontWeight.w700, 16, tracking: 0.6);
  static final value = _chivo(12, FontWeight.w700, 16);
  static final label = _chivo(10, FontWeight.w900, 12, tracking: 0.5, color: AppColors.textSecondary);

  static final bodyLarge = _grotesk(14, 18);
  static final body = _grotesk(12, 16);

  static final textTheme = TextTheme(
    headlineMedium: h1,
    titleLarge: title,
    titleMedium: guideTitle,
    bodyLarge: bodyLarge,
    bodyMedium: body,
    labelLarge: buttonLarge,
    labelMedium: button,
    labelSmall: label,
  );
}
