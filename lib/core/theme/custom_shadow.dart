import 'package:flutter/material.dart';
import 'package:ifes_solar/core/theme/custom_theme.dart';

class CustomShadow {
  BoxShadow elevation2 = BoxShadow(
    color: CustomTheme.color.black.withOpacity(0.35),
    offset: Offset(0, 1),
    blurRadius: 4,
  );

  BoxShadow elevation5 = BoxShadow(
    color: CustomTheme.color.black.withOpacity(0.35),
    offset: Offset(0, 2),
    blurRadius: 8,
  );
}
