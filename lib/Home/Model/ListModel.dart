import 'package:flutter/material.dart';

class ListModel{
  final String title;
  final String author;
  final List<Image> image;
  final Image icon;
  ListModel(this.title, this.author, this.icon, this.image);
}