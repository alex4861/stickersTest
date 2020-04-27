import 'dart:io';
import 'package:apptesting/Home/View/main.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStandardBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Platform.isIOS ?
    CupertinoSliverNavigationBar(automaticallyImplyTitle: false, largeTitle: Text("asdasdas"),actionsForegroundColor: Colors.white, backgroundColor: Colors.blue,):SliverAppBar(
      leading: Builder(
        builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Platform.isIOS ? Colors.amber :Colors.white,),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            }
        ),
      ),
      floating: true,
      title: Text("uno"),

    );
  }

}
class AppStandardBackBar extends StatefulWidget {
  AppStandardBackBar({this.previousTitle, this.pinned});
  String previousTitle;
  bool pinned;

  @override
  _AppStandardBackBarState createState() => _AppStandardBackBarState();
}

class _AppStandardBackBarState extends State<AppStandardBackBar> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Platform.isIOS ?
    CupertinoSliverNavigationBar(automaticallyImplyTitle: true, largeTitle: Text("a"),previousPageTitle: widget.previousTitle,actionsForegroundColor: Colors.amber,)
        : SliverAppBar(leading: BackButton(color: Colors.white,),
      floating: true,
      pinned: widget.pinned,
    );;
  }
}