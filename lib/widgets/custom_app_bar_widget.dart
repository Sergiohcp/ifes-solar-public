import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic? title;
  final VoidCallback? onPressed;
  final List<Widget>? actions;

  CustomAppBar({Key? key, this.title, this.onPressed, this.actions});

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: CustomTheme.color.greenDefault,
          boxShadow: [
            CustomTheme.shadow.elevation2,
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (this.onPressed != null)
                            GestureDetector(
                              onTap: onPressed,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: CustomTheme.color.white,
                              ),
                            ),
                          if (this.title is Widget) title,
                          if (this.title != null &&
                              this.title is String &&
                              title!.isNotEmpty)
                            CustomText(
                              this.title!,
                              variant: CustomTextVariant.subtitle2,
                              fontSize: CustomTextFontSize.xl,
                              color: 'white',
                            )
                        ],
                      ),
                    ],
                  ),
                  if (this.actions != null)
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: this.actions!),
                ],
              ),
            ),
          ],
        ));
  }
}
