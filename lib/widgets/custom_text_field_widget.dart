import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';

class CustomTextField extends StatelessWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final Widget? suffixIcon;

  CustomTextField({
    Key? key,
    this.initialValue,
    this.controller,
    this.onChanged,
    this.hintText = "",
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: this.initialValue,
      controller: this.controller,
      onChanged: this.onChanged,
      obscureText: this.obscureText as bool,
      keyboardType: this.keyboardType,
      validator: this.validator,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: this.hintText,
          hintStyle: TextStyle(color: CustomTheme.color.grayLight),
          suffixIcon: this.suffixIcon),
    );
  }
}
