import 'package:complaints_app/Models/ComplaintClass.dart';
import 'package:complaints_app/Screens/Home/Widgets/CustomButton.dart';
import 'package:complaints_app/Screens/Home/Widgets/MyComplaints.dart';
import 'package:complaints_app/Screens/Home/Widgets/NewComplaint.dart';
import 'package:complaints_app/Services/AuthService.dart';
import 'package:flutter/material.dart';

class HomeComplaints extends StatefulWidget {
  final AuthServices _auth = AuthServices();
  @override
  _HomeComplaintsState createState() => _HomeComplaintsState();
}

class _HomeComplaintsState extends State<HomeComplaints> {
  PageController pageController = PageController();
  double currentPage;

  List<ComplaintsClass> _complaintsClass;

  void refresh() {
    setState(() {
      pageController.animateToPage(0,
          duration: Duration(milliseconds: 20), curve: Curves.bounceInOut);
    });
  }

  @override
  void initState() {
    super.initState();
    currentPage = 0.0;
    pageController = PageController(initialPage: currentPage.toInt());
    _complaintsClass = [];
  }

  @override
  Widget build(BuildContext context) {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
    //print('$_complaintsClass.title');
    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text('Complaints App'),
          backgroundColor: Colors.blue,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white),
              label: Text('Logout', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await widget._auth.signOut();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: 2.0,
            ),
            Container(
                height: 50,
                color: Colors.blue,
                padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                child: headWidget(context)),
            Expanded(
              child: PageView(
                controller: pageController,
                children: <Widget>[
                  MyComplaints(
                    refresh: refresh,
                    complaintsClass: _complaintsClass,
                  ),
                  NewComplaint(
                    refresh: refresh,
                    complaintsClass: _complaintsClass,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: CustomButton(
              color: currentPage < 0.5 && currentPage < 1 ? Colors.white : null,
              onPressed: () {
                pageController.animateToPage(0,
                    duration: Duration(milliseconds: 20),
                    curve: Curves.bounceInOut);
              },
              textColor: currentPage < 0.5 && currentPage < 1
                  ? Colors.black
                  : Colors.white,
              buttonText: "My Complaint",
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 1,
            child: CustomButton(
              color:
                  currentPage >= 1 && currentPage < 1.5 ? Colors.white : null,
              onPressed: () {
                pageController.animateToPage(1,
                    duration: Duration(milliseconds: 20),
                    curve: Curves.bounceInOut);
              },
              textColor: currentPage >= 1 && currentPage < 1.5
                  ? Colors.black
                  : Colors.white,
              buttonText: "New Complaint",
            )),
      ],
    );
  }
}
