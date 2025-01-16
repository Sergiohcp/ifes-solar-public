import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';

enum CustomTextVariant {
  heading1,
  heading2,
  heading3,
  heading4,
  heading5,
  heading6,
  subtitle1,
  subtitle2,
  paragraphLarge,
  paragraph,
  paragraphSmall,
  caption,
  micro,
  labelLarge,
  label,
  labelSmall,
}

enum CustomTextFontSize {
  huge, // 44
  xxxl, // 36
  xxl, // 28
  xl, // 20
  lg, // 18
  md, // 16
  sm, // 14
  xs, // 12
  xxs, // 10
}

enum CustomTextFontWeight { regular, medium, bold }

class TextVariant {
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  TextVariant({
    required this.fontFamily,
    required this.fontSize,
    required this.fontWeight,
    required this.color,
  });
}

class CustomText extends StatelessWidget {
  final String text;
  final CustomTextVariant variant;
  final CustomTextFontSize? fontSize;
  final CustomTextFontWeight? fontWeight;
  final dynamic color;
  final TextAlign? textAlign;

  const CustomText(this.text,
      {Key? key,
      this.variant = CustomTextVariant.paragraph,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.textAlign});

  getVariant() {
    // PARAGRAPH
    final defaultVariant = TextVariant(
        fontFamily: CustomTheme.fontFamily.lato,
        fontSize: CustomTheme.fontSize.md,
        fontWeight: CustomTheme.fontWeight.regular,
        color: CustomTheme.color.grayDefault);
    switch (this.variant) {
      // HEADING 1
      case CustomTextVariant.heading1:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.neoSansStd,
            fontSize: CustomTheme.fontSize.huge,
            fontWeight: CustomTheme.fontWeight.bold,
            color: CustomTheme.color.grayDarker);
      // HEADING 2
      case CustomTextVariant.heading2:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.neoSansStd,
            fontSize: CustomTheme.fontSize.xxxl,
            fontWeight: CustomTheme.fontWeight.bold,
            color: CustomTheme.color.grayDarker);
      // HEADING 3
      case CustomTextVariant.heading3:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.neoSansStd,
            fontSize: CustomTheme.fontSize.xxl,
            fontWeight: CustomTheme.fontWeight.bold,
            color: CustomTheme.color.grayDarker);
      // HEADING 4
      case CustomTextVariant.heading4:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.neoSansStd,
            fontSize: CustomTheme.fontSize.xl,
            fontWeight: CustomTheme.fontWeight.bold,
            color: CustomTheme.color.grayDarker);
      // HEADING 5
      case CustomTextVariant.heading5:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.neoSansStd,
            fontSize: CustomTheme.fontSize.lg,
            fontWeight: CustomTheme.fontWeight.medium,
            color: CustomTheme.color.grayDarker);
      // HEADING 6
      case CustomTextVariant.heading6:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.neoSansStd,
            fontSize: CustomTheme.fontSize.md,
            fontWeight: CustomTheme.fontWeight.medium,
            color: CustomTheme.color.grayDarker);
      // SUBTITLE 1
      case CustomTextVariant.subtitle1:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.neoSansStd,
            fontSize: CustomTheme.fontSize.lg,
            fontWeight: CustomTheme.fontWeight.regular,
            color: CustomTheme.color.grayLight);
      // SUBTITLE 2
      case CustomTextVariant.subtitle2:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.neoSansStd,
            fontSize: CustomTheme.fontSize.md,
            fontWeight: CustomTheme.fontWeight.regular,
            color: CustomTheme.color.grayLight);
      // PARAGRAPH LARGE
      case CustomTextVariant.paragraphLarge:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.lato,
            fontSize: CustomTheme.fontSize.lg,
            fontWeight: CustomTheme.fontWeight.regular,
            color: CustomTheme.color.grayDefault);
      // PARAGRAPH
      case CustomTextVariant.paragraph:
        return defaultVariant;
      // PARAGRAPH SMALL
      case CustomTextVariant.paragraphSmall:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.lato,
            fontSize: CustomTheme.fontSize.sm,
            fontWeight: CustomTheme.fontWeight.regular,
            color: CustomTheme.color.grayDefault);
      // CAPTION
      case CustomTextVariant.caption:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.lato,
            fontSize: CustomTheme.fontSize.xs,
            fontWeight: CustomTheme.fontWeight.regular,
            color: CustomTheme.color.grayDefault);
      // MICRO
      case CustomTextVariant.micro:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.lato,
            fontSize: CustomTheme.fontSize.xxs,
            fontWeight: CustomTheme.fontWeight.regular,
            color: CustomTheme.color.grayDefault);
      // LABEL LARGE
      case CustomTextVariant.labelLarge:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.lato,
            fontSize: CustomTheme.fontSize.lg,
            fontWeight: CustomTheme.fontWeight.bold,
            color: CustomTheme.color.grayDefault);
      // LABEL
      case CustomTextVariant.label:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.lato,
            fontSize: CustomTheme.fontSize.md,
            fontWeight: CustomTheme.fontWeight.bold,
            color: CustomTheme.color.grayDefault);
      // LABEL SMALL
      case CustomTextVariant.labelSmall:
        return TextVariant(
            fontFamily: CustomTheme.fontFamily.lato,
            fontSize: CustomTheme.fontSize.sm,
            fontWeight: CustomTheme.fontWeight.bold,
            color: CustomTheme.color.grayDefault);
      default:
        return defaultVariant;
    }
  }

  double getFontSize(TextVariant variant) {
    if (this.fontSize != null) {
      switch (this.fontSize) {
        case CustomTextFontSize.huge:
          return CustomTheme.fontSize.huge;
        case CustomTextFontSize.xxxl:
          return CustomTheme.fontSize.xxxl;
        case CustomTextFontSize.xxl:
          return CustomTheme.fontSize.xxl;
        case CustomTextFontSize.xl:
          return CustomTheme.fontSize.xl;
        case CustomTextFontSize.lg:
          return CustomTheme.fontSize.lg;
        case CustomTextFontSize.md:
          return CustomTheme.fontSize.md;
        case CustomTextFontSize.sm:
          return CustomTheme.fontSize.sm;
        case CustomTextFontSize.xs:
          return CustomTheme.fontSize.xs;
        case CustomTextFontSize.xxs:
          return CustomTheme.fontSize.xxs;
        default:
          return CustomTheme.fontSize.md;
      }
    }

    return variant.fontSize;
  }

  FontWeight getFontWeight(TextVariant variant) {
    if (this.fontWeight != null) {
      switch (this.fontWeight) {
        case CustomTextFontWeight.regular:
          return CustomTheme.fontWeight.regular;
        case CustomTextFontWeight.medium:
          return CustomTheme.fontWeight.medium;
        case CustomTextFontWeight.bold:
          return CustomTheme.fontWeight.bold;
        default:
          return CustomTheme.fontWeight.regular;
      }
    }

    return variant.fontWeight;
  }

  Color getColor(TextVariant variant) {
    if (this.color != null) {
      return CustomTheme.getColor(this.color);
    }

    return variant.color;
  }

  Widget buildRichText(TextVariant variant) {
    RegExp regex = RegExp(r"\*\*(.*?)\*\*");
    List<Map<String, dynamic>> richText = [];
    this.text.splitMapJoin(regex, onNonMatch: (textNotMatched) {
      richText.add({'text': textNotMatched, 'isHighlight': false});
      return '';
    }, onMatch: (match) {
      richText
          .add({'text': match[0]!.replaceAll('**', ''), 'isHighlight': true});
      return '';
    });

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          children: richText
              .map((item) => TextSpan(
                    text: this.variant == CustomTextVariant.micro
                        ? item['text'].toUpperCase()
                        : item['text'],
                    style: TextStyle(
                      fontFamily: variant.fontFamily,
                      fontSize: getFontSize(variant),
                      fontWeight: !item['isHighlight']
                          ? getFontWeight(variant)
                          : CustomTheme.fontWeight.bold,
                      color: getColor(variant),
                    ),
                  ))
              .toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextVariant variant = getVariant();

    if (this.text.contains('**')) {
      return buildRichText(variant);
    }

    return Text(
      this.variant == CustomTextVariant.micro
          ? this.text.toUpperCase()
          : this.text,
      style: TextStyle(
        fontFamily: variant.fontFamily,
        fontSize: getFontSize(variant),
        fontWeight: getFontWeight(variant),
        color: getColor(variant),
      ),
      textAlign: this.textAlign,
    );
  }
}
