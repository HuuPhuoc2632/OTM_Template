import 'package:flutter/material.dart';
import 'package:otm_template/components/index.dart';
import 'package:otm_template/constants/constants.dart';
import 'package:otm_template/main.dart';
import 'package:otm_template/themes/app_colors.dart';
import 'package:otm_template/utils/extension.dart';

// ignore: must_be_immutable
class OtmSelectListTile<T> extends StatelessWidget {
  @override
  // ignore: overridden_fields
  Key? key;
  List<T> data;
  Widget? leading;
  String title;
  String? hideText;
  String? subtitle;
  bool isRequire;
  Widget? trailing;
  ShapeBorder? shape;
  void Function()? onTap;
  String Function(T?) valueToString;
  dynamic Function(dynamic) onSelected;
  T? itemSelected;
  bool enableSearch;
  Widget Function(BuildContext, dynamic, String)? itemBuilder;

  // Color? bacgroid;
  OtmSelectListTile(
      {super.key,
      required this.data,
      this.leading,
      required this.title,
      required this.valueToString,
      required this.onSelected,
      this.subtitle,
      this.trailing,
      this.onTap,
      this.shape,
      this.hideText,
      this.isRequire = true,
      this.itemSelected,
      this.enableSearch = false,
      this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChooseAttr(
          title: title,
          list: data,
          valueToString: valueToString,
          onSelected: onSelected,
          itemSelected: itemSelected),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title),
                        const SizedBox(height: 5),
                        Text(
                            subtitle.isNotEmptyAndNull()
                                ? subtitle!
                                : hideText ?? "Chưa chọn",
                            style: TextStyle(
                                color: subtitle.isNotEmptyAndNull()
                                    ? AppColors.primaryColor
                                    : isRequire
                                        ? AppColors.errorColor
                                        : AppColors.greyColor80,
                                fontWeight: subtitle.isNotEmptyAndNull()
                                    ? FontWeight.bold
                                    : FontWeight.normal)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: AppColors.greyColor80,
            ),
          ],
        ),
      ),
    );
  }

  // ignore: avoid_shadowing_type_parameters
  Future<void> onChooseAttr<T>(
      {required List<T> list,
      required String Function(T?) valueToString,
      required dynamic Function(dynamic) onSelected,
      required String title,
      T? itemSelected}) async {
    FocusScope.of(navKey.currentContext!)
        .requestFocus(FocusNode()); //remove focus
    await OtmDialog.showBottomSheet(
        context: navKey.currentContext!,
        content: OtmSelectBottomSheet<T>(
            showIconCheck: itemBuilder == null,
            data: list,
            itemBuilder: (c, value, textSearch) {
              return itemBuilder != null
                  ? itemBuilder!(c, value, textSearch)
                  : OtmTextHighlighting(
                      text: valueToString(value),
                      caseSensitive: false,
                      useRegExp: true,
                      textSearch: textSearch,
                    );
            },
            title: title,
            labelTextSearch: title,
            onSelected: onSelected,
            itemSelected: itemSelected,
            fnSearch: enableSearch
                ? (value, textSearch) {
                    return valueToString(value)
                        .toLowerCase()
                        .contains(textSearch.toLowerCase());
                  }
                : null));
  }
}
