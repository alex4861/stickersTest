import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoAppStandardBackBar extends StatefulWidget {
  CupertinoAppStandardBackBar(BuildContext context, {this.pinned, this.title});
  final pinned;
  final String title;
  @override
  _CupertinoAppStandardBackBarState createState() => _CupertinoAppStandardBackBarState(pinned:pinned, title: title);
}


class _CupertinoAppStandardBackBarState extends State<CupertinoAppStandardBackBar> {
  _CupertinoAppStandardBackBarState({this.pinned, this.title});
  final bool pinned;
  String previousTitle;
  String title;

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return CupertinoSliverNavigationBar(
      automaticallyImplyTitle: true,
      largeTitle: Text(title ?? ""),
      previousPageTitle: previousTitle,
      actionsForegroundColor: Colors.white, backgroundColor: Colors.blue,);
  }
}