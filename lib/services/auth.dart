import 'package:firebase_auth/firebase_auth.dart';
import 'package:gift_idea/model/user.dart';
import 'package:gift_idea/services/database.dart';

class AuthService {
  final FirebaseAuth _auth= FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(uid: user.uid):null;
  }

  Stream<MyUser?> get user {
    return _auth.authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  // Sign in Anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in email pass
  Future signInEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }

  }

  // Register with email pass
  Future registerEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateUserData('new user', 'wishOne', 'wishTwo', 'wishThree');
      return _userFromFirebaseUser(user);
    }
    catch(e) {
      print(e.toString());
      return null;
    }

  }

  // sign out
Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
}

}