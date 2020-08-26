import 'package:complaints_app/Models/ComplaintClass.dart';
import 'package:complaints_app/Screens/Home/Widgets/ComplaintCardWidget.dart';
import 'package:flutter/material.dart';

class MyComplaints extends StatefulWidget {
  final List<ComplaintsClass> complaintsClass;
  final Function refresh;
  MyComplaints({this.complaintsClass, this.refresh});
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
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'No Complaints',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                    fontSize: 25.0),
              ),
              Text(
                'Move to New Complaint Screen to Add a Complaint',
                style: TextStyle(color: Colors.pink, fontSize: 10.0),
              ),
              Text(
                'Long Press the Complaint in My Complaints Screen to Delete Complaint',
                style: TextStyle(color: Colors.pink, fontSize: 10.0),
              ),
            ],
          ))
        : Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                    padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                    scrollDirection: Axis.vertical,
                    children: List.generate(
                      widget.complaintsClass.length,
                      (index) {
                        return ComplaintsWidget(
                          title: widget.complaintsClass[index].title,
                          description:
                              widget.complaintsClass[index].description,
                          image: widget.complaintsClass[index].image,
                          delete: () {
                            widget.complaintsClass.removeAt(index);
                            widget.refresh();
                          },
                        );
                      },
                    )),
              ),
            ],
          );
  }
}
