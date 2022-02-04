import 'package:intl/intl.dart';

class Utils {
  static String formatDate(DateTime date, String format) {
    DateFormat formatter = DateFormat(format);
    return formatter.format(date);
  }

  static stringToDouble(String? string) {
    final value = double.parse(string!);
    return value;
  }
}
