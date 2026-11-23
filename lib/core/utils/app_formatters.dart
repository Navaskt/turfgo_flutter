abstract final class AppFormatters {
  static String price(double value, {String symbol = r'$'}) {
    final text = value == value.roundToDouble()
        ? value.toStringAsFixed(0)
        : value.toStringAsFixed(2);
    return '$symbol$text';
  }

  static String milesAway(double miles) => '${miles.toStringAsFixed(1)} miles away';

  static String milesShort(double miles) => '${miles.toStringAsFixed(1)} mi';
}
