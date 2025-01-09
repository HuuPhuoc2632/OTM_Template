import 'package:flutter/material.dart';
import 'package:otm_template/utils/extension.dart';

// ignore: must_be_immutable
class OtmRadio extends StatelessWidget {
  GestureTapCallback? onTap;
  bool? value;
  // Color? bacgroid;
  OtmRadio({
    super.key,
    this.onTap,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Transform.scale(
            scale: 1,
            child: Radio<bool>(
              value: value ?? false,
              onChanged: (bool? value) {},
              groupValue: true,
            )).readonly());
  }
}
