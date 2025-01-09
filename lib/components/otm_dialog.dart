import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otm_template/components/button/otm_button.dart';
import 'package:otm_template/constants/constants.dart';
import 'package:otm_template/main.dart';
import 'package:otm_template/router/router.dart';
import 'package:otm_template/themes/index.dart';
import 'package:otm_template/utils/extension.dart';

class OtmDialog {
  static bool isShowDialog = false;

  static Future<T?> showBottomSheet<T>({
    required BuildContext context,
    required Widget content,
    bool isDismissible = true, // ? dismiss when click outside of sheet
    bool isDraggable = true,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      enableDrag: isDraggable,
      isDismissible: isDismissible,
      builder: (BuildContext context) {
        var r;
        return PopScope(
          canPop: isDismissible,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: 59,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(Constants.borderRadiusCard),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    topRight: Radius.circular(8.r),
                  ),
                ),
                child: content,
              ),
            ],
          ),
        );
      },
    );
  }

  static Future showSuccessDialog(
      {required String content,
      Widget? bottomView,
      String textConfirm = "Đóng",
      Function()? onConfirm}) async {
    await showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: _customDialog(
            child: Container(
              width: MediaQuery.of(context).size.height - 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check_circle_outline,
                      size: 65, color: Colors.green),
                  const SizedBox(height: 8),
                  Text(
                    content,
                    // style: AppTheme.theme.textTheme.h4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  bottomView ?? const SizedBox(),
                  OtmButton(
                    textStyle: TextStyle(color: AppColors.green),
                    isOutline: true,
                    text: "Xác nhận",
                    onPressed: () {
                      AppRouter.goBack();
                      onConfirm?.call();
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Future showErrorDialog(
      {required String content,
      Widget? bottomView,
      String textConfirm = "Đóng",
      Function()? onConfirm}) async {
    await showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: _customDialog(
            child: Card(
              child: Container(
                width: MediaQuery.of(context).size.height - 32,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(8),
                //   color: Colors.white,
                // ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 65,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      content,
                      // style: AppTheme.theme.textTheme.h4,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    bottomView ?? const SizedBox(),
                    OtmButton(
                      // color: Colors.red,
                      isOutline: true,
                      text: "Xác nhận",
                      onPressed: () {
                        AppRouter.goBack();
                        onConfirm?.call();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future showWarningDialog(
      {required String content,
      Widget? bottomView,
      String textConfirm = "Đóng",
      Function()? onConfirm}) async {
    await showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: _customDialog(
            child: Card(
              child: Container(
                width: MediaQuery.of(context).size.height - 32,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(8),
                //   color: Colors.white,
                // ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.warning_outlined,
                      size: 65,
                      color: Colors.amber,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      content,
                      // style: AppTheme.theme.textTheme.h4,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    bottomView ?? const SizedBox(),
                    OtmButton(
                      // color: Colors.red,
                      isOutline: true,
                      text: "Xác nhận",
                      onPressed: () {
                        AppRouter.goBack();
                        onConfirm?.call();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future showRetryDialog(
      {required String content,
      Widget? bottomView,
      String textRetry = "Retry",
      Function()? onRetry,
      required BuildContext context}) async {
    await showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: _customDialog(
            child: Card(
              child: Container(
                width: MediaQuery.of(context).size.height - 32,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(8),
                //   color: Colors.white,
                // ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 65,
                      color: Colors.red,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      content,
                      // style: AppTheme.theme.textTheme.h4,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    bottomView ?? const SizedBox(),
                    OtmButton(
                      isOutline: true,
                      text: "Thử lại",
                      onPressed: () {
                        AppRouter.goBack();
                        onRetry?.call();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future showInfoDialog(
      {required String content,
      Widget? bottomView,
      String textConfirm = "Đóng",
      Function()? onConfirm}) async {
    await showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: _customDialog(
            child: Card(
              child: Container(
                width: MediaQuery.of(context).size.height - 32,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(8),
                //   color: Colors.white,
                // ),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.info_outline,
                      size: 65,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      content,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    bottomView ?? const SizedBox(),
                    OtmButton(
                      isOutline: true,
                      text: "Xác nhận",
                      onPressed: () {
                        AppRouter.goBack();
                        onConfirm?.call();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future showConfirmDialog(
      {String title = "Notification",
      required String content,
      Function()? onCancel,
      Function()? onConfirm,
      String textConfirm = "Đóng",
      String textCancel = "Cancel",
      bool reversedActions = false,
      bool isRequire = false}) async {
    var actions = [
      if (!isRequire) ...[
        Expanded(
          child: OtmButton(
            isOutline: true,
            text: "Hủy",
            onPressed: () {
              Navigator.of(navKey.currentContext!).pop();
              if (onCancel != null) {
                onCancel();
              }
            },
          ),
        ),
        const SizedBox(width: 16),
      ],
      Expanded(
        child: OtmButton(
          text: "Xác nhận",
          onPressed: () {
            Navigator.of(navKey.currentContext!).pop();
            if (onConfirm != null) {
              onConfirm();
            }
          },
        ),
      ),
    ];
    if (reversedActions) {
      actions = actions.reversed.toList();
    }
    await showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: _customDialog(
            child: Card(
              child: Container(
                width: MediaQuery.of(context).size.height - 32,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon(Icons.warning, size: 64.w),
                    const SizedBox(height: 16),
                    Text(
                      title.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle().bold,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      content,
                      // style: AppTheme.theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 24),
                    Row(
                      children: actions,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  //show dialog with custom content
  static Future showCustomDialog(
      {required Widget content,
      Function()? onConfirm,
      bool reversedActions = false,
      bool isRequire = false}) async {
    var actions = [
      if (isRequire) ...[
        Expanded(
          child: OtmButton(
            isOutline: true,
            text: "Hủy",
            onPressed: () {
              Navigator.of(navKey.currentContext!).pop();
            },
          ),
        ),
        const SizedBox(width: 16),
      ],
      Expanded(
        child: OtmButton(
          text: "Xác nhận",
          onPressed: () {
            Navigator.of(navKey.currentContext!).pop();
            if (onConfirm != null) {
              onConfirm();
            }
          },
        ),
      ),
    ];
    if (reversedActions) {
      actions = actions.reversed.toList();
    }
    await showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: _customDialog(
            child: Card(
              child: Container(
                width: MediaQuery.of(context).size.height - 32,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icon(Icons.warning, size: 64.w),
                    const SizedBox(height: 16),
                    content,
                    const SizedBox(height: 24),
                    Row(
                      children: actions,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _customDialog({required Widget child}) {
    // LoadingUtils.closeLoading();
    return Dialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: Colors.transparent,
        child: child);
  }

  static Future showLoadingDialog() async {
    await showDialog(
      barrierDismissible: false,
      context: navKey.currentContext!,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: _customDialog(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}
