import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/widgets/custom_app_bar_widget.dart';

class CustomScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final bool withAppBar;
  final PreferredSizeWidget? appBar;
  final dynamic? title;
  final bool withArrow;
  final VoidCallback? onPressed;
  final Widget body;

  const CustomScaffold(
      {Key? key,
      this.backgroundColor,
      this.withAppBar = true,
      this.appBar,
      this.title = null,
      this.withArrow = false,
      this.onPressed,
      required this.body})
      : super(key: key);

  getAppBar() {
    if (this.withAppBar) {
      if (this.appBar != null && this.appBar is PreferredSizeWidget) {
        return this.appBar;
      }
      return CustomAppBar(
        title: this.title,
        onPressed: this.withArrow
            ? this.onPressed != null
                ? this.onPressed
                : Get.back
            : null,
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.backgroundColor != null
          ? this.backgroundColor
          : CustomTheme.color.background,
      appBar: getAppBar(),
      body: this.body,
    );
  }
}
