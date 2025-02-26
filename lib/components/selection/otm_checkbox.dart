import 'package:flutter/material.dart';
import 'package:otm_template/utils/extension.dart';

// ignore: must_be_immutable
class OtmCheckbox extends StatelessWidget {
  GestureTapCallback? onTap;
  bool? value;
  OtmCheckbox({super.key, this.onTap, this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Transform.scale(
        scale: 1,
        child: Checkbox(
          value: value,
          onChanged: (bool? value) {},
        ).readonly(),
      ),
    );
  }
}
