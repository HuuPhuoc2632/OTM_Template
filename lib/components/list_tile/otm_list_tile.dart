import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

class OtmListTile extends StatelessWidget {
  const OtmListTile({
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
    //       otmIconButton(
    //         icon: leading,
    //       ),
    //       title,
    //       if (isShowForwordArrow) Icon(TernavIcons.lightOutline.arrow_right_1),
    //     ],
    //   ),
    // );
    return ListTile(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
      titleTextStyle: const TextStyle(
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
