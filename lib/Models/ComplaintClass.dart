import 'package:firebase_database/firebase_database.dart';

class ComplaintsClass {
  static const KEY = "key";
  static const TITLE = "title";
  static const DESCRIPTION = "description";
  static const IMAGE = "image";

  String key;
  String title;
  String description;
  String image;

  ComplaintsClass(this.title, this.description, this.image);

  ComplaintsClass.fromSnapshot(DataSnapshot snap)
      : this.key = snap.key,
        this.title = snap.value[TITLE],
        this.description = snap.value[DESCRIPTION],
        this.image = snap.value[IMAGE];
  // ComplaintsClass.fromSnapshot(DataSnapshot snap)
  //     : this.title = snap.value[TITLE],
  //       this.description = snap.value[DESCRIPTION],
  //       this.image = snap.value[IMAGE];
  Map toMap() {
    return {TITLE: title, DESCRIPTION: description, IMAGE: image};
  }
}

class ComplaintsClass2 {
  final String title;
  final String description;
  final String image;
  ComplaintsClass2({this.title, this.description, this.image});
}
