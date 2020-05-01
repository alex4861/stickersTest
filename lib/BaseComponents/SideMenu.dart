import 'package:apptesting/Settings/View/SettingsView.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SideMenu extends StatefulWidget{
  SideMenu(BuildContext context);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  Brightness brightness;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child:Text(
                  'Bienvenido\nUsername',
                  style: TextStyle(
                      color:Colors.white,
                      fontSize: 25
                  )
                )
            ),
            decoration: BoxDecoration(color:Theme.of(context).brightness == Brightness.light? DynamicTheme.of(context).data.primaryColor: null),
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("settings"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsView()));
              Scaffold.of(context).openEndDrawer();
            },
          ),

          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Row(
                  children: [Text(
                    'Dark mode',
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 16
                    ),
                  ),

                    CupertinoSwitch(
                      activeColor: Colors.blueAccent,
                      onChanged: (bool value) {
                        setState(() {
                          DynamicTheme
                              .of(context)
                              .setBrightness(value ? Brightness.dark:Brightness.light);

                          SystemChrome.setSystemUIOverlayStyle(
                              SystemUiOverlayStyle(
                                  statusBarColor: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade700 : Colors.blue.shade700
                              )
                          );
                          debugPrint("Esta en modo ${DynamicTheme.of(context).brightness}");

                        });
                        },
                      value: Theme.of(context).brightness == Brightness.dark,
                      dragStartBehavior: DragStartBehavior.start,)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}