import 'package:flutter/material.dart';
import 'package:otm_template/components/input/itbee_input.dart';
import 'package:otm_template/components/itbee_dialog.dart';
import 'package:otm_template/components/itbee_spinner.dart';
import 'package:otm_template/components/itbee_text_hightlight.dart';
import 'package:otm_template/components/select/itbee_select_bottom_sheet.dart';
import 'package:otm_template/utils/extension.dart';
import 'package:ternav_icons/ternav_icons.dart';

class ItbeeSelectData<T> extends StatefulWidget {
  const ItbeeSelectData(
      {super.key,
      required this.onSelected,
      this.itemSelected,
      this.builderItem,
      required this.valueToString,
      this.readOnly = false,
      this.fnSearch,
      this.hintText,
      this.labelText,
      required this.data,
      this.validator,
      this.haveSearch = false,
      this.isMultiple = false,
      this.isRequired = false});
  final String? hintText;
  final String? labelText;
  final String? Function(String?)? validator;
  final bool Function(T, String)? fnSearch;
  final List<T> data;
  final dynamic itemSelected;
  final Function(dynamic value) onSelected;
  final bool readOnly;
  final bool haveSearch;
  final Widget Function(BuildContext, T?, String?)? builderItem;
  final String Function(T?) valueToString;
  final bool isMultiple;
  final bool isRequired;

  @override
  State<ItbeeSelectData<T>> createState() => _ItbeeSelectDataState<T>();
}

class _ItbeeSelectDataState<T> extends State<ItbeeSelectData<T>> {
  dynamic selected;
  TextEditingController? textFieldController;
  List<T> data = [];
  @override
  void initState() {
    loadData();

    super.initState();
  }

  reset() {}

  @override
  void dispose() {
    super.dispose();
  }

  String get stringValue {
    if (data.isNotEmpty) {
      if (selected == null) return "";
      if (widget.isMultiple) {
        return (selected as List<T>)
            .map((e) => widget.valueToString(e))
            .toList()
            .join(", ");
      }
      return widget.valueToString(selected);
    }
    return "";
  }

  @override
  void didUpdateWidget(dynamic oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.itemSelected != oldWidget?.itemSelected) {
      selected = widget.itemSelected;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        textFieldController!.text = stringValue;
        setState(() {});
      });
    }

    if (widget.data != oldWidget?.data) {
      data = widget.data;
      setState(() {});

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (data.isEmpty) {
          textFieldController!.text = "";
        } else {
          textFieldController!.text =
              selected == null ? "" : widget.valueToString(selected);
        }

        setState(() {});
      });
    }
  }

  onSelected(dynamic item) {
    selected = item;
    widget.onSelected(item!);
    textFieldController!.text = stringValue;
    setState(() {});
  }

  loadData() async {
    data = widget.data;
    selected = widget.itemSelected;
    textFieldController = TextEditingController(text: stringValue);
    setState(() {});
  }

  Widget buildTitle(BuildContext context, T item, String? textSearch) {
    return ItbeeTextHighlighting(
      text: widget.valueToString(item),
      caseSensitive: false,
      useRegExp: true,
      textSearch: textSearch,
    );
  }

  bool onFilterByKeyword(T item, String searchText) {
    var keyword = searchText.removeUTF8Character();
    var keywordList = keyword.trim().split(" ");
    // remove utf8 character
    var name = widget.valueToString(item).removeUTF8Character();
    bool isContain = true;
    for (var element in keywordList) {
      if (!name.contains(element)) {
        isContain = false;
      }
    }

    return isContain;
  }

  showBottomSheet() async {
    // textFieldController!.text = "XXXX";
    // setState(() {});

    if (widget.readOnly) return;
    FocusScope.of(context).requestFocus(FocusNode()); //remove focus
    final selectedItems = widget.isMultiple ? (selected ?? <T>[]) : selected;
    await ItbeeDialog.showBottomSheet(
      context: context,
      content: ItbeeSelectBottomSheet<T>(
          isMultiple: widget.isMultiple,
          data: data,
          itemSelected: selectedItems,
          itemBuilder: widget.builderItem ?? buildTitle,
          fnSearch: !widget.haveSearch
              ? null
              : (widget.fnSearch ?? onFilterByKeyword),
          title: widget.labelText ?? "Choose",
          labelTextSearch: widget.hintText,
          onSelected: onSelected),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textFieldController == null
        ? const ItbeeSpinner()
        : InkWell(
            onTap: showBottomSheet,
            child: ItbeeInput(
              isRequired: widget.isRequired,
              validator: widget.validator,
              textFieldController: textFieldController,
              defaultValue: stringValue,
              hintText: widget.hintText ?? widget.labelText ?? "Choose",
              labelText: widget.labelText,
              suffixIcon: Icon(TernavIcons.lightOutline.arrow_right_1),
            ).readonly(),
          );
  }
}
