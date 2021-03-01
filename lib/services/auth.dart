import 'package:capyba_app/models/logged_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoggedUser _userFromFirebaseUser(User user) {
    return user != null ? LoggedUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<LoggedUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // signin anonimously
  Future signInAnonimously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;

      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // signin with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // register

  // signout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
}
