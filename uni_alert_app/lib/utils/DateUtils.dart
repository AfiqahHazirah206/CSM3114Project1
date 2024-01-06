//Afiqah Hazirah Binti Osman S63609
//To format dates and times
//This uses the intl package for date formatting

import 'package:intl/intl.dart';

class DateUtils {
  static String formatTime(DateTime time) {
    return DateFormat('h:mm a').format(time); // Format: 12:00 PM
  }

  static String formatDate(DateTime date) {
    return DateFormat('MMM d, y').format(date); // Format: Jan 1, 2023
  }

  static String formatDateTime(DateTime dateTime) {
    return DateFormat('MMM d, y h:mm a')
        .format(dateTime); // Format: Jan 1, 2023 12:00 PM
  }
}
