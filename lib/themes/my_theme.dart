import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_challenge_1_theming/themes/colors.dart';

class MyTheme with ChangeNotifier {
  var _themeType = ThemeType.Light;

  ThemeType get themeType => _themeType;

  MyTheme() {
    /// If the user changes the theme in their device's settings, this is picked up on as well:
    final window = WidgetsBinding.instance?.window;
    window?.onPlatformBrightnessChanged = () {
      final brightness = window.platformBrightness;

      switch (brightness) {
        case Brightness.dark:
          setThemeType(ThemeType.Dark);
          break;
        case Brightness.light:
          setThemeType(ThemeType.Light);
      }
    };
  }
  void setThemeType(ThemeType themeType) {
    _themeType = themeType;
    notifyListeners();
  }

  // todo(you) fill this in and make the different text styles visible in the text area look better in both light, dark and other mode?
  ThemeData get currentThemeData {
    switch (themeType) {
      case ThemeType.Light:
        return ThemeData(
          canvasColor: Colors.white,
          textTheme: TextTheme(
            headline3: headline.copyWith(color: LightColors.text),
            subtitle1: subHeadline.copyWith(color: LightColors.accent),
            bodyText1: bodyText.copyWith(color: LightColors.text.withOpacity(0.85)),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            textTheme: TextTheme(
              headline6: appBarText.copyWith(color: LightColors.text),
            ),
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(LightColors.accent),
          ),
        );
      case ThemeType.Dark:
        return ThemeData(
          brightness: Brightness.dark,
          canvasColor: Colors.black,
          textTheme: TextTheme(
            headline3: headline.copyWith(color: DarkColors.text),
            subtitle1: subHeadline.copyWith(color: DarkColors.accent),
            bodyText1: bodyText.copyWith(color: DarkColors.text.withOpacity(0.8)),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            textTheme: TextTheme(
              headline6: appBarText.copyWith(color: DarkColors.text),
            ),
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(Color(0xFF892cdc)),
          ),
          unselectedWidgetColor: DarkColors.text,
        );
      case ThemeType.Other:
        return ThemeData(
          brightness: Brightness.dark,
          canvasColor: OtherColors.background,
          textTheme: TextTheme(
            headline3: headline.copyWith(color: OtherColors.text),
            subtitle1: subHeadline.copyWith(color: OtherColors.accent),
            bodyText1: bodyText.copyWith(color: OtherColors.text.withOpacity(0.9)),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: OtherColors.appbar,
            textTheme: TextTheme(
              headline6: appBarText.copyWith(color: OtherColors.text),
            ),
          ),
          radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.all<Color>(OtherColors.accent),
          ),
        );
    }
  }
}

TextStyle headline = GoogleFonts.hind(
  textStyle: TextStyle(
    fontSize: 46.0,
    fontWeight: FontWeight.bold,
    letterSpacing: -2.0,
    height: 1.8,
  ),
);

TextStyle subHeadline = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 16.0,
    letterSpacing: -0.4,
    height: 1.0,
    fontWeight: FontWeight.bold,
  ),
);

TextStyle bodyText = GoogleFonts.openSans(
  textStyle: TextStyle(
    fontSize: 14.0,
    letterSpacing: -0.25,
    height: 1.15,
  ),
);

TextStyle appBarText = GoogleFonts.hind(
  textStyle: TextStyle(
    fontSize: 24.0,
    color: DarkColors.text,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.8,
  ),
);

enum ThemeType {
  Light,
  Dark,
  Other,
}
