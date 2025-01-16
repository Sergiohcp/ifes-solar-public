import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';

enum CustomLoadingColor {
  primary,
  white,
}

class CustomLoading extends StatelessWidget {
  final CustomLoadingColor color;
  final double? size;

  CustomLoading({Key? key, this.color = CustomLoadingColor.primary, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      child: CircularProgressIndicator(
        color: this.color == CustomLoadingColor.primary
            ? CustomTheme.color.primary
            : CustomTheme.color.white,
        strokeWidth: 3,
      ),
    );
  }
}
