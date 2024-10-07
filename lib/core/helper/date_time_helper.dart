import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:oberi_mobile/core/extensions/date_extension.dart';

/* Created by
   Nanda K Permana
   04/11/2022
*/

class DateTimeHelper {
  static String dateToSentence(DateTime date) {
    if (date.inThisHours()) {
      int intDateTime = date.difference(DateTime.now()).inMinutes;
      if (intDateTime <= 0) {
        return 'txt_expired'.tr;
      } else {
        return '$intDateTime ${'txt_minutes'.tr}';
      }
    } else if (date.isToday()) {
      return '${date.difference(DateTime.now()).inHours} ${'txt_hours'.tr}';
    } else if (date.inNextWeek()) {
      return '${date.difference(DateTime.now()).inDays + 1} ${'txt_days'.tr}';
    } else if (date.isBefore(DateTime.now())) {
      return 'Expired';
    } else if (date.inThisYear()) {
      return DateFormat('dd MMM').format(date);
    } else {
      return DateFormat('dd/MM/y').format(date);
    }
  }
}
