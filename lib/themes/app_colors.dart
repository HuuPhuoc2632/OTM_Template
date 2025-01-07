// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF0d93b2b); // 255 149 1

  static MaterialColor primaryMaterialColor =
      MaterialColor(0xFF9581FF, <int, Color>{
    50: Color(0xFFEFECFF),
    100: primaryColor.withAlpha(100),
    200: primaryColor.withAlpha(200),
    300: primaryColor.withAlpha(300),
    400: primaryColor.withAlpha(400),
    500: primaryColor.withAlpha(500),
    600: primaryColor.withAlpha(600),
    700: primaryColor.withAlpha(700),
    800: primaryColor.withAlpha(800),
    900: primaryColor,
  });

  static LinearGradient primaryLinearGradient = LinearGradient(
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    colors: [
      AppColors.primaryColor.withValues(alpha:0.8),
      AppColors.primaryColor.withValues(alpha:0.1),
    ],
  );
  static LinearGradient levelLinearGradient(
          [Color color = AppColors.primaryColor]) =>
      LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          color.withValues(alpha:0.1),
          color.withValues(alpha:0.8),
        ],
      );

  static const Color blackColor = Color(0xFF16161E);
  static const Color blackColor80 = Color(0xFF45454B);
  static const Color blackColor60 = Color(0xFF737378);
  static const Color blackColor40 = Color(0xFFA2A2A5);
  static const Color blackColor20 = Color(0xFFD0D0D2);
  static const Color blackColor10 = Color(0xFFE8E8E9);
  static const Color blackColor5 = Color(0xFFF3F3F4);

  static const Color whiteColor = Colors.white;
  static const Color whiteColor80 = Color(0xFFCCCCCC);
  static const Color whiteColor60 = Color(0xFF999999);
  static const Color whiteColor40 = Color(0xFF666666);
  static const Color whiteColor20 = Color(0xFF333333);
  static const Color whiteColor10 = Color(0xFF191919);
  static const Color whiteColor5 = Color(0xFF0D0D0D);

  static const Color greyColor = Color(0xFFB8B5C3);
  static const Color lightGreyColor = Color(0xFFF8F8F9);
  static const Color darkGreyColor = Color(0xFF1C1C25);
  static const Color greyColor80 = Color(0xFFC6C4CF);
  static const Color greyColor60 = Color(0xFFD4D3DB);
  static const Color greyColor40 = Color(0xFFE3E1E7);
  static const Color greyColor20 = Color(0xFFF1F0F3);
  static const Color greyColor10 = Color(0xFFF8F8F9);
  static const Color greyColor5 = Color(0xFFFBFBFC);

  static const Color redColor = Color(0xFFEA5B5B);

  static const Color purpleColor = Color(0xFF7B61FF);
  static const Color successColor = Color(0xFF2ED573);
  static const Color warningColor = Color(0xFFFFBE21);
  static const Color errorColor = Color(0xFFEA5B5B);
  static const Color secondaryColor = Color(0xFF2AA7AA);

  //   //Copper
  static const Color copperColor = Color.fromARGB(255, 205, 128, 57);
  //Silver
  static const Color silverColor = Color.fromARGB(255, 200, 192, 192);
  //Gold
  static const Color goldColor = Color(0xffFFD700);
  //Orrange
  static const Color orangeColor = Color(0xffFFA500);
  // Blue
  static const Color blueColor = Color(0xff0000FF);
  //Green
  static const Color green = Color(0xff008000);
  //Red
  static const Color red = Color(0xffFF0000);

}
