import 'package:flutter/material.dart';
import 'package:max_calculator/modules/shared/services/theme_services/m_theme_model.dart';

Color number = const Color(0xFF292D36);
Color sign1 = const Color(0xFF3AF7D2);
Color sign2 = const Color(0XFFEF7A7B);
Color background =  Colors.white;
Color onBackground = const Color(0xFFF9F9F9);
Color numBackground = const Color(0XFFF7F7F7);

class LightThemeData {
  static ThemeModel theme = ThemeModel(
    number: number,
    sign1: sign1,
    sign2: sign2,
    background: background,
    onBackground: onBackground,
    numBackground: numBackground,
  );
}
