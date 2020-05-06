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
          icon: Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          }
      ),
    ),
      title: Text(title ?? ""),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            )
        )
    );
  }

}
class BackBarPinned extends StatelessWidget{
  final String title;
  BackBarPinned(BuildContext context, {this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      leading: BackButton(),
      title: Text(title ?? ""),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            )
        )
    );
  }

}