import 'package:flutter/cupertino.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final String placeholder;
  final bool obscureText;
  final TextStyle? style;
  final ValueChanged<String>? onChange;
  final Widget? prefix;

  const CustomFormField(
      {Key? key,
      required this.controller,
      this.validator,
      this.placeholder = '',
      this.obscureText = false,
      this.style,
      this.onChange,
      this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextFormFieldRow(
      padding: EdgeInsets.all(0),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      cursorColor: CustomTheme.color.primary,
      style: style ?? TextStyle(color: CustomTheme.color.primary),
      decoration: BoxDecoration(
        border: Border.all(color: CustomTheme.color.primary, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      validator: validator,
      obscureText: obscureText,
      placeholder: placeholder,
      prefix: prefix ?? Text(''),
      onChanged: onChange,
    );
  }
}
