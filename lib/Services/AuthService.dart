import 'package:complaints_app/Models/User.dart';
import 'package:complaints_app/Services/Database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //create an instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //getting userId
  User _getUserFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map(_getUserFromFirebaseUser);
  }

  //signIn
  Future signIn(String email, String password) async {
    try {
      dynamic result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _getUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signUp
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new crew member', '');
      return _getUserFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //signOut
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
