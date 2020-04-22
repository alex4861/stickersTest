
import 'package:apptesting/Home/Model/ListModel.dart';
import 'package:apptesting/Home/ViewModel/ListViewModel.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget{
  final List<ListModel> tripList = ListViewModel().getData();

  @override
  Widget build(BuildContext context){
    return Container(
      child: new ListView.builder(
        itemCount: tripList.length,
        itemBuilder: (BuildContext context, int index)=> buildTripCard(context, index),
      )
    );
  }
  Widget buildTripCard(BuildContext context, int index){
    final trip = tripList[index];
    return new Container(
        child: Card(
            margin: EdgeInsets.only(left: 12,right: 12,top: 12),
          child: Padding(
            padding: EdgeInsets.all(12),
              child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image(
                                image: trip.icon.image,
                                width: 100,
                                height: 100
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              children: <Widget>[
                                Text(trip.title,),
                                Text(trip.author),
                              ],
                            ),
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
    );
  }

}