import 'package:flutter/material.dart';
import 'package:otm_template/constants/constants.dart';
import 'package:otm_template/themes/app_colors.dart';
import 'package:otm_template/utils/extension.dart';

export 'button/index.dart';
export 'input/index.dart';
export 'itbee_dialog.dart';
export 'itbee_list_view.dart';
export 'itbee_no_result.dart';
export 'itbee_quantity_button.dart';
export 'itbee_spinner.dart';
export 'itbee_text_hightlight.dart';
export 'select/index.dart';
export 'selection/index.dart';

class ItbeeCardTitle extends StatelessWidget {
  const ItbeeCardTitle({
    super.key,
    required this.title,
    this.toUpperCase,
    this.isCenter = false,
    this.color,
    required this.child,
  });
  final String title;
  final Color? color;
  final Widget child;
  final bool? toUpperCase;
  final bool isCenter;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Align(
                alignment: isCenter ? Alignment.center : Alignment.centerLeft,
                child: Text(
                  (toUpperCase ?? false) ? title.toUpperCase() : title,
                  style: const TextStyle().copyWith(
                      ),
                ).labelTitle.setColor(color??AppColors.primaryColor),
              ),
            child
        ],
      ),
    );
  }
}
