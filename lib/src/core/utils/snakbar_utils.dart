import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../presentations/values/values.dart';

class SnackBarUtils {
  static showTopSuccessMessage(BuildContext context, String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        backgroundColor: AppColors.green,
        textStyle: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.white),
        icon: const Icon(Iconsax.information,
            color: Color(0x15000000), size: 120),
        message: message,
      ),
      dismissType: DismissType.onTap,
      displayDuration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 600),
      reverseAnimationDuration: const Duration(milliseconds: 200),
    );
  }

  static showTopErrorMessage(BuildContext context, String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        backgroundColor: AppColors.red,
        textStyle: const TextStyle(
            fontWeight: FontWeight.w600, fontSize: 16, color: AppColors.white),
        icon: const Icon(Iconsax.information,
            color: Color(0x15000000), size: 120),
        message: message,
      ),
      dismissType: DismissType.onTap,
      displayDuration: const Duration(milliseconds: 2000),
      animationDuration: const Duration(milliseconds: 600),
      reverseAnimationDuration: const Duration(milliseconds: 200),
    );
  }
}
