import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:otm_template/components/search/search_dialog.dart';
import 'package:otm_template/constants/constants.dart';
import 'package:otm_template/themes/app_colors.dart';
import 'package:ternav_icons/ternav_icons.dart';

class SearchBarWidget extends StatefulWidget {
  final List<String>? history;
  final String defaultSearch;
  final Function(String) onSearchCompleted;
  final Function(String)? onDeleteHistory;
  const SearchBarWidget(
      {super.key,
      required this.onSearchCompleted,
      this.defaultSearch = "",
      this.history,
      this.onDeleteHistory});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.greyColor80),
    borderRadius: BorderRadius.circular(Constants.borderRadiusButton),
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final searchResult = await Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                SearchDialog(
              history: widget.history,
              onDeleteHistory: widget.onDeleteHistory,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              var offsetAnimation = animation.drive(tween);

              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
          ),
        );
        if (searchResult != null) {
          widget.onSearchCompleted(searchResult);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SizedBox(
            height: 38,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Constants.borderRadiusButton),
                border: Border.all(color: AppColors.blackColor5),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Icon(
                    TernavIcons.lightOutline.search,
                    color: AppColors.blackColor80,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.defaultSearch.isEmpty
                        ? "Tìm kiếm"
                        : widget.defaultSearch,
                    style: const TextStyle(color: AppColors.blackColor80),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
