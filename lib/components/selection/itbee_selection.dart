import 'package:flutter/material.dart';
import 'package:otm_template/components/selection/itbee_checkbox.dart';
import 'package:otm_template/components/selection/itbee_radio.dart';
import 'package:otm_template/components/selection/itbee_switch.dart';

import '../index.dart';

// ignore: constant_identifier_names
enum TypeItbeeSelection { SWITCH, CHECKBOX, RADIO }

// ignore: must_be_immutable
class ItbeeSelection extends StatelessWidget {
  GestureTapCallback? onTap;
  bool? value;
  TypeItbeeSelection type;
  ItbeeSelection(
      {super.key,
      this.onTap,
      this.value,
      this.type = TypeItbeeSelection.CHECKBOX});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TypeItbeeSelection.RADIO:
        return ItbeeRadio(onTap: onTap, value: value);
      case TypeItbeeSelection.SWITCH:
        return ItbeeSwitch(onTap: onTap, value: value);
      default:
        return ItbeeCheckbox(onTap: onTap, value: value);
    }
  }
}
