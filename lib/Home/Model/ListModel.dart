import 'package:flutter/material.dart';

class ListModel{
  final String title;
  final String author;
  final List<Image> image;
  final Image icon;
  bool favorite;
  ListModel(this.title, this.author, this.icon, this.image, this.favorite);
}