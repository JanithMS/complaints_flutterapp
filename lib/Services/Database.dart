import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:complaints_app/Models/ComplaintClass.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference complaintCollection =
      Firestore.instance.collection('Complaints');

  Future<void> updateUserData(
      String title, String description, String image) async {
    return await complaintCollection.document(uid).setData({
      'title': title,
      'description': description,
      'image': image,
    });
  }

  // Complaint list from snapshot
  List<ComplaintsClass> _complaintListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return ComplaintsClass(
          title: doc.data['title'] ?? '',
          description: doc.data['description'] ?? '',
          image: doc.data['image'] ?? '');
    }).toList();
  }

  // get brews stream
  Stream<List<ComplaintsClass>> get brews {
    return complaintCollection.snapshots().map(_complaintListFromSnapshot);
  }
}
