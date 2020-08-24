import 'dart:io';

import 'package:flutter/material.dart';

class ComplaintsWidget extends StatelessWidget {
  final File image;
  final String title;
  final String description;

  ComplaintsWidget({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      //height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.blue[200]),
      child: Column(
        children: [
          Text(
            '$title',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black),
          ),
          Text(
            '$description',
            style: TextStyle(fontSize: 15.0),
          ),
          Image.file(image)
        ],
      ),
    );
  }
}
