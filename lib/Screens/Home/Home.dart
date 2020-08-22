import 'package:complaints_app/Services/AuthService.dart';
import 'package:flutter/material.dart';

class HomeComplaints extends StatefulWidget {
  final AuthServices _auth = AuthServices();
  @override
  _HomeComplaintsState createState() => _HomeComplaintsState();
}

class _HomeComplaintsState extends State<HomeComplaints> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await widget._auth.signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
