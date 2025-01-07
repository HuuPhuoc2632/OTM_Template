import 'package:flutter/material.dart';
import 'package:otm_template/utils/extension.dart';

// ignore: must_be_immutable
class ItbeeSwitch extends StatelessWidget {
  GestureTapCallback? onTap;
  bool? value;
  // Color? bacgroid;
  ItbeeSwitch({
    super.key,
    this.onTap,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 40,
        height: 25,
        child: Transform.scale(
            scale: 0.6,
            child: Switch(
              value: value ?? false,
              onChanged: (bool? value) {},
            ).readonly()),
      ),
    );
  }
}
