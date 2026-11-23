

import 'package:flutter/widgets.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_badge.dart';
import '../../domain/entities/arena.dart';

extension AmenityUi on Amenity {
  String get label => switch (this) {
        Amenity.floodlights => 'Floodlights',
        Amenity.changingRooms => 'Changing',
        Amenity.scoreboard => 'Scoreboard',
        Amenity.matchReplay => 'Match Replay',
        Amenity.rainProof => 'Rain Proof',
        Amenity.freeParking => 'Free Parking',
      };

  IconData get icon => switch (this) {
        Amenity.floodlights => Icons.highlight_rounded,
        Amenity.changingRooms => Icons.checkroom_rounded,
        Amenity.scoreboard => Icons.scoreboard_outlined,
        Amenity.matchReplay => Icons.videocam_outlined,
        Amenity.rainProof => Icons.umbrella_rounded,
        Amenity.freeParking => Icons.local_parking_rounded,
      };
}

extension ArenaTagUi on ArenaTag {
  /// Maps the semantic tag type onto the design's badge styles.
  Widget toBadge() => switch (type) {
        ArenaTagType.highlight => AppBadge(
            label: label,
            background: AppColors.greenBadge,
            foreground: AppColors.onGreen,
          ),
        ArenaTagType.certification => AppBadge(label: label),
        ArenaTagType.feature => AppBadge(
            label: label,
            background: AppColors.surfaceHighestGlass,
            foreground: AppColors.accent,
          ),
      };
}
