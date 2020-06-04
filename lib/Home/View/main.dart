import 'dart:io';

import 'package:apptesting/BaseComponents/AppBarPinned.dart';
import 'package:apptesting/BaseComponents/SideMenu.dart';
import 'package:apptesting/BaseComponents/ThemeManager.dart';
import 'package:apptesting/Home/View/ListItem.dart';
import 'package:apptesting/Profile/View/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'components/TabBarView.dart';


main()  => runApp(MyApp());
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeManager>(
      create: (_) => ThemeManager(context),
      child: Consumer<ThemeManager>( builder: (context, manager,_){
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: ChangeNotifierProvider<BottomNavigationBarProvider>(
            child:MyHomePage(title: 'Testing App'),
            create: (BuildContext context) => BottomNavigationBarProvider(),
          ),
          theme: manager.themeData,
          darkTheme: manager.themeDataDark,
        );
      },
      ),
    );

  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentTab = [
    ListItem(),
    Container(child:Center(child:Text("uno"))),
    Container(child:Center(child:Text("dos"))),
    Container(child:Center(child:Text("tres"))),
    Container(child:Center(child:Text("cuatro"))),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return DefaultTabController(
        length: 5,
        child:
        Scaffold(
            drawerEdgeDragWidth: 60,
            drawerScrimColor: Theme.of(context).primaryColor.withOpacity(.4),
            drawer: SideMenu(context),
          appBar: AppBarPinned(context, title: widget.title).build(context),
          body:  TabBarView(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverList(delegate: SliverChildListDelegate([ListItem()]),)
                ],
              ),
              Container(
                  child:Column(children: <Widget>[
                    IconButton(onPressed: () async {
                      imageA = await ImagePicker.pickImage(
                          source: ImageSource.gallery
                      );

                      if ( imageA != null ) {

                      }

                      setState(() {});
                    },icon: Icon(Icons.image)),
                    CustomTabBarView(context).galleryPicture()
                  ],)

              ),
              Container(child:Center(child:Text("dos"))),
              Container(child:Center(child:Text("tres"))),
              Profile(),
            ],
          ),
            bottomNavigationBar: bottomTabBar
        )
    );

  }
  File imageA;
  FileImage image;




  Widget _galleryPicture() {
      return Image(
        image: imageA != null? FileImage(imageA) :  AssetImage('assets/images/icon1.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
  }

  Widget get bottomTabBar{
        return
          Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black54.withOpacity(.5),
                    blurRadius: 2.0,
                    offset: Offset(0.0, 1),
                  )
                ],
              ),
              child:SafeArea(
                child: TabBar(
                  indicatorSize: (TabBarIndicatorSize.label),
                  indicatorPadding: EdgeInsets.symmetric(vertical: 46),
                  indicatorColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.red,
                  tabs: [
                    Tab(
                        icon: Icon(Icons.home, color: Theme.of(context).primaryColor, size: 30,)
                    ),
                    Tab(
                      icon: Icon(Icons.search, color: Theme.of(context).primaryColor, size: 30,),
                    ),
                    Tab(
                      icon: Icon(Icons.favorite_border, color: Theme.of(context).primaryColor, size: 30,),
                    ),
                    Tab(
                      icon: Icon(Icons.hourglass_empty, color: Theme.of(context).primaryColor,),
                    ),
                    Tab(
                      icon: Icon(CupertinoIcons.profile_circled, color: Theme.of(context).primaryColor,),
                    ),

                  ],
                ),
              )
          );

  }

  Widget get bottomNavigationBar{
    var provider = Provider.of<BottomNavigationBarProvider>(context);

    return  BottomNavigationBar(
      elevation: 12,
          currentIndex: provider.currentIndex,
          onTap: (index) {
            provider.currentIndex = index;
          },
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text(""),activeIcon: Icon(Icons.home)),
            BottomNavigationBarItem(icon:  Icon(CupertinoIcons.search), title: Text("")),
            BottomNavigationBarItem(icon:  Icon(Icons.favorite_border), title: Text(""), activeIcon: Icon(Icons.favorite)),
            BottomNavigationBarItem(icon:  Icon(Icons.hourglass_empty), title: Text(""), activeIcon: Icon(Icons.hourglass_full)),
            BottomNavigationBarItem(icon:  Icon(CupertinoIcons.profile_circled), title: Text(""))
          ],
          type: BottomNavigationBarType.fixed,
    );
  }


}


class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;


  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}