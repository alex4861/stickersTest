import 'package:apptesting/Home/Model/ListModel.dart';
import 'package:flutter/material.dart';

class ListViewModel{

  List<ListModel> getData(){
    return
      [new ListModel(
          "Title 1","Author 1",
          Image.asset('assets/images/Group.png',fit: BoxFit.cover),
          [Image.asset('assets/images/icon1.png',fit: BoxFit.cover),Image.asset('assets/images/Group.png',fit: BoxFit.cover),Image.asset('assets/images/Group.png',fit: BoxFit.cover),Image.asset('assets/images/icon1.png',fit: BoxFit.cover),]
      ),
        new ListModel(
            "Title 2","Author 1",
            Image.asset('assets/images/icon1.png',fit: BoxFit.cover),
            [Image.asset('assets/images/icon1.png',fit: BoxFit.cover),Image.asset('assets/images/Group.png',fit: BoxFit.cover),Image.asset('assets/images/icon1.png',fit: BoxFit.cover),Image.asset('assets/images/Group.png',fit: BoxFit.cover),]
        ),
        new ListModel(
            "Title 3","Author 1",
            Image.asset('assets/images/Group.png',fit: BoxFit.cover),
            [Image.asset('assets/images/icon1.png',fit: BoxFit.cover),Image.asset('assets/images/Group.png',fit: BoxFit.cover),Image.asset('assets/images/icon1.png',fit: BoxFit.cover),Image.asset('assets/images/icon1.png',fit: BoxFit.cover),]
        ),
        new ListModel(
            "Title 1","Author 1",
            Image.asset('assets/images/Group.png',fit: BoxFit.cover),
            [Image.asset('assets/images/icon1.png',fit: BoxFit.cover),Image.asset('assets/images/Group.png',fit: BoxFit.cover),Image.asset('assets/images/Group.png',fit: BoxFit.cover),Image.asset('assets/images/icon1.png',fit: BoxFit.cover),]
        ),
        new ListModel(
            "Title 3","Author 1",
            Image.asset('assets/images/Group.png',fit: BoxFit.cover),
            [Image.asset('assets/images/icon1.png',fit: BoxFit.cover),Image.asset('assets/images/Group.png',fit: BoxFit.cover),Image.asset('assets/images/icon1.png',fit: BoxFit.cover),Image.asset('assets/images/icon1.png',fit: BoxFit.cover),]
        ),

      ];
  }
  List<Widget> getThumbnail(List<ListModel> data, int index){
    final trip = data[index];
    List<Widget> image = [];
    trip.image.forEach((actual){
      image.add(Image(
        image: actual.image,
        width: 40.0,
        height: 40.0,
      ));
    });
    return image;
  }
}