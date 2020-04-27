import 'package:apptesting/BaseComponents/AppStandardBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AppStandardBackBar appBar = AppStandardBackBar();
    appBar.pinned = false;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            appBar,
            SliverList(delegate: SliverChildListDelegate([SafeArea( child:SettingList())]),)
          ],

        ),
      ),
    );
  }
}

class SettingList extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Container(
        child: new ListView(
          children: <Widget>[
            Ink(
              child:ListTile(
                title: Text("Custom Colors"),
                leading: Icon(Icons.view_quilt),
                dense: true,
              ),
              color: CupertinoColors.tertiarySystemBackground,
            ),
            Ink(
              child:ListTile(
                title: Text("Notifications"),
                leading: Icon(Icons.notifications),
                dense: true,

              ),
              color: CupertinoColors.tertiarySystemBackground,
            ),
            Ink(
              child:ListTile(
                title: Text("Language"),
                leading: Icon(Icons.translate),
                dense: true,

              ),
              color: CupertinoColors.tertiarySystemBackground,
            ),
            Ink(
              child:ListTile(
                title: Text("Delete account", style: TextStyle(color: Colors.red),),
                leading: Icon(Icons.delete,color: Colors.red,),
                dense: true,

              ),
              color: CupertinoColors.tertiarySystemBackground,
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

//ListView.builder(
//          scrollDirection: Axis.vertical,
//          shrinkWrap: true,
//          physics: ScrollPhysics(),
//          itemCount: 3,
//          itemBuilder: (BuildContext context, int index)=> card(context, index),
//        )