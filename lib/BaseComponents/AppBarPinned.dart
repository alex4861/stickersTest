import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarPinned extends StatelessWidget{
  final String title;
  AppBarPinned(BuildContext context, {this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(leading: Builder(
      builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: Theme.of(context).brightness == Brightness.dark ? Colors.blue :Colors.white,),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          }
      ),
    ),
      title: Text(title ?? ""),);
  }
  
}