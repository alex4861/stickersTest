import 'package:apptesting/BaseComponents/AppBarPinned.dart';
import 'package:apptesting/BaseComponents/SideMenu.dart';
import 'package:apptesting/Colors/ViewModel/ColorPreferences.dart';
import 'package:apptesting/Home/View/ListItem.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String colorString = Colors.red.toString(); // Color(0x12345678)
    String valueString = colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    prefs.setInt(CustomTheme().color(ThemeColor.primaryColor), value);
    print(Color(prefs.getInt(CustomTheme().color(ThemeColor.primaryColor))));
  print("First time");
  runApp(MyApp());

}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color primaryColor;
  Color scaffoldBackgroundColor;
  Color bottomAppBarColor;
  Color highlightColor;
  Color one;

  setColor(ThemeColor type, Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String colorString = color.toString(); // Color(0x12345678)
      String valueString = colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
      int value = int.parse(valueString, radix: 16);
      prefs.setInt(CustomTheme().color(type), value);

    });
  }

  void initState() {
    super.initState();
    getColor(ThemeColor.primaryColor);

  }

  getColor(ThemeColor type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      primaryColor = Color(prefs.getInt(CustomTheme().color(type)) ?? 0);
      DynamicTheme.of(context).setThemeData(ThemeData(primaryColor: primaryColor));
    });
  }

  @override
  Widget build(BuildContext context) {
    print(primaryColor);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade700 : Colors.blue.shade700
    ));
    debugPrint('${Theme.of(context).brightness}');
    return new DynamicTheme(
      defaultBrightness: Theme.of(context).brightness,
        data: (brightness) =>
        new ThemeData(
          brightness: brightness,
          primaryColor: Theme.of(context).brightness == Brightness.light ? primaryColor: null,
          scaffoldBackgroundColor: Theme.of(context).brightness == Brightness.dark ? CupertinoColors.tertiarySystemGroupedBackground: null,
          highlightColor:Theme.of(context).primaryColor,accentColor: Theme.of(context).primaryColor

        ),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: ChangeNotifierProvider<BottomNavigationBarProvider>(
              child:MyHomePage(title: 'Testing App'),
              create: (BuildContext context) => BottomNavigationBarProvider(),
            ),
            theme: theme,
          );
        }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentTab = [
    ListItem(),
    Container(child:Center(child:Text("uno"))),
    Container(child:Center(child:Text("dos"))),
    Container(child:Center(child:Text("tres"))),
    Container(child:Center(child:Text("cuatro"))),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
        drawer: SideMenu(context),
        appBar: AppBarPinned(context, title: widget.title,color: Theme.of(context).brightness == Brightness.light ? DynamicTheme.of(context).data.primaryColor: null,).build(context),
        body:  currentTab[provider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: (index) {
              provider.currentIndex = index;
            },
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text(""),activeIcon: Icon(Icons.home)),
            BottomNavigationBarItem(icon:  Icon(CupertinoIcons.search), title: Text("")),
            BottomNavigationBarItem(icon:  Icon(CupertinoIcons.heart), title: Text("")),
            BottomNavigationBarItem(icon:  Icon(CupertinoIcons.time), title: Text("")),
            BottomNavigationBarItem(icon:  Icon(CupertinoIcons.profile_circled), title: Text(""))
          ],
            type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).brightness == Brightness.light ? Theme.of(context).primaryColor: null,
          selectedItemColor: Theme.of(context).brightness == Brightness.dark? DynamicTheme.of(context).data.primaryColor.withOpacity(10): Colors.white,
          unselectedItemColor: Theme.of(context).brightness == Brightness.dark? DynamicTheme.of(context).data.primaryColor.withAlpha(90): Colors.white70,
        ),
      );

  }

}


class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;


  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
