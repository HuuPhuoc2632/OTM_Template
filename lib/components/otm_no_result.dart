import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:otm_template/themes/index.dart';

class OtmNoResult extends StatelessWidget {
  final String text;
  final bool? isEnableScroll;
  final Widget? emptyImageWidget;
  final TextStyle? textStyle;
  final Color? color;
  const OtmNoResult({
    super.key,
    this.text = "Not found",
    this.isEnableScroll = true,
    this.emptyImageWidget,
    this.textStyle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      color: color,
      child: Stack(
        children: [
          Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  emptyImageWidget ??
                      Image.asset(
                        Images.notFound,
                        height: 280,
                        fit: BoxFit.fitHeight,
                      ),
                  Text(
                    "Không có dữ liệu",
                    style: textStyle ??
                        const TextStyle().copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
