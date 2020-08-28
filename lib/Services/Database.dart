import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  String nodeName;
  FirebaseDatabase database = FirebaseDatabase.instance;
  Map complaint;

  DatabaseService(this.nodeName, this.complaint);

  addComplaint() {
    database.reference().child(nodeName).push().set(complaint);
  }
}
