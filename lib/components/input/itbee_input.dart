import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otm_template/themes/index.dart';
import 'package:otm_template/utils/extension.dart';
import 'package:otm_template/utils/formatters/numeric_formatter.dart';
import 'package:ternav_icons/ternav_icons.dart';

// ignore: must_be_immutable
class ItbeeInput extends StatefulWidget {
  TextEditingController? textFieldController;
  String? hintText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? suffixText;
  String? prefixText;
  bool obscureText;
  String? labelText;
  String? errorText;
  String? defaultValue;
  String? Function(String?)? validator;
  EdgeInsetsGeometry? contentPadding;
  InputBorder? inputBorder;
  Function(String?)? onChanged;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  Color? fillColor;
  String? helperText;
  String? counterText;
  bool isRequired;
  Function(String)? onFieldSubmitted;
  TextInputAction? textInputAction;
  bool autofocus;
  bool isPassword;
  Function()? onClear;
  ItbeeInput({
    super.key,
    this.textFieldController,
    this.errorText,
    this.hintText,
    this.labelText,
    this.obscureText = false,
    this.defaultValue,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixText,
    this.prefixText,
    this.contentPadding,
    this.inputBorder,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.fillColor,
    this.helperText,
    this.counterText,
    this.isRequired = false,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autofocus = false,
    this.onClear,
    this.isPassword = false,
  });
  @override
  State<ItbeeInput> createState() => ItbeeInputState();
}

class ItbeeInputState extends State<ItbeeInput> {
  late final TextEditingController _controller;
  bool _isShowPassword = false;
  String text = "";

  @override
  void initState() {
    super.initState();
    _controller = widget.textFieldController ?? TextEditingController();
    _controller.addListener(() {
      setState(() {
        text = _controller.text;
      });
    });
    if (widget.defaultValue.isNotEmptyAndNull()) {
      _controller.text = widget.defaultValue ?? "";
    }
    if (widget.isPassword) {
      _isShowPassword = widget.obscureText;
    }
    setState(() {});
  }

  onChangeObscureText() {
    _isShowPassword = !_isShowPassword;
    setState(() {});
  }

  onClear() {
    _controller.text = "";
    widget.onClear?.call();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:
          widget.isPassword == true ? !_isShowPassword : widget.obscureText,
      controller: _controller,
      // style: const TextStyle(color: Colors.black, height: 1),
      onChanged: widget.onChanged,
      validator: (v) {
        if (widget.isRequired) {
          if (v.isEmptyOrNull()) return "Không được bỏ trống";
        }
        return widget.validator?.call(v);
      },
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      autofocus: widget.autofocus,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding: widget.contentPadding,
          // isDense: true,
          fillColor: widget.fillColor,
          filled: widget.fillColor != null,
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.labelText ?? "",
                style: Theme.of(context).inputDecorationTheme.labelStyle,
              ),
              if (widget.isRequired) ...[
                const Padding(
                  padding: EdgeInsets.all(2.0),
                ),
                Text('*',
                        style:
                            Theme.of(context).inputDecorationTheme.labelStyle)
                    .setColor(AppColors.redColor),
              ],
            ],
          ),
          // labelText: widget.labelText,

          hintText: widget.hintText ?? widget.labelText,
          errorText: widget.errorText,
          // errorStyle: TextStyle(fontSize: 13),
          focusedErrorBorder: widget.inputBorder,
          errorBorder: widget.inputBorder
              ?.copyWith(borderSide: const BorderSide(color: Colors.red)),
          // hintStyle: const TextStyle(
          //     color: AppColors.colorTextHint, fontWeight: FontWeight.w300),
          suffixIcon: (widget.isPassword && widget.suffixIcon == null)
              ? IconButton(
                  icon: Icon(
                    _isShowPassword
                        ? TernavIcons.lightOutline.eye
                        : TernavIcons.lightOutline.eye_slash,
                  ),
                  onPressed: onChangeObscureText)
              : widget.suffixIcon,
          prefixIcon: widget.isPassword
              ? Icon(TernavIcons.lightOutline.lock)
              : widget.prefixIcon,
          suffixText: widget.suffixText,
          suffix: widget.onClear != null && text.isNotEmptyAndNull()
              ? InkWell(
                  onTap: onClear,
                  child: Icon(
                    TernavIcons.lightOutline.close_square,
                  ))
              : null,
          prefixText: widget.prefixText,
          enabledBorder: widget.inputBorder,
          focusedBorder: widget.inputBorder,
          helperText: widget.helperText,
          counterText: widget.counterText),
    );
  }
}

extension ItbeeInputExtension on ItbeeInput {
  ItbeeInput get number {
    inputFormatters = <TextInputFormatter>[
      // for below version 2 use this
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
      FilteringTextInputFormatter.digitsOnly,
      ThousandsFormatter()
    ];
    keyboardType = TextInputType.number;
    return this;
  }

  ItbeeInput get phone {
    inputFormatters = <TextInputFormatter>[
      // for below version 2 use this
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
      FilteringTextInputFormatter.digitsOnly,
    ];
    keyboardType = TextInputType.number;
    prefixIcon = Icon(TernavIcons.lightOutline.mobile);

    return this;
  }

  ItbeeInput get currency {
    number.suffixIcon =
        const SizedBox(height: 12, width: 12, child: Center(child: Text("đ")));
    return this;
  }
}
