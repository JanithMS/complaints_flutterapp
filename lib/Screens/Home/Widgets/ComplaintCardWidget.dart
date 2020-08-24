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
      child: Row(
        children: [
          Container(
              width: 80.0,
              child: FittedBox(fit: BoxFit.fitWidth, child: Image.file(image))),
          SizedBox(
            width: 10.0,
          ),
          Column(
            children: [
              Text('$title',
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.black)),
              Text('$description',
                  overflow: TextOverflow.clip, style: TextStyle(fontSize: 15.0))
            ],
          ),
        ],
      ),
    );
  }
}
