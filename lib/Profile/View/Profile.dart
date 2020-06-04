import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var border = BorderSide(color: Colors.white.withOpacity(.7), width: 2, style: BorderStyle.solid);
    // TODO: implement build
    return Container(
        child:
        Column(
          children: [
            Stack(children: <Widget>[
              Image(
                image: AssetImage("assets/images/background.png"),
                width: MediaQuery.of(context).size.width,
                height: 150,fit: BoxFit.cover,
                color: Theme.of(context).primaryColor,
                colorBlendMode: BlendMode.hue,),
              Positioned(
                  child: Stack(
                    children: [
                      Container(
                          width: 120, height:  120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border(top: border, left: border, right: border, bottom: border),
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image:  galleryPicture()
                              )
                          )
                      ),

                      PositionedDirectional(child: Container(
                        decoration: BoxDecoration(
                          shape:  BoxShape.circle,
                          color: Colors.grey.withAlpha(70)
                        ),
                        child: IconButton(icon: Icon(Icons.camera_alt, color: Colors.white,), onPressed:() => _getImage(),highlightColor: Colors.transparent,),
                      ), bottom:0, end:0,)

                    ],
                  )

              )


            ],
              alignment: AlignmentDirectional.center,
            ),

          ],
        )
    );
  }

  File imageA;
  _getImage() async {
    imageA =  await ImagePicker.pickImage(
        source: ImageSource.gallery
    );
    setState(() {
    });
  }

  galleryPicture() {
    Image a = Image(
      image: imageA != null? FileImage(imageA) :  AssetImage('assets/images/profile.png'),
      height: 300.0,
      fit: BoxFit.cover,
    );
    return a.image;
  }

}