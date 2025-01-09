import 'package:flutter/material.dart';
import 'package:otm_template/themes/index.dart';

class OtmSpinner extends StatelessWidget {
  final double? height;
  final double? width;
  const OtmSpinner({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
