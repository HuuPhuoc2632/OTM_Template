import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

class ItbeeListTile extends StatelessWidget {
  const ItbeeListTile({
    super.key,
    this.isShowForwordArrow = true,
    required this.title,
    required this.onPressed,
    this.leading,
    this.minLeadingWidth,
    this.isShowDivider = true,
  });
  final bool isShowForwordArrow, isShowDivider;
  final Widget title;
  final Icon? leading;
  final double? minLeadingWidth;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // return TextButton(
    //   onPressed: onPressed,
    //   style: ButtonStyle(
    //       foregroundColor:
    //           MaterialStateProperty.all<Color>(AppColors.blackColor)),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       ItbeeIconButton(
    //         icon: leading,
    //       ),
    //       title,
    //       if (isShowForwordArrow) Icon(TernavIcons.lightOutline.arrow_right_1),
    //     ],
    //   ),
    // );
    return ListTile(
      visualDensity: VisualDensity(horizontal: 0, vertical: -2),
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
      minLeadingWidth: minLeadingWidth,
      leading: leading,
      onTap: onPressed,
      title: title,
      trailing: isShowForwordArrow
          ? Icon(TernavIcons.lightOutline.arrow_right_1)
          : null,
    );
  }
}
