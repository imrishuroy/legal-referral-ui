extension StringExtension on String {
  String get capitalized {
    if (isEmpty) return this; // Return the string itself if empty
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
