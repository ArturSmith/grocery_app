import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_project/entitis/my_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser? _userFromFirebaseUser(User? user) {
    return user != null ? MyUser(user.uid) : null;
  }

  Stream<MyUser?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebaseUser(user));
  }

  Future signInAnnon() async {
    try {
      UserCredential authResult = await _auth.signInAnonymously();
      User? user = authResult.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }
}
