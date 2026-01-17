import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/AppUtils/app_colors.dart';
import 'package:untitled2/AppUtils/app_font_weight.dart';

class AppUtilities {
  final BuildContext context;

  AppUtilities(this.context);

  /// DISMISS KEYBOARD
  void dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  /// MODERN SNACKBAR
  void showTextSnackBar(
      String text, {
        Color? backgroundColor,
        IconData? icon,
      }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor ?? AppColors.primary,
      margin: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      duration: const Duration(seconds: 2),
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(
              icon,
              color: AppColors.white,
              size: 20,
            ),
            SizedBox(width: 10.w),
          ],
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: AppFontWeight.fontWeight600,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  /// PREDEFINED SNACKBARS
  void showSuccess(String message) {
    showTextSnackBar(
      message,
      backgroundColor: AppColors.success,
      icon: Icons.check_circle,
    );
  }

  void showError(String message) {
    showTextSnackBar(
      message,
      backgroundColor: AppColors.error,
      icon: Icons.error,
    );
  }

  void showWarning(String message) {
    showTextSnackBar(
      message,
      backgroundColor: AppColors.warning,
      icon: Icons.warning,
    );
  }
}
