import 'package:complaints_app/Models/ComplaintClass.dart';
import 'package:complaints_app/Screens/Home/Widgets/ComplaintCardWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MyComplaints extends StatefulWidget {
  final String userID;
  MyComplaints({this.userID});
  @override
  _MyComplaintsState createState() => _MyComplaintsState();
}

class _MyComplaintsState extends State<MyComplaints> {
  FirebaseDatabase _database = FirebaseDatabase.instance;
  List<ComplaintsClass> lists = <ComplaintsClass>[];
  @override
  void initState() {
    super.initState();
    _database.reference().child(widget.userID).onChildAdded.listen(_childAdded);
  }

  @override
  Widget build(BuildContext context) {
    //print('MyComplaint: ID found this is : ${widget.userID}');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Visibility(
          visible: lists.isEmpty,
          child: Center(
            child: Text(
              'No Complaints',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  fontSize: 25.0),
            ),
          ),
        ),
        Visibility(
          visible: lists.isNotEmpty,
          child: Flexible(
              child: FirebaseAnimatedList(
                  query: _database.reference().child(widget.userID),
                  itemBuilder: (_, DataSnapshot snap,
                      Animation<double> animation, int index) {
                    return ComplaintsWidget(
                        title: lists[index].title,
                        description: lists[index].description,
                        image: lists[index].image);
                  })),
        )
      ],
    );
  }

  _childAdded(Event event) {
    setState(() {
      lists.add(ComplaintsClass.fromSnapshot(event.snapshot));
    });
  }
}
