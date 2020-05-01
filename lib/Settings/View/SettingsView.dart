import 'package:apptesting/BaseComponents/AppStandardBar.dart';
import 'package:apptesting/Colors/View/ColorsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class SettingsView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: CustomScrollView(
          slivers: <Widget>[
            AppStandardBackBar(context, pinned: true,title: "Settings",),
            SliverList(delegate: SliverChildListDelegate([SafeArea( child:SettingList())]),)
          ],

        ),
    );
  }
}

class SettingList extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return
       SafeArea(
        child: new ListView(
          children: <Widget>[
            Ink(
              child:ListTile(
                title: Text("Custom Colors"),
                leading: Icon(Icons.view_quilt),
                onTap:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ColorsView())
                  );
                }
              ),
            ),
            Ink(
              child:ListTile(
                title: Text("Notifications"),
                leading: Icon(Icons.notifications),

              ),
            ),
            Ink(
              child:ListTile(
                title: Text("Language"),
                leading: Icon(Icons.translate),

              ),
            ),
            Ink(
              child:ListTile(
                title: Text("Delete account", style: TextStyle(color: Colors.red),),
                leading: Icon(Icons.delete,color: Colors.red,),
                dense: true,

              ),
            ),

          ],
            shrinkWrap: true,
          physics: ScrollPhysics(),

        )
    );
  }
  Widget card(BuildContext context, int index){
    return Container(child: Text("uno"),);
  }
}