import 'package:complaints_app/Models/ComplaintClass.dart';
import 'package:complaints_app/Screens/Home/Widgets/ComplaintCardWidget.dart';
import 'package:flutter/material.dart';

class MyComplaints extends StatefulWidget {
  final List<ComplaintsClass> complaintsClass;
  MyComplaints({this.complaintsClass});
  @override
  _MyComplaintsState createState() => _MyComplaintsState();
}

class _MyComplaintsState extends State<MyComplaints> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.complaintsClass.length == 0
        ? Center(
            child: Text(
            'No Complaints',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pink,
                fontSize: 20.0),
          ))
        : Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      widget.complaintsClass.length,
                      (index) {
                        //print('${widget.complaintsClass[index].title}');
                        //print('${widget.complaintsClass[index].description}');
                        return ComplaintsWidget(
                          title: widget.complaintsClass[index].title,
                          description:
                              widget.complaintsClass[index].description,
                          image: widget.complaintsClass[index].image,
                          //image: _image
                        );
                      },
                    )),
              ),
            ],
          );
  }
}
