import 'package:apptesting/BaseComponents/AppBarPinned.dart';
import 'package:apptesting/BaseComponents/AppStandardBar.dart';
import 'package:apptesting/BaseComponents/SideMenu.dart';
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
      drawerEdgeDragWidth: 60,
      drawerScrimColor: Theme.of(context).primaryColor.withOpacity(.4),
      drawer: SideMenu(context),
      body:  NestedScrollView(
        headerSliverBuilder:
            (context, value) {
          return [AppStandardBackBar(context, pinned: false,)]
          ;},
          body:
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: <Widget>[
                      ConstrainedBox(
                        child: Column(
                          children: <Widget>[
                            Text("Package Example one ", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),textAlign: TextAlign.start, ),
                            Text("Isarn Keixt Zluter", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,color: Theme.of(context).textTheme.title.color.withOpacity(.4)),textAlign: TextAlign.start, )

                          ],
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                        ),
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width - 140
                        ),
                      ),
                      Container(
                        child:Image.asset("assets/images/icon1.png"),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle
                        ),
                        height: 100,
                        width: 100,
                      )


                        ],
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                      ),
                    ),
                Expanded(child: ListItem(),),
                FlatButton(onPressed: (){},child: Text("Agregar a WhatsApp"), color: Colors.green)
                  ],
                ),
              )


      ),
    );
  }
}