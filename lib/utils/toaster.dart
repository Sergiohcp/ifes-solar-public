import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';

void showToaster({String title = "", String message = ""}) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      colorText: CustomTheme.color.white,
      backgroundColor: CustomTheme.color.grayDark,
      borderRadius: 0,
      margin: EdgeInsets.all(0),
      animationDuration: Duration(milliseconds: 2000));
}
