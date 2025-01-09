// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:otm_template/utils/currency_util.dart';
import 'package:otm_template/utils/debounce.dart';
import 'package:otm_template/utils/string.dart';
import 'package:otm_template/utils/uuid.dart';
import 'package:ternav_icons/ternav_icons.dart';


// ignore: must_be_immutable
class OtmTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  final String text;
  final Color? color;
  OtmTextButton({
    super.key,
    this.onPressed,
    this.icon,
    this.color,
    required this.text,
  });

  String tag = generateUuid();
  _onPressed() {
    if (onPressed != null) {
      runDebounce(tag, () {
        onPressed?.call();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? TextButton.icon(
            onPressed: _onPressed,
            icon: Icon(icon, color: color),
            label: Text(text, style: TextStyle(color: color)))
        : TextButton(
            onPressed: _onPressed,
            child: Text(text, style: TextStyle(color: color)));
  }
}

class TextButtonAdd extends StatelessWidget {
  final VoidCallback? onPressed;
  const TextButtonAdd({
    super.key,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return OtmTextButton(
      icon: TernavIcons.lightOutline.plus,
      onPressed: onPressed,
      text: "Thêm",
    );
  }
}
