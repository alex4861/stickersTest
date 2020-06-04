import 'dart:io';

import 'package:flutter/cupertino.dart';

class CustomTabBarView  {
  CustomTabBarView(BuildContext context);

  Widget galleryPicture() {
    return Image(
      image: imageA != null? FileImage(imageA) :  AssetImage('assets/images/icon1.png'),
      height: 300.0,
      fit: BoxFit.cover,
    );
  }
  File imageA;
  FileImage image;
}