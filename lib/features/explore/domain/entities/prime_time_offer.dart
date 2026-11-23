enum SlotStatus { available, filled }

class TimeSlot {
  const TimeSlot({
    required this.id,
    required this.timeRange,
    required this.pitchLabel,
    this.status = SlotStatus.available,
  });

  final String id;
  final String timeRange;
  final String pitchLabel;
  final SlotStatus status;

  bool get isAvailable => status == SlotStatus.available;
}

class PrimeTimeOffer {
  const PrimeTimeOffer({
    required this.arenaId,
    required this.arenaName,
    required this.slotNumber,
    required this.fromPricePerHour,
    required this.slotsLeft,
    required this.tagLabel,
    required this.whenLabel,
    required this.distanceMiles,
    required this.slots,
    this.imageUrl,
  });

  final String arenaId;
  final String arenaName;
  final int slotNumber;
  final double fromPricePerHour;
  final int slotsLeft;
  final String tagLabel;
  final String whenLabel;
  final double distanceMiles;
  final List<TimeSlot> slots;
  final String? imageUrl;

  TimeSlot? get firstAvailableSlot => slots.where((s) => s.isAvailable).firstOrNull;
}
