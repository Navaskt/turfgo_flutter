enum Amenity { floodlights, changingRooms, scoreboard, matchReplay, rainProof, freeParking }

/// Semantic kind of a badge; the presentation layer decides how each looks.
enum ArenaTagType { highlight, certification, feature }

class ArenaTag {
  const ArenaTag(this.label, {this.type = ArenaTagType.feature});

  final String label;
  final ArenaTagType type;
}

class Arena {
  const Arena({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.pricePerHour,
    required this.rating,
    required this.reviewCount,
    required this.distanceMiles,
    required this.format,
    required this.dimensions,
    required this.studType,
    this.imageUrl,
    this.amenities = const [],
    this.tags = const [],
  });

  final String id;
  final String name;
  final String subtitle;
  final double pricePerHour;
  final double rating;
  final int reviewCount;
  final double distanceMiles;
  final String format;
  final String dimensions;
  final String studType;
  final String? imageUrl;
  final List<Amenity> amenities;
  final List<ArenaTag> tags;
}
