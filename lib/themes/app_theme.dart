import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';
import 'package:otm_template/themes/app_colors.dart';
import 'package:otm_template/themes/button_theme.dart';
import 'package:otm_template/themes/checkbox_themedata.dart';
import 'package:otm_template/themes/input_decoration_theme.dart';
import 'package:otm_template/themes/theme_data.dart';
// import 'app_styles.dart';

class AppTheme {
  static ThemeData _theme = ThemeData();
  static ThemeData get theme {
    // OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    //   borderSide: const BorderSide(color: AppColors.blackColor80),
    //   borderRadius: BorderRadius.circular(12),
    // );
    ThemeData theme = _theme;
    return theme.copyWith(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.transparent,
      cardTheme: theme.cardTheme.copyWith(
        // elevation: 20,
        shadowColor: Colors.transparent,
        color: Colors.white,
        margin: EdgeInsets.zero,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.greyColor80,
            width: 0.3,
          ),
        ),
      ),
      colorScheme: theme.colorScheme.copyWith(
        primary: AppColors.primaryColor,
        surfaceTint: Colors.white,
        tertiaryContainer: Colors.white,
        surface: AppColors.primaryColor,
        // onBackground: Colors.white,
      ),
      dividerTheme: theme.dividerTheme
          .copyWith(color: AppColors.greyColor60, thickness: 1),
      iconTheme: const IconThemeData(color: AppColors.blackColor80),
      // textTheme: const TextTheme(
      //   bodyMedium: TextStyle(color: AppColors.blackColor80),
      //   labelMedium: TextStyle(color: AppColors.blackColor80),
      // ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 2, // elevation
        foregroundColor: AppColors.blackColor80, // the color of the icon
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: AppColors.blackColor40),
      ),
      appBarTheme: appBarLightTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
      // textTheme: _theme.textTheme.apply(fontSizeFactor: 1)
    );
  }

  static init() async {
    SchemaValidator.enabled = false;
    // final themeStr = await rootBundle.loadString('assets/theme.json');
    // final themeJson = jsonDecode(themeStr);
    _theme = ThemeData(
      // fontFamily: "Grandis Extended",
      primarySwatch: AppColors.primaryMaterialColor,
    );
    // ThemeDecoder.decodeThemeData(themeJson)!;
  }
}
