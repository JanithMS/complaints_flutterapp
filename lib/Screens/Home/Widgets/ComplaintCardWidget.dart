import 'package:complaints_app/Utility/ImageConvert.dart';
import 'package:flutter/material.dart';

class ComplaintsWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Function delete;

  ComplaintsWidget({this.title, this.description, this.image, this.delete});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: delete,
        child: Padding(
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
        )
        // child: Container(
        //   margin: EdgeInsets.only(bottom: 10.0),
        //   padding: EdgeInsets.all(10.0),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(5.0), color: Colors.blue[200]),
        //   child: Row(
        //     children: [
        //       Container(
        //           width: 80.0,
        //           child:
        //               FittedBox(fit: BoxFit.fitWidth, child: Image.file(image))),
        //       SizedBox(
        //         width: 10.0,
        //       ),
        //       Column(
        //         children: [
        //           Text('$title',
        //               style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   fontSize: 20.0,
        //                   color: Colors.black)),
        //           Text('$description', style: TextStyle(fontSize: 15.0))
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
