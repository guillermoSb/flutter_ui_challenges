import 'package:intl/intl.dart';

extension DateTimeString on DateTime {
  get dayString {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));
    final tomorrow = today.add(const Duration(days: 1));
    if (day == today.day && month == today.month && year == today.year) {
      return 'Today';
    } else if (day == yesterday.day &&
        month == yesterday.month &&
        year == yesterday.year) {
      return 'Yesterday';
    } else if (day == tomorrow.day &&
        month == tomorrow.month &&
        year == tomorrow.year) {
      return 'Tomorrow';
    } else {
      final dateFormat = DateFormat('MMM D');
      return dateFormat.format(this);
    }
  }

  get hourString {
    final hourFormat = DateFormat('h:mm a');
    return hourFormat.format(this);
  }
}
