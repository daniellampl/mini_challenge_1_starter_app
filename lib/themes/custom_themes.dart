import 'package:flutter/material.dart';
import 'package:mini_challenge_1_theming/themes/colors.dart';
import 'package:provider/provider.dart';

import 'my_theme.dart';
import 'scenery_theme.dart';

/// You can add themes for your own custom widgets here.
/// NB: for this challenge, it is only required to modify sceneryThemeData
class CustomWidgetThemes {
  static CustomWidgetThemes of(BuildContext context) => CustomWidgetThemes._(context);

  SceneryThemeData? sceneryThemeData;

  // todo(you) These colors are dreary! Modify this so the picture has different values for light and dark modes.
  //  If you are feeling ambitions, get creative and make a third theme (or a fourth!)
  CustomWidgetThemes._(BuildContext context) {
    final themeType = Provider.of<MyTheme>(context).themeType;

    switch (themeType) {
      case ThemeType.Light:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: LightColors.sky,
          mountainFillColor: LightColors.mountain,
          waterFillColor: LightColors.water,
          drawMoon: false,
          drawSun: true,
        );
        break;
      case ThemeType.Dark:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: DarkColors.sky,
          mountainFillColor: DarkColors.mountain,
          waterFillColor: DarkColors.water,
          drawMoon: true,
          drawSun: false,
        );
        break;
      case ThemeType.Other:
        sceneryThemeData = SceneryThemeData(
          skyFillColor: OtherColors.sky,
          mountainFillColor: OtherColors.mountain,
          waterFillColor: OtherColors.water,
          drawMoon: true,
          drawSun: true,
        );
        break;
    }
  }
}
