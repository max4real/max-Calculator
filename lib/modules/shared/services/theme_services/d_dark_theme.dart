import 'package:flutter/material.dart';
import 'package:max_calculator/modules/shared/services/theme_services/m_theme_model.dart';

Color number = Colors.white;
Color sign1 = const Color(0xFF3AF7D2);
Color sign2 = const Color(0XFFEF7A7B);
Color background = const Color(0xFF22252D);
Color onBackground = const Color(0xFF292D36);
Color numBackground = const Color(0XFF272B33);

class DarkThemData {
  static ThemeModel theme = ThemeModel(
    number: number,
    sign1: sign1,
    sign2: sign2,
    background: background,
    onBackground: onBackground,
    numBackground: numBackground,
  );
}
