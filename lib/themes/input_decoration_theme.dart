import 'package:flutter/material.dart';
import 'package:otm_template/constants/constants.dart';
import 'package:otm_template/themes/app_colors.dart';

const InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    fillColor: AppColors.lightGreyColor,
    filled: true,
    hintStyle: TextStyle(color: AppColors.greyColor),
    border: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: focusedOutlineInputBorder,
    errorBorder: errorOutlineInputBorder,
    contentPadding: EdgeInsets.symmetric(
        vertical: 8, horizontal: 8), //Change this value to custom as you like
    suffixIconColor: AppColors.greyColor80,
    prefixIconColor: AppColors.greyColor80,
    suffixStyle: TextStyle(color: AppColors.greyColor80),
    prefixStyle: TextStyle(color: AppColors.greyColor80),
    labelStyle: TextStyle(color: Colors.black)
    // suffixStyle: const TextStyle(fontSize: 32),

    );

const InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  fillColor: AppColors.darkGreyColor,
  filled: true,
  hintStyle: TextStyle(color: AppColors.whiteColor40),
  border: outlineInputBorder,
  enabledBorder: outlineInputBorder,
  focusedBorder: focusedOutlineInputBorder,
  errorBorder: errorOutlineInputBorder,
);

const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(
    color: AppColors.primaryColor,
    width: 0.3,
  ),
);

const OutlineInputBorder focusedOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(
    color: AppColors.primaryColor,
    width: 0.3,
  ),
);

const OutlineInputBorder errorOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious)),
  borderSide: BorderSide(
    color: AppColors.errorColor,
    width: 0.3,
  ),
);

OutlineInputBorder secodaryOutlineInputBorder(BuildContext context) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(defaultBorderRadious)),
    borderSide: BorderSide(
      color: Theme.of(context).textTheme.bodyLarge!.color!.withValues(alpha:0.15),
    ),
  );
}
