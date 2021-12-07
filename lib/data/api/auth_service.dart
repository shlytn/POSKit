import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;

  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn(String email, String password) async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Sign In";
    } on FirebaseAuthException catch (e) {
      return "${e.message}";
    }
  }

  Future<String> signUp(String name, String email, String password) async {
    try{
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      user?.updateDisplayName(name);
      return "Sign Up";
    } on FirebaseAuthException catch (e) {
      return "${e.message}";
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}