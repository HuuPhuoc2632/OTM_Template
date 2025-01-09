import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:otm_template/components/index.dart';
import 'package:otm_template/constants/constants.dart';
import 'package:otm_template/router/router.dart';
import 'package:otm_template/themes/app_colors.dart';
import 'package:otm_template/utils/extension.dart';
import 'package:ternav_icons/ternav_icons.dart';

class OtmSelectBottomSheet<T> extends StatefulWidget {
  const OtmSelectBottomSheet(
      {super.key,
      required this.onSelected,
      this.itemSelected,
      this.data,
      required this.itemBuilder,
      this.fnSearch,
      this.title = "Choose",
      this.labelTextSearch,
      this.textConfirm = "Xác nhận",
      this.isMultiple = false,
      this.showIconCheck = true});
  final String textConfirm;
  final dynamic itemSelected;
  final Function(dynamic value) onSelected;
  final List<T>? data;
  final Widget Function(BuildContext, T item, String textSearch) itemBuilder;
  final bool Function(T item, String textSearch)? fnSearch;
  final String title;
  final String? labelTextSearch;
  final bool isMultiple;
  final bool showIconCheck;

  @override
  State<OtmSelectBottomSheet<T>> createState() =>
      _OtmSelectBottomSheetState<T>();
}

class _OtmSelectBottomSheetState<T> extends State<OtmSelectBottomSheet<T>> {
  late List<T>? _listData;
  dynamic itemSelected;
  late TextEditingController _controller;
  String searchText = "";
  @override
  void initState() {
    itemSelected = widget.isMultiple
        ? (widget.itemSelected is T
            ? [widget.itemSelected]
            : widget.itemSelected)
        : widget.itemSelected;
    _controller = TextEditingController();
    _loadData();
    _controller.addListener(() {
      setState(() {
        searchText = _controller.text;
      });
    });

    super.initState();
  }

  _onSelected(T item) {
    if (widget.isMultiple) {
      itemSelected ??= <T>[];
      if ((itemSelected as List).contains(item)) {
        (itemSelected as List).remove(item);
      } else {
        (itemSelected as List).add(item);
      }
    } else {
      itemSelected = item;
    }
    setState(() {});
  }

  _loadData() async {
    _listData = widget.data;
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          // shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.titleMedium!.bold,
                )
              ]),
            ),
            if (widget.fnSearch != null)
              Padding(
                padding: const EdgeInsets.only(bottom: defaultPadding),
                child: SizedBox(
                  height: 40,
                  // decoration:
                  //     BoxDecoration(boxShadow: Component.shadow.widgetShadow),

                  child: OtmInput(
                      onChanged: (p0) => {
                            setState(() {
                              searchText = p0 ?? "";
                            })
                          },
                      prefixIcon: Icon(TernavIcons.lightOutline.search),
                      labelText: widget.labelTextSearch ?? widget.title,
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.greyColor),
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
              ),
            _buildBody(),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Expanded(
                      child: OtmButton(
                          text: widget.textConfirm.tr(),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            widget.onSelected(itemSelected);
                            AppRouter.goBack();
                          })),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildItem(BuildContext context, T item, String textSearch) {
    if (widget.showIconCheck) {
      return widget.itemBuilder(context, item!, searchText);
    } else {
      bool isChecked = widget.isMultiple
          ? ((itemSelected as List?)?.contains(item) ?? false)
          : itemSelected == item;
      return Card(
          shape: isChecked
              ? RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.primaryColor, width: 2.0),
                  borderRadius: BorderRadius.circular(defaultBorderRadious))
              : null,
          child: widget.itemBuilder(context, item!, searchText));
    }
  }

  Widget _buildBody() {
    List<T>? list = _listData?.toList();
    if (widget.fnSearch != null) {
      list = _listData
          ?.where((element) => widget.fnSearch!(element, searchText))
          .toList();
    }
    return list == null
        ? const OtmSpinner()
        : list.isEmpty
            ? const OtmNoResult()
            : ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 35,
                  maxHeight: MediaQuery.of(context).viewInsets.bottom == 0
                      ? MediaQuery.sizeOf(context).height * .7
                      : MediaQuery.sizeOf(context).height * .3,
                ),
                child: OtmListView(
                  separatorBuilder: (c, i) => SizedBox(
                    height: widget.showIconCheck ? 0 : 8,
                  ),
                  shrinkwrap: true,
                  children: list
                      .map((item) => InkWell(
                            // behavior: HitTestBehavior.opaque,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              _onSelected(item);
                              setState(() {});
                            },
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child:
                                      _buildItem(context, item!, searchText),
                                ),
                                if (widget.showIconCheck)
                                  widget.isMultiple
                                      ? OtmCheckbox(
                                          value: (itemSelected as List?)
                                                  ?.contains(item) ??
                                              false,
                                        ).readonly()
                                      : OtmRadio(
                                          value: itemSelected == item,
                                        ).readonly(),
                              ],
                            ),
                          ))
                      .toList(),
                )
                // ListView.separated(
                //   shrinkWrap: true,
                //   itemBuilder: (context, index) {
                //     var item = list![index];

                //   },
                //   separatorBuilder: (context, index) => Divider(
                //     thickness: 0.5,
                //     height: 1,
                //   ),
                //   itemCount: list.length,
                // ),
                );
  }
}
