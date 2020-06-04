import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarPinned extends StatelessWidget{
  final String title;
  AppBarPinned(BuildContext context, {this.title});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Text(title ?? ""),

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
      title: Text(title ?? ""),
        leading: BackButton()
    );
  }

}