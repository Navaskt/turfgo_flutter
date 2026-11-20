import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Chivo = headings, labels, buttons, prices. Space Grotesk = body text.
/// Uppercase labels in the design must be applied in the widget
/// (e.g. Text('quick book'.toUpperCase())), TextStyle can't do it.
abstract final class AppTypography {
  static TextTheme get textTheme {
    return TextTheme(
      // "Featured Arenas", "Kensington Sky Dome"
      headlineMedium: GoogleFonts.chivo(
        fontSize: 24, fontWeight: FontWeight.w800, height: 30 / 24,
        letterSpacing: -0.6, color: AppColors.textPrimary,
      ),
      // Arena name, "Need an opponent?", prices (color it primary)
      titleLarge: GoogleFonts.chivo(
        fontSize: 20, fontWeight: FontWeight.w700, height: 25 / 20,
        letterSpacing: -0.5, color: AppColors.textPrimary,
      ),
      // "Pitch Surface Guide"
      titleMedium: GoogleFonts.chivo(
        fontSize: 14, fontWeight: FontWeight.w700, height: 18 / 14,
        color: AppColors.textPrimary,
      ),
      // Buttons, chips, links (uppercase, tracked)
      labelLarge: GoogleFonts.chivo(
        fontSize: 12, fontWeight: FontWeight.w700, height: 16 / 12,
        letterSpacing: 0.6, color: AppColors.textPrimary,
      ),
      // Spec values ("7-a-side"), slot times
      labelMedium: GoogleFonts.chivo(
        fontSize: 12, fontWeight: FontWeight.w700, height: 16 / 12,
        color: AppColors.textPrimary,
      ),
      // Overline / badges / nav labels (uppercase)
      labelSmall: GoogleFonts.chivo(
        fontSize: 10, fontWeight: FontWeight.w900, height: 12 / 10,
        letterSpacing: 0.5, color: AppColors.textSecondary,
      ),
      bodyLarge: GoogleFonts.spaceGrotesk(
        fontSize: 16, fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      // Search text
      bodyMedium: GoogleFonts.spaceGrotesk(
        fontSize: 14, fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
      // Descriptions, distance, features
      bodySmall: GoogleFonts.spaceGrotesk(
        fontSize: 12, fontWeight: FontWeight.w400, height: 16 / 12,
        color: AppColors.textSecondary,
      ),
    );
  }
}