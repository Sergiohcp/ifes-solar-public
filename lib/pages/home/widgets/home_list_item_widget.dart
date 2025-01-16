import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class HomeListItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isHighlight;

  final double BORDER_WIDTH = 1;
  final double BORDER_RADIUS = 12;

  HomeListItem(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isHighlight = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: CustomTheme.color.white,
          border: Border.all(
              color: CustomTheme.color.secondary, width: BORDER_WIDTH),
          borderRadius: BorderRadius.all(Radius.circular(BORDER_RADIUS)),
          boxShadow: [
            CustomTheme.shadow.elevation2,
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(title,
                    variant: CustomTextVariant.label,
                    color: isHighlight ? "green.default" : "gray.dark"),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: isHighlight
                      ? CustomTheme.color.primary
                      : CustomTheme.color.grayDark,
                )
              ]),
        ),
      ),
    );
  }
}
