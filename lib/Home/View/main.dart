import 'dart:io';
import 'package:apptesting/BaseComponents/AppStandardBar.dart';
import 'package:apptesting/BaseComponents/SideMenu.dart';
import 'package:apptesting/Home/View/ListItem.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          scaffoldBackgroundColor: Theme.of(context).brightness == Brightness.dark ? CupertinoColors.tertiarySystemGroupedBackground: null,

        ),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: MyHomePage(title: 'Testing App'),
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child:
        Scaffold(
            drawer: SideMenu(context),
            body:
            SafeArea(
              bottom: false,
              top: Platform.isAndroid,
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {return [AppStandardBar(context, isCupertino: false,title: "Testing app",),];},
                body: TabBarView(
                  children: [
                    ListItem(),
                    Container(child: Center(child: Text("Nothing to show")),),
                    Container(child: Center(child: Text("You have no favorites yet")),),
                    Container(child: Center(child: Text("No recents files")),),
                    Container(),
                  ],
                ),
              ),
            )
        )
    );
  }

}
