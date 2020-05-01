import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarPinned extends StatelessWidget{
  final String title;
  final Color color;
  AppBarPinned(BuildContext context, {this.title, this.color});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(leading: Builder(
      builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: Colors.white,),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          }
      ),
    ),
      title: Text(title ?? ""),
      backgroundColor: color,
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
      leading: BackButton(color:Theme.of(context).brightness == Brightness.dark ? Colors.blue: Colors.white,),
      title: Text(title ?? ""),);
  }

}