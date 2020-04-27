import 'package:apptesting/BaseComponents/AppStandardBar.dart';
import 'package:apptesting/BaseComponents/CupertinoStandardBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class PackagePreviewView extends StatefulWidget{
  @override
  _PackagePreviewViewState createState() => _PackagePreviewViewState();
}

class _PackagePreviewViewState extends State<PackagePreviewView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AppStandardBackBar appBar = AppStandardBackBar();
    appBar.pinned = true;

    return Scaffold(
      body:  CustomScrollView(
          slivers: <Widget>[
            appBar,
            SliverList(delegate: SliverChildListDelegate([Container()]),)
          ],
        ),
    );
  }
}