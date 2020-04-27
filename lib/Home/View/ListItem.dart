
import 'package:apptesting/Home/Model/ListModel.dart';
import 'package:apptesting/Home/ViewModel/ListViewModel.dart';
import 'package:apptesting/PackagePreview/View/PackagePreviewView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget{
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final List<ListModel> tripList = ListViewModel().getData();

  @override
  Widget build(BuildContext context){
    return Container(
      child: new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: tripList.length,
        itemBuilder: (BuildContext context, int index)=> buildTripCard(context, index),
      )
    );
  }
  List<bool> stateFavorite;
  Widget buildTripCard(BuildContext context, int index){

    final trip = tripList[index];
    return GestureDetector(
      onTap:(){ Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PackagePreviewView()),
      );},
      child: new Container(
          child: Card(
            margin: EdgeInsets.only(left: 12,right: 12,top: 0, bottom: 12),
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child:Image(image: trip.icon.image, width: 100, height: 100),
                              flex: 1,
                            ),
                            Expanded(
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(trip.title,),
                                      Text(trip.author),
                                    ],
                                  ) ,
                                ),
                              flex: 2,
                            ),
                            Align(
                              child: IconButton(icon: Icon(trip.favorite ? Icons.favorite: Icons.favorite_border, color: Colors.pinkAccent,), onPressed: (){
                                setStateFavorite(tripList, index);
                              }),
                              alignment: Alignment.centerRight,
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: ListViewModel().getThumbnail(tripList,index),
                      )
                    ]
                )

            ),
          )
      ),
    );
  }
  void setStateFavorite(List<ListModel> data, int index){
    setState(() {
      data[index].favorite = !data[index].favorite;
    });
  }
}