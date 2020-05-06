import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager with ChangeNotifier{
  ThemeData _themeData;
  ThemeData get themeData{
    if(_themeData == null){
      debugPrint("setting default value");
    var primarySwatch = getMaterialColor(Colors.white);

    _themeData = ThemeData(
          primaryColor: primarySwatch,
          accentColor: primarySwatch,
          primarySwatch:primarySwatch,
          appBarTheme: AppBarTheme(
            color:  primarySwatch,
          )
      );
    }
    return _themeData;
  }
  final _mode = "Mode";

  final _primaryColor = "primaryColor";

  
  setBrightness(Brightness brightness, BuildContext context) async{
    MaterialColor primarySwatch = getMaterialColor(Theme.of(context).primaryColor);
    var mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor:Colors.black87,
        statusBarColor: primarySwatch,
    );
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);

    _themeData = ThemeData(
        brightness: brightness,
        primarySwatch: primarySwatch,
        primaryColor: primarySwatch,
        accentColor: primarySwatch,
        appBarTheme: AppBarTheme(
            color: primarySwatch
        ),
    );

    notifyListeners();
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(_mode, Brightness.values.indexOf(brightness));

  }
  setColor(Color primaryColor, BuildContext context) async{
    MaterialColor primarySwatch = getMaterialColor(primaryColor);
    var mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor:Colors.black87,
        statusBarColor: primarySwatch
    );
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);


    _themeData = ThemeData(
      brightness: context != null ? Theme.of(context).brightness: Brightness.light,
      primaryColor: primarySwatch,
      accentColor: primarySwatch,
      primarySwatch:primarySwatch,
      bottomAppBarTheme: BottomAppBarTheme(
        color: primarySwatch,
      ),
      bottomAppBarColor: primarySwatch,
      appBarTheme: AppBarTheme(
        color:  primarySwatch,
      ),
    );


    notifyListeners();
    var prefs = await SharedPreferences.getInstance();
    String colorString = primaryColor.toString(); // Color(0x12345678)
    String valueString = colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    prefs.setInt(_primaryColor, value);


  }

  ThemeManager(BuildContext context){
    _loadTheme(context);
  }
  void _loadTheme(BuildContext context){
    debugPrint("Entered loadTheme()");
    SharedPreferences.getInstance().then((prefs) {
      int mode = prefs.getInt(_mode) ?? 0;
      int primaryColor = prefs.getInt(_primaryColor) ?? 0;
      Color color = Color(primaryColor == 0? "FFFFFF": primaryColor);
      var a = Brightness.values[mode];
      MaterialColor primarySwatch = getMaterialColor(color);
      var mySystemTheme = SystemUiOverlayStyle.dark.copyWith(
          systemNavigationBarColor:Colors.black87,
          statusBarColor: primarySwatch,
      );
      SystemChrome.setSystemUIOverlayStyle(mySystemTheme);

      _themeData = ThemeData(
        brightness: a,
        primarySwatch: primarySwatch,
        primaryColor: primarySwatch,
        accentColor: primarySwatch,
        appBarTheme: AppBarTheme(
            color: primarySwatch
        ),
      );
      // Once theme is loaded - notify listeners to update UI
      notifyListeners();
    });

  }

  getMaterialColor(Color color){
    Map<int, Color> colors =
    {
      50:color.withOpacity(.1),
      100:color.withOpacity( .2),
      200:color.withOpacity( .3),
      300:color.withOpacity( .4),
      400:color.withOpacity( .5),
      500:color.withOpacity( .6),
      600:color.withOpacity( .7),
      700:color.withOpacity( .8),
      800:color.withOpacity( .9),
      900:color.withOpacity( 1),
    };
    MaterialColor materialColor = MaterialColor(color.value,colors);
    return materialColor;
  }
}




enum AppTheme {
  White, Dark, LightGreen, DarkGreen
}

