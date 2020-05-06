import 'package:apptesting/BaseComponents/AppBarPinned.dart';
import 'package:apptesting/Home/View/ListItem.dart';
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
    return Scaffold(
      appBar: BackBarPinned(context, title: "Preview").build(context),
      body:  CustomScrollView(
          slivers: <Widget>[
            SliverList(delegate: SliverChildListDelegate([ListItem()]),)
          ],
        ),
    );
  }
}