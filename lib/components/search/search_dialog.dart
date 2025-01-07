import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:otm_template/components/index.dart';
import 'package:otm_template/themes/app_colors.dart';
import 'package:otm_template/utils/extension.dart';
import 'package:ternav_icons/ternav_icons.dart';

class SearchDialog extends StatefulWidget {
  final List<String>? history;
  final Function(String)? onDeleteHistory;
  const SearchDialog({super.key, this.history, this.onDeleteHistory});

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  String search = "";
  List<String> history = [];
  List<String> historyFilter = [];

  @override
  void initState() {
    super.initState();
    history = widget.history ?? [];
    historyFilter = history;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, null);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Tìm kiếm",
            style: const TextStyle(color: AppColors.blackColor),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: AppColors.whiteColor,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 35,
                    child: ItbeeInput(
                      autofocus: true,
                      textInputAction: TextInputAction.search,
                      inputBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.greyColor80),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      hintText: "Tìm kiếm",
                      onFieldSubmitted: (value) {
                        onSearch(context, value);
                      },
                      onChanged: (p0) {
                        setState(() {
                          search = p0!;
                          if (search.isEmpty) {
                            historyFilter = history;
                          } else {
                            historyFilter = history
                                .where((element) => element.contains(search))
                                .toList();
                          }
                        });
                      },
                      contentPadding:
                          const EdgeInsets.only(left: 16, right: 16),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          onSearch(
                            context,
                            search,
                          );
                        },
                        child: Icon(
                          TernavIcons.lightOutline.search,
                          color: AppColors.blackColor80,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildHistorySearch(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildHistorySearch() {
    return Expanded(
      child: ListView.builder(
          itemCount: historyFilter.length,
          itemBuilder: (context, index) {
            return historyItem(historyFilter[index]);
          }),
    );
  }

  historyItem(String item) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                onSearch(context, item);
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    TernavIcons.lightOutline.clock,
                    color: AppColors.blackColor80,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    item,
                    style: const TextStyle(
                      color: AppColors.blackColor80,
                    ),
                  ).labelTitle,
                ],
              ),
            ),
          ),
          if (widget.onDeleteHistory != null)
            IconButton(
              onPressed: () {
                historyFilter.remove(item);
                widget.onDeleteHistory!(item);
                setState(() {});
              },
              icon: Icon(
                TernavIcons.lightOutline.close_square,
                color: AppColors.blackColor80,
                size: 16,
              ),
            )
        ],
      ),
    );
  }
}

void onSearch(BuildContext context, String search) {
  Navigator.pop(context, search);
}
