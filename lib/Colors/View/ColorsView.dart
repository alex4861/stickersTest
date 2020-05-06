import 'package:apptesting/BaseComponents/AppBarPinned.dart';
import 'package:apptesting/BaseComponents/ThemeManager.dart';
import 'package:apptesting/Colors/ViewModel/ColorPreferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorsView extends StatefulWidget{
  @override
  _ColorsViewState createState() => _ColorsViewState();
}

class _ColorsViewState extends State<ColorsView> {

  Color primary = Color(0xFFFFFF);
  Color secondary = Color(0xFFFFFF);
  Color tertiary = Color(0xFFFFFF);


  @override
  void initState() {
    super.initState();
  }

  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  void setCustomColor(Color color) {
    setState(() => primary = color);
  }
  void nothing (Color color ){}
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: Container(
            child:ListView(
            children: [
              ListTile(
                title: Text("Main color"),
                trailing: Icon(CupertinoIcons.collections_solid, color: Theme.of(context).primaryColor,),
                onTap: (){
                  Color previousColor = pickerColor;
                  showDialog(
                    context: context,
                    child: AlertDialog(
                      title: const Text('Pick a color'),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      content: SingleChildScrollView(
                        child: MaterialPicker(
                          pickerColor: pickerColor,
                          onColorChanged: setCustomColor,
                        ),
                        // Use Material color picker:
                        //
                        // child: MaterialPicker(
                        //   pickerColor: pickerColor,
                        //   onColorChanged: changeColor,
                        //   showLabel: true, // only on portrait mode
                        // ),
                        //
                        // Use Block color picker:
                        //
                        // child: BlockPicker(
                        //   pickerColor: currentColor,
                        //   onColorChanged: changeColor,
                        // ),
                      ),
                      actions: <Widget>[

                        FlatButton(
                          child: Text('Cancel', style: TextStyle(color: Theme.of(context).textTheme.title.color)),
                          onPressed: () {
                            setState(() => primary = previousColor);
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('Save',style: TextStyle(color: Theme.of(context).textTheme.title.color)),
                          onPressed: () {

                            setState(() => currentColor = primary);
                            setState(() {
                              var provider = Provider.of<ThemeManager>(context);
                              provider.setColor(currentColor, context);
                            });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              ListTile(
                title: Text("Secondary color"),
                trailing: Icon(CupertinoIcons.collections_solid, color: secondary),
              ),
              ListTile(
                title: Text("Tertiary color"),
                trailing: Icon(CupertinoIcons.collections_solid, color: Theme.of(context).unselectedWidgetColor,),
              )

            ],
            )
        ),
      appBar: BackBarPinned(context, title: "Custom Colors").build(context),
    );
  }


  setColor(String type, Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      String colorString = color.toString(); // Color(0x12345678)
      String valueString = colorString.split('(0x')[1].split(')')[0]; // kind of hacky..
      int value = int.parse(valueString, radix: 16);
      prefs.setInt(type, value);
    });
  }





}