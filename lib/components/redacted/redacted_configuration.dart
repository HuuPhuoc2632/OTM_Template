import 'package:flutter/material.dart';

class RedactedConfiguration {
  Color? redactedColor;
  Duration animationDuration;
  BorderRadius? defaultBorderRadius;

  RedactedConfiguration({
    this.animationDuration = const Duration(milliseconds: 800),
    this.defaultBorderRadius,
    this.redactedColor,
  });
}
