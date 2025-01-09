import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otm_template/components/otm_dialog.dart';
import 'package:otm_template/themes/index.dart';

// ignore: constant_identifier_names
enum TypeAlert { INFO, SUCCESS, ERROR, WARNING }

// ignore: non_constant_identifier_names
Map<TypeAlert, IconData> TYPER_ALERT_ICON = {
  TypeAlert.SUCCESS: Icons.check_circle_outline,
  TypeAlert.ERROR: Icons.error_outline,
  TypeAlert.WARNING: Icons.warning_outlined,
};

// ignore: non_constant_identifier_names
Map<TypeAlert, Color> TYPER_ALERT_COLOR = {
  TypeAlert.INFO: AppColors.blackColor,
  TypeAlert.SUCCESS: AppColors.successColor,
  TypeAlert.ERROR: AppColors.errorColor,
  TypeAlert.WARNING: AppColors.warningColor,
};

Future<dynamic> showAlert(String message,
    {TypeAlert typeAlert = TypeAlert.INFO, bool allowPopup = false}) async {
  if (typeAlert == TypeAlert.ERROR) {
    return OtmDialog.showErrorDialog(content: message);
  }
  if (typeAlert == TypeAlert.WARNING) {
    return OtmDialog.showWarningDialog(content: message);
  }
  if (typeAlert == TypeAlert.SUCCESS) {
    return OtmDialog.showSuccessDialog(content: message);
  }
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: TYPER_ALERT_COLOR[typeAlert]!.withValues(alpha:.8),
    textColor: Colors.white,
  );
}

Future<dynamic> showAlertError(String message,
    {bool allowPopup = false}) async {
  return showAlert(message, typeAlert: TypeAlert.ERROR, allowPopup: allowPopup);
}

Future<dynamic> showAlertWarning(String message,
    {bool allowPopup = false}) async {
  return showAlert(message,
      typeAlert: TypeAlert.WARNING, allowPopup: allowPopup);
}

Future<dynamic> showAlertSuccess(String message,
    {bool allowPopup = false}) async {
  return showAlert(message,
      typeAlert: TypeAlert.SUCCESS, allowPopup: allowPopup);
}
