

import 'package:easy_localization/easy_localization.dart';
import 'package:otm_template/constants/constants.dart';

class Format {
  static String commonFormatCurrency(double value) {
    return NumberFormat(
      "#,### đ",
      "vi_VN",
    ).format(value);
  }

  static String commonFormatTimeDateMonthYear(DateTime date) {
    return DateFormat(Constants.timeDateMonthYearFormat).format(date);
  }

  static String commonFormatDateMonthYear(DateTime date) {
    return DateFormat(Constants.dateFormat).format(date);
  }
}
