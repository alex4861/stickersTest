import 'package:apptesting/Settings/View/SettingsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SideMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Title',style: TextStyle(color: Colors.amber, fontSize: 25),),
            decoration: BoxDecoration(color: Colors.amber),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("settings"),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsView()));
            },
          )
        ],
      ),
    );
  }

}