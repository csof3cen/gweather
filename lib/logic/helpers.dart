DateTime timestampToDateTime(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
