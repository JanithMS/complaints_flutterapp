import 'package:complaints_app/Utility/ImageConvert.dart';
import 'package:flutter/material.dart';

class ComplaintsWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  ComplaintsWidget({this.title, this.description, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.0),
      child: Card(
        //margin: EdgeInsets.only(bottom: 10.0),
        color: Colors.blue[200],
        child: ListTile(
          leading: Utility.imageFromBase64String(image),
          title: Text('$title',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black)),
          subtitle: Text('$description', style: TextStyle(fontSize: 15.0)),
        ),
      ),
    );
  }
}
