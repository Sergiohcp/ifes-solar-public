import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';

class CustomDivider extends StatelessWidget {
  final double? space;

  const CustomDivider({Key? key, this.space = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: this.space!),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 1,
        decoration: BoxDecoration(
          color: CustomTheme.color.grayBorder,
        ),
      ),
    );
  }
}
