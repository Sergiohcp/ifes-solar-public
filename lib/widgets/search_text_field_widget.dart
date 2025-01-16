import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';

class SearchTextField extends StatelessWidget {
  final ValueChanged<String>? onChanged;

  SearchTextField({Key? key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
          filled: true,
          fillColor: CustomTheme.color.white,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomTheme.color.greenDefault),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomTheme.color.white),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintText: 'Rua São Francisco, 04, Cariacica',
          hintStyle: TextStyle(
              fontFamily: CustomTheme.fontFamily.lato,
              fontSize: CustomTheme.fontSize.sm,
              fontWeight: CustomTheme.fontWeight.regular,
              color: CustomTheme.color.grayLight),
          prefixIcon: Icon(
            Icons.search,
            color: CustomTheme.color.greenDefault,
          )),
    );
  }
}
