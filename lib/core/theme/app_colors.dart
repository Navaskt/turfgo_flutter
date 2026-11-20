import 'package:material_ui/material_ui.dart';

/// Colors extracted from the TurfGo Figma file (Explore Arenas screen).
abstract final class AppColors {
  // Surfaces (dark, stepped)
  static const background = Color(0xFF0F1412); // screen bg
  static const surfaceLow = Color(0xFF181D1A); // info rows / modal triggers
  static const surface = Color(0xFF1C211E); // cards
  static const surfaceHigh = Color(0xFF262B29); // search, chips, spec grid
  static const surfaceHighest = Color(0xFF313633); // active slot pill, avatar ring
  static const overlayDark = Color(0xFF0A0F0D); // glass badges / nav base

  // Brand
  static const primary = Color(0xFF00FF87); // neon green (CTA, price)
  static const onPrimary = Color(0xFF007138); // text on CTA
  static const accent = Color(0xFF41F978); // links, live dot, JOIN button
  static const onAccent = Color(0xFF003913);
  static const success = Color(0xFF00DB5F); // status dot, FAST BOOKING badge
  static const onSuccess = Color(0xFF005A23);
  static const successText = Color(0xFF00E478); // tag text on dark chip
  static const warning = Color(0xFFFFB94E); // "2 slots left" urgency
  static const error = Color(0xFFFFB4AB); // not in design, Material default

  // Text
  static const textPrimary = Color(0xFFF1FFEF);
  static const textSecondary = Color(0xFFB9CBB9);
  static const textTertiary = Color(0xFFDFE4E0); // location pill text

  // Lines
  static const outline = Color(0xFF849585);
  static const outlineVariant = Color(0xFF3B4B3D);

  // Translucent variants used in the design
  static const hint = Color(0x99B9CBB9); // 60% search placeholder
  static const disabledText = Color(0x80849585); // 50% "filled" slot
  static const glassHeader = Color(0xCC0F1412); // 80% header
  static const glassNav = Color(0xD90A0F0D); // 85% bottom nav
  static const glassBadge = Color(0xD90A0F0D); // 85% overlay chips on images
  static const dividerSoft = Color(0x4D3B4B3D); // 30%
}