import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class UserSimulationItem extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback onPressed;

  const UserSimulationItem(
      {Key? key,
      required this.title,
      required this.date,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: CustomTheme.color.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            CustomTheme.shadow.elevation2,
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  CustomText(
                    this.title,
                    variant: CustomTextVariant.label,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  CustomText(
                    "(${this.date})",
                    variant: CustomTextVariant.paragraphSmall,
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: CustomTheme.color.grayLight,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
