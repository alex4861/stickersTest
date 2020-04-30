import 'package:apptesting/BaseComponents/AppBarPinned.dart';
import 'package:apptesting/BaseComponents/SideMenu.dart';
import 'package:apptesting/Home/View/ListItem.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade700 : Colors.blue.shade700
    ));
    debugPrint('${Theme.of(context).brightness}');
    return new DynamicTheme(
      defaultBrightness: Theme.of(context).brightness,
        data: (brightness) =>
        new ThemeData(
          brightness: brightness,
          primaryColor: Theme.of(context).brightness == Brightness.dark ? Colors.blue: null,
          bottomAppBarColor: Colors.blue,
          scaffoldBackgroundColor: Theme.of(context).brightness == Brightness.dark ? CupertinoColors.tertiarySystemGroupedBackground: null,
          highlightColor: Colors.blue,accentColor: Colors.blue

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
        appBar: AppBarPinned(context, title: widget.title,).build(context),
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
          backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.blue: null,
          selectedItemColor: Theme.of(context).brightness == Brightness.dark? Colors.blueAccent: Colors.white,
          unselectedItemColor: Theme.of(context).brightness == Brightness.dark? Colors.blueGrey: Colors.white70,
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
