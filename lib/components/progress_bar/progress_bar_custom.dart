import 'package:flutter/material.dart';
import 'package:otm_template/components/progress_bar/zigzag_progress_bar.dart';
import 'package:otm_template/themes/index.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;

  const CustomProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGreyColor,
          border: Border.all(
            color: AppColors.lightGreyColor,
            width: 0.3,
          ),
        ),
        height: 8, // Chiều cao của thanh tiến trình
        child: CustomPaint(
          painter: ZigzagProgressBarPainter(
            progress: progress,
            color1: AppColors.primaryColor, // Màu thứ nhất
            color2: AppColors.primaryColor, // Màu thứ hai
            segmentWidth: 5.0, // Độ rộng của mỗi đoạn màu
            // angle: -35.0,
          ),
          child: Container(),
        ),
      ),
    );
  }
}
