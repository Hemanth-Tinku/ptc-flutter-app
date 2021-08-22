import 'package:firebase_auth/firebase_auth.dart';
import 'package:cdpc/models/user.dart';
import 'package:flutter/foundation.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // FirebaseUser to User
  Student _userFromFirebaseUser(User user) {
    return user != null ? Student(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<Student> get student {
    print('auth state changed');
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      print(e);
      if (e.code == 'user-not-found') {
        return 'No User Found';
      } else if (e.code == 'wrong-password') {
        return 'Wrong Password';
      }
      return null;
    }
  }

  //sign-out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
