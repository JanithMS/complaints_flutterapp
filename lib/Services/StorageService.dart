import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:complaints_app/Models/CloudStorageClass.dart';

class CloudStorageService {
  File imageToUpload;
  String title;
  CloudStorageService(this.title, this.imageToUpload);
  Future<CloudStorageResult> uploadImage() async {
    var imageFileName =
        title + ' ' + DateTime.now().millisecondsSinceEpoch.toString();
    final StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);
    StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
    var downloadURL = await storageTaskSnapshot.ref.getDownloadURL();

    if (uploadTask.isComplete) {
      var url = downloadURL.toString();
      return CloudStorageResult(imageURL: url, imageFileName: imageFileName);
    }
    return null;
  }
}
