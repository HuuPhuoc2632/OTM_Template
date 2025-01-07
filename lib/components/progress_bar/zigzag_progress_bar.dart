import 'package:flutter/material.dart';
import 'dart:math';

class ZigzagProgressBarPainter extends CustomPainter {
  final double progress;
  final Color color1;
  final Color color2;
  final double segmentWidth;
  final double angle;

  ZigzagProgressBarPainter({
    required this.progress,
    required this.color1,
    required this.color2,
    this.segmentWidth = 10.0,
    this.angle = 15.0, // Góc nghiêng (độ)
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    double totalWidth = size.width * progress;
    double currentX = 0.0;
    bool useFirstColor = true;

    // Đổi góc nghiêng từ độ sang radian
    final radians = angle * pi / 180;

    while (currentX < totalWidth) {
      paint.color = useFirstColor ? color1 : color2;
      double nextX = currentX + segmentWidth;

      // Nếu đoạn tiếp theo vượt quá chiều dài thanh tiến trình, điều chỉnh lại
      if (nextX > totalWidth) {
        nextX = totalWidth;
      }

      // Tạo path cho hình chữ nhật nghiêng
      Path path = Path()
        ..moveTo(currentX, 0)
        ..lineTo(currentX + segmentWidth, 0)
        ..lineTo(currentX + segmentWidth - tan(radians) * size.height, size.height)
        ..lineTo(currentX - tan(radians) * size.height, size.height)
        ..close();

      canvas.drawPath(path, paint);

      // Chuyển đổi màu
      useFirstColor = !useFirstColor;
      currentX = nextX;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
