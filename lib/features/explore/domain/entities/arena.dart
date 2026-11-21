class Arena {
  const Arena({
    required this.name,
    required this.price,
    required this.pitchType,
    required this.format,
    required this.dimensions,
    required this.turf,
    required this.rating,
    required this.distance,
    required this.facilities,
    required this.indoor,
    this.tag = 'FAST BOOKING',
  });

  final String name;
  final int price;
  final String pitchType;
  final String format;
  final String dimensions;
  final String turf;
  final String rating;
  final String distance;
  final List<String> facilities;
  final bool indoor;
  final String tag;
}
