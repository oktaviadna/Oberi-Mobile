/* Created by
   Nanda K Permana
   04/11/2022
*/

import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String format([String format = 'dd MMM yyyy']) =>
      DateFormat(format, "id").format(this);

  /// This to fix date given is UTC but not in UTC format and will
  /// return local date.
  /// Example :
  /// Date given is 01.00 but not UTC format,
  /// If your timezone is WIB/GMT+7, it will return 08.00
  ///
  /// *Note*: automatically convert to your Local Date
  DateTime fixUtcFormat() {
    if (!isUtc) {
      final serverDate = DateFormat().format(this);
      return DateFormat().parse(serverDate, true).toLocal();
    }
    return this;
  }

  bool inThisHours() {
    final now = DateTime.now();
    return now.hour == hour &&
        now.day == day &&
        now.month == month &&
        now.year == year;
  }

  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isTomorrow() {
    final yesterday = DateTime.now().add(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  bool inNextWeek() {
    final weekAgo = DateTime.now().add(const Duration(days: 7));
    return isBefore(weekAgo) && isAfter(DateTime.now());
  }

  bool inThisYear() {
    return year == DateTime.now().year;
  }

  bool isSameDay(DateTime? input) {
    return (day == input?.day) &&
        (month == input?.month) &&
        (year == input?.year);
  }

  bool inLastWeek() {
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return isAfter(weekAgo);
  }
}
