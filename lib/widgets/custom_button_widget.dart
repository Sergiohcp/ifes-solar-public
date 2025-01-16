import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';
import 'package:ifes_solar/widgets/custom_loading_widget.dart';
import 'package:ifes_solar/widgets/custom_text_widget.dart';

enum CustomButtonVariant { contained, outlined, text }

enum CustomButtonTextPadding { normal, zero }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CustomButtonVariant? variant;
  final bool disabled;
  final bool isLoading;
  final bool withArrow;
  final Widget? icon;
  final Color? color;
  final CustomButtonTextPadding? textPadding;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.variant = CustomButtonVariant.contained,
    this.disabled = false,
    this.isLoading = false,
    this.withArrow = false,
    this.icon,
    this.color,
    this.textPadding = CustomButtonTextPadding.normal,
  });

  getOnPressed() {
    if (this.disabled) return null;
    if (this.isLoading) return () => null;
    return this.onPressed;
  }

  getButton() {
    final Widget defaultButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: !this.disabled
              ? CustomTheme.color.greenDefault
              : CustomTheme.color.grayLight),
      onPressed: getOnPressed(),
      child: !this.isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (this.icon != null) icon!,
                if (this.icon != null)
                  SizedBox(
                    width: 8,
                  ),
                CustomText(
                  this.text,
                  variant: CustomTextVariant.label,
                  color: 'white',
                )
              ],
            )
          : Center(
              child: CustomLoading(
                color: CustomLoadingColor.white,
                size: 24,
              ),
            ),
    );

    switch (this.variant) {
      case CustomButtonVariant.contained:
        return defaultButton;
      case CustomButtonVariant.outlined:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            side: BorderSide(
                width: 2,
                color: !this.disabled
                    ? CustomTheme.color.greenDefault
                    : CustomTheme.color.grayLight),
          ),
          onPressed: getOnPressed(),
          child: !this.isLoading
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (this.icon != null) icon!,
                    if (this.icon != null)
                      SizedBox(
                        width: 8,
                      ),
                    CustomText(this.text,
                        variant: CustomTextVariant.label,
                        color: !this.disabled ? 'green.default' : 'gray.light')
                  ],
                )
              : Center(
                  child: CustomLoading(
                    size: 24,
                  ),
                ),
        );
      case CustomButtonVariant.text:
        return TextButton(
          style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: this.textPadding == CustomButtonTextPadding.zero
                ? MaterialTapTargetSize.shrinkWrap
                : null,
          ),
          onPressed: getOnPressed(),
          child: !this.isLoading
              ? Row(
                  children: [
                    CustomText(this.text,
                        variant: CustomTextVariant.labelSmall,
                        color: this.color != null
                            ? this.color
                            : !this.disabled
                                ? 'green.default'
                                : 'gray.light'),
                    if (this.withArrow)
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        child: Icon(
                          Icons.arrow_forward,
                          color: this.color != null
                              ? this.color
                              : CustomTheme.color.primary,
                          size: 16,
                        ),
                      )
                  ],
                )
              : Center(
                  child: CustomLoading(
                    size: 24,
                  ),
                ),
        );
      default:
        return defaultButton;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.variant == CustomButtonVariant.text) {
      return getButton();
    }
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 48,
            child: getButton(),
          ),
        ),
      ],
    );
  }
}
