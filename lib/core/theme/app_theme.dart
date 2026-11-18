import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_tokens.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData get dark {
    final textTheme = AppTypography.textTheme;

    const scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.accent,
      onSecondary: AppColors.onAccent,
      tertiary: AppColors.warning,
      onTertiary: Color(0xFF3F2A00), // not in design
      error: AppColors.error,
      onError: Color(0xFF690005), // not in design
      surface: AppColors.background,
      onSurface: AppColors.textPrimary,
      onSurfaceVariant: AppColors.textSecondary,
      surfaceContainerLow: AppColors.surfaceLow,
      surfaceContainer: AppColors.surface,
      surfaceContainerHigh: AppColors.surfaceHigh,
      surfaceContainerHighest: AppColors.surfaceHighest,
      outline: AppColors.outline,
      outlineVariant: AppColors.outlineVariant,
    );

    final buttonShape = RoundedRectangleBorder(borderRadius: AppRadius.mediumBorder);
    const buttonPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.background,
      textTheme: textTheme,
      iconTheme: const IconThemeData(color: AppColors.textSecondary, size: 16),
      dividerTheme: const DividerThemeData(
        color: AppColors.dividerSoft, thickness: 1, space: 1,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.glassHeader,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 64,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge?.copyWith(color: AppColors.primary),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.glassNav,
        elevation: 0,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        selectedLabelStyle: textTheme.labelSmall?.copyWith(color: AppColors.primary),
        unselectedLabelStyle: textTheme.labelSmall,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(size: 18),
        unselectedIconTheme: const IconThemeData(size: 16),
      ),

      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: AppRadius.largeBorder),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          disabledBackgroundColor: AppColors.surfaceHigh,
          disabledForegroundColor: AppColors.disabledText,
          elevation: 0,
          shadowColor: Colors.transparent,
          minimumSize: const Size(0, 32),
          padding: buttonPadding,
          shape: buttonShape,
          textStyle: textTheme.labelLarge,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.onPrimary,
          minimumSize: const Size(0, 32),
          padding: buttonPadding,
          shape: buttonShape,
          textStyle: textTheme.labelLarge,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.accent,
          textStyle: textTheme.labelLarge,
        ),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: AppColors.surfaceHigh,
        selectedColor: AppColors.primary,
        disabledColor: AppColors.surfaceHigh,
        labelStyle: textTheme.labelLarge?.copyWith(color: AppColors.textSecondary),
        secondaryLabelStyle: textTheme.labelLarge?.copyWith(color: AppColors.onPrimary),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        labelPadding: EdgeInsets.zero,
        side: BorderSide.none,
        showCheckmark: false,
        shape: const StadiumBorder(),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceHigh,
        hintStyle: textTheme.bodyMedium?.copyWith(color: AppColors.hint),
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: AppRadius.mediumBorder, borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.mediumBorder, borderSide: BorderSide.none,
        ),
        // Focus ring is not in the design, subtle addition
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.mediumBorder,
          borderSide: const BorderSide(color: AppColors.primary, width: 1),
        ),
      ),

      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.surfaceHigh,
      ),
    );
  }
}