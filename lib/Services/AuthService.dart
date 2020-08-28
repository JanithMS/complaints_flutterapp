import 'package:complaints_app/Models/User.dart';
// import 'package:complaints_app/Services/Database.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

class AuthServices {
  // FirebaseApp _app = Firebase.initializeApp();
  //create an instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //getting userId
  RegistrationUser _getUserFromFirebaseUser(User user) {
    return user != null ? RegistrationUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<RegistrationUser> get user {
    return _firebaseAuth.authStateChanges().map(_getUserFromFirebaseUser);
  }

  //signIn
  Future signIn(String email, String password) async {
    try {
      dynamic result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _getUserFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signUp
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
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
