import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoStandardBackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  CupertinoNavigationBar(
      middle: Image(image: Image.asset("assets/images/general_logo_Socio.png").image,height: 25,),
      trailing: Padding(
            padding: EdgeInsets.all(12),
            child:Image.asset("assets/images/img_notification.png"),
          ),);
  }

}
class CupertinoStandardBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  CupertinoNavigationBar(
      leading:IconButton(icon: Icon(Icons.menu), onPressed: null),
      middle: Text("Page one"),
      trailing: Padding(
        padding: EdgeInsets.all(12),
        child:Image.asset("assets/images/img_notification.png"),
      ),);
  }

}