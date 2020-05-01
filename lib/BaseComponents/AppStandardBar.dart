import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStandardBar extends StatelessWidget {
  AppStandardBar(BuildContext context, {this.isCupertino, this.pinned, this.title});
  final bool isCupertino;
  final bool pinned;
  final String title;

  @override
  Widget build(BuildContext context) {
    return isCupertino ?? false ?
    CupertinoSliverNavigationBar(
      automaticallyImplyTitle: false,
      backgroundColor: Theme.of(context).brightness == Brightness.light ? Colors.blue: null,
      leading: Builder(
        builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Theme.of(context).brightness == Brightness.dark ? Colors.blue :Colors.white,),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            }
        ),
      ),
      largeTitle: Text("asdasdas",style: TextStyle(color:Colors.white),)):
    SliverAppBar(
      leading: Builder(
        builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Theme.of(context).brightness == Brightness.dark ? Colors.blue :Colors.white,),
            onPressed: (){
              Scaffold.of(context).openDrawer();
            }
        ),
      ),
      title: Text(title ?? ""),
      bottom: TabBar(
          tabs: [
            Tab(child: Icon(CupertinoIcons.home)),
            Tab(child: Icon(CupertinoIcons.search)),
            Tab(child: Icon(CupertinoIcons.heart)),
            Tab(child: Icon(CupertinoIcons.time)),
            Tab(child: Icon(CupertinoIcons.profile_circled)),

          ],
        indicatorColor: Theme.of(context).brightness == Brightness.dark? Colors.blueAccent: Colors.white,
        labelColor: Theme.of(context).brightness == Brightness.dark? Colors.blueAccent: Colors.white,
        unselectedLabelColor: Theme.of(context).brightness == Brightness.dark? Colors.blueGrey: Colors.white70,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
    ),
      floating: true,
      pinned: pinned?? true,

    );
  }

}
class AppStandardBackBar extends StatefulWidget {
  AppStandardBackBar(BuildContext context, {this.pinned, this.title});
  final pinned;
  final String title;
  @override
  _AppStandardBackBarState createState() => _AppStandardBackBarState(pinned:pinned, title: title);
}


class _AppStandardBackBarState extends State<AppStandardBackBar> {
  _AppStandardBackBarState({this.pinned, this.title});
  final bool pinned;
  String previousTitle;
  String title;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(leading: BackButton(color:Theme.of(context).brightness == Brightness.dark ? Colors.blue: Colors.white,),
      title: Text(title ?? ""),
      floating: true,
      pinned: pinned,
    );
  }
}