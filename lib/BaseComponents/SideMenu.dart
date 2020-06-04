import 'package:apptesting/Settings/View/SettingsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'ThemeManager.dart';

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
                      color:Theme.of(context).brightness == Brightness.light ? Theme.of(context).primaryTextTheme.title.color : null,
                      fontSize: 25
                  )
                )
            ),
            decoration: BoxDecoration(color:Theme.of(context).brightness == Brightness.light? Theme.of(context).primaryColor: null),
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("settings"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsView()));
              Scaffold.of(context).openDrawer();
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
                      activeColor: Theme.of(context).primaryColor,
                      onChanged:(bool value) {
                        setState(() {
                          var provider = Provider.of<ThemeManager>(context);
                          print(Theme.of(context));
                          value ? provider.setBrightness(Brightness.dark, context):provider.setBrightness(Brightness.light, context);

                        });
                        },
                      value: Theme.of(context).brightness == Brightness.dark,
                      dragStartBehavior: DragStartBehavior.start,),
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