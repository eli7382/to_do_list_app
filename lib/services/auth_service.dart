import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> login(String email, String password) async {
    return _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> register(String email, String password) async {
    return _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  Stream<User?> get userChanges => _auth.userChanges();
}

