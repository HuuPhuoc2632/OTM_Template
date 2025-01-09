import 'package:flutter/material.dart';

import '../index.dart';

// ignore: constant_identifier_names
enum TypeOtmSelection { SWITCH, CHECKBOX, RADIO }

// ignore: must_be_immutable
class OtmSelection extends StatelessWidget {
  GestureTapCallback? onTap;
  bool? value;
  TypeOtmSelection type;
  OtmSelection(
      {super.key,
      this.onTap,
      this.value,
      this.type = TypeOtmSelection.CHECKBOX});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TypeOtmSelection.RADIO:
        return OtmRadio(onTap: onTap, value: value);
      case TypeOtmSelection.SWITCH:
        return OtmSwitch(onTap: onTap, value: value);
      default:
        return OtmCheckbox(onTap: onTap, value: value);
    }
  }
}
