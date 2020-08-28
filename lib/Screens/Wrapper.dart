import 'package:complaints_app/Screens/Authentication/Auth.dart';
import 'package:complaints_app/Screens/Home/Home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:complaints_app/Models/User.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<RegistrationUser>(context);

    return user == null
        ? Auth()
        : HomeComplaints(
            userID: user.uid,
          );
  }
}
