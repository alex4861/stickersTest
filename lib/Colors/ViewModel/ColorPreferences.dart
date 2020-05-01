import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

enum ThemeColor {
  primaryColor,
  scaffoldBackgroundColor,
  bottomAppBarColor,
  highlightColor
}
class CustomTheme{
  color(ThemeColor color)  {
    switch(color){
      case ThemeColor.primaryColor:
        return "primaryColor";
        break;
      case ThemeColor.scaffoldBackgroundColor:
        return "scaffoldBackgroundColor";
        break;
      case ThemeColor.bottomAppBarColor:
        return "bottomAppBarColor";
        break;
      case ThemeColor.highlightColor:
        return "highlightColor";
        break;
    }
  }

  getColor(ThemeColor type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Color(prefs.getInt(color(type)) ?? 0);
  }
  setColor(ThemeColor type, Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      String colorString = color.toString(); // Color(0x12345678)
      String valueString = colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
      int value = int.parse(valueString, radix: 16);
      prefs.setInt(this.color(type), value);
  }
}