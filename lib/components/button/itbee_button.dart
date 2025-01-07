// ignore_for_file: must_be_immutable, empty_constructor_bodies, no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:otm_template/themes/app_colors.dart';
class ItbeeButton extends StatelessWidget {
  String text;
  VoidCallback? onPressed;
  double? height;
  double? width;
  OutlinedBorder? shape;
  Color? color;
  TextStyle? textStyle;
  bool isOutline;
  Gradient? gradient;
  IconData? icon;
  Decoration? decoration;
  Widget? iconImage;
  Widget? child;
  ItbeeButton(
      {super.key, required this.text,
      this.onPressed,
      this.height,
      this.width,
      this.color,
      this.shape,
      this.textStyle,
      this.isOutline = false,
      this.gradient,
      this.icon,
      this.decoration,
      this.iconImage,
      this.child}) {}

  int? currentTimeClick;
  _onPressed() {
    if (onPressed != null) {
      final now = DateTime.now().millisecondsSinceEpoch;
      if (currentTimeClick == null || (now - currentTimeClick! > 1000)) {
        currentTimeClick = now;
        onPressed?.call();
      }
    }
  }

  buildElevatedButton() {
    var _style = gradient != null
        ? ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: shape,
          )
        : ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            shape: shape,
            backgroundColor: color);
    var _text;
    if (child == null) {
      _text = Text(text, style: textStyle, textAlign: TextAlign.center);
    } else {
      _text = child;
    }
    if (icon != null) {
      return ElevatedButton.icon(
        style: _style,
        onPressed: _onPressed,
        icon: Icon(
          icon,
          color: color,
        ),
        label: _text,
      );
    }
    if (iconImage != null) {
      return ElevatedButton.icon(
        style: _style,
        onPressed: _onPressed,
        icon: iconImage!,
        label: _text,
      );
    }
    return ElevatedButton(
      style: _style,
      onPressed: _onPressed,
      child: _text,
    );
  }

  buildOutlinedButton() {
    var _style = gradient != null
        ? OutlinedButton.styleFrom(
            foregroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: shape,
          )
        : OutlinedButton.styleFrom(
            shadowColor: Colors.transparent,
            shape: shape,
            foregroundColor: color);
    var _text;
    if (child == null) {
      _text = Text(text, style: textStyle, textAlign: TextAlign.center);
    } else {
      _text = child;
    }
    if (icon != null) {
      return OutlinedButton.icon(
        style: _style,
        onPressed: _onPressed,
        icon: Icon(
          icon,
          color: color,
        ),
        label: _text,
      );
    }
    if (iconImage != null) {
      return ElevatedButton.icon(
        style: _style,
        onPressed: _onPressed,
        icon: iconImage!,
        label: _text,
      );
    }
    return OutlinedButton(
      style: _style,
      onPressed: _onPressed,
      child: _text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration,
      child: isOutline ? buildOutlinedButton() : buildElevatedButton(),
    );
  }
}

class ItbeeIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final Icon? icon;
  const ItbeeIconButton({super.key, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      mini: true,
      elevation: 0,
      backgroundColor: AppColors.blackColor5,
      onPressed: onPressed,
      child: icon,
    );
  }
}
