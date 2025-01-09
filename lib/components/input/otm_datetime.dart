import 'package:flutter/material.dart';
import 'package:otm_template/components/index.dart';
import 'package:otm_template/utils/extension.dart';
import 'package:ternav_icons/ternav_icons.dart';

// ignore: must_be_immutable
class OtmDateTime extends StatefulWidget {
  TextEditingController? textFieldController;
  String? hintText;
  Widget? suffixIcon;
  bool obscureText;
  String? errorText;
  DateTime? defaultValue;
  EdgeInsetsGeometry? contentPadding;
  InputBorder? inputBorder;
  Function(DateTime?)? onChanged;
  Color? fillColor;
  String? labelText;
  bool isRequired;
  OtmDateTime(
      {super.key,
      this.textFieldController,
      this.errorText,
      this.hintText,
      this.obscureText = false,
      this.defaultValue,
      this.suffixIcon,
      this.contentPadding,
      this.inputBorder,
      this.onChanged,
      this.labelText,
      this.isRequired = false}) {
    suffixIcon ??= Icon(TernavIcons.lightOutline.calender);
  }

  @override
  State<OtmDateTime> createState() => _OtmDateTime();
}

class _OtmDateTime extends State<OtmDateTime> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.textFieldController ?? TextEditingController();
    if (widget.defaultValue != null) {
      controller.text = _formatDate(widget.defaultValue!);
    }
    // controller.text = widget.defaultValue ?? "";
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.defaultValue ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != widget.defaultValue) {
      setState(() {
        controller.text = picked.toLocal().toString().split(' ')[0];
        if (widget.onChanged != null) {
          widget.onChanged!(picked);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: OtmInput(
        textFieldController: controller,
        isRequired: widget.isRequired,
        labelText: widget.labelText,
        contentPadding: widget.contentPadding,
        fillColor: widget.fillColor,
        hintText: widget.hintText,
        errorText: widget.errorText,
        inputBorder: widget.inputBorder,
        suffixIcon: widget.suffixIcon,
      ).readonly(),
    );
  }
}
