import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_color.dart';
import 'package:ifes_solar/core/theme/custom_font_family.dart';
import 'package:ifes_solar/core/theme/custom_font_size.dart';
import 'package:ifes_solar/core/theme/custom_font_weight.dart';
import 'package:ifes_solar/core/theme/custom_shadow.dart';

class CustomTheme {
  static final CustomFontFamily fontFamily = CustomFontFamily();
  static final CustomFontSize fontSize = CustomFontSize();
  static final CustomFontWeight fontWeight = CustomFontWeight();
  static final CustomColor color = CustomColor();
  static final CustomShadow shadow = CustomShadow();

  static Color getColor(dynamic color) {
    if (color is Color) return color;
    if (color is String) {
      switch (color) {
        // generic
        case 'white':
          return CustomTheme.color.white;
        case 'black':
          return CustomTheme.color.black;
        // gray
        case 'gray.light':
          return CustomTheme.color.grayLight;
        case 'gray.default':
          return CustomTheme.color.grayDefault;
        case 'gray.dark':
          return CustomTheme.color.grayDark;
        case 'gray.darker':
          return CustomTheme.color.grayDarker;
        case 'gray.background':
          return CustomTheme.color.grayBackground;
        case 'gray.border':
          return CustomTheme.color.grayBorder;
        // green
        case 'green.tint':
          return CustomTheme.color.greenTint;
        case 'green.light':
          return CustomTheme.color.greenLight;
        case 'green.default':
          return CustomTheme.color.greenDefault;
        case 'green.dark':
          return CustomTheme.color.greenDark;
        case 'green.darker':
          return CustomTheme.color.greenDarker;
        // red
        case 'red.default':
          return CustomTheme.color.redDefault;
        // blue
        case 'blue.default':
          return CustomTheme.color.blueDefault;
        // purple
        case 'purple.default':
          return CustomTheme.color.purpleDefault;
        // ambar
        case 'ambar.tint':
          return CustomTheme.color.ambarTint;
        case 'ambar.carignan':
          return CustomTheme.color.ambarCarignan;
        // default
        default:
          return CustomTheme.color.black;
      }
    }
    return CustomTheme.color.black;
  }
}
