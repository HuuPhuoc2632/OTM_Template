import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:otm_template/constants/constants.dart';
import 'package:otm_template/utils/extension.dart';

export './app_data.dart';
export './app_type.dart';
export './check_connection.dart';
export './data_converter.dart';
export './local_cache.dart';
export './show_flushbar.dart';
export './show_loading_dialog.dart';
export './validation.dart';

String randomHash(List<String> strings) {
  return strings.join("====");
}

DateTime? parseDateTimeServer(String? data) {
  if (data == null) return null;
  try {
    DateTime res = DateFormat(Constants.dateTimeFormatServer).parse(data, true);
    if (data.endsWith(" PM")) {
      res = res.add(const Duration(hours: 12));
    }
    return res.toLocal();
  } catch (e) {}
  return DateTime.tryParse(data)?.toLocal();
}

// ignore: non_constant_identifier_names
Widget StatusWidget(
    {required Color color,
    required String title,
    Widget? icon,
    bool haveBorder = true}) {
  Widget item = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      if (icon != null) icon,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Text(
          title,
        ).labelSmall.setColor(color),
      ),
    ],
  );
  return haveBorder ? item.buildbBorderRadius(color: color) : item;
}
