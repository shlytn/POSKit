import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

enum AuthState { uninitialized, authenticated, authenticating, unauthenticated }

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;

  AuthProvider.instance(): _firebaseAuth = FirebaseAuth.instance {
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  }

  AuthState _state = AuthState.uninitialized;
  late User _user;
  String _message = '';

  String get message => _message;

  AuthState get state => _state;

  User get user => _user;

  Future<dynamic> signUp(String name, String email, String password) async {
    try {
      _state = AuthState.authenticating;
      notifyListeners();
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      user?.updateDisplayName(name);
      if (user != null) {
        _state = AuthState.authenticated;
        notifyListeners();
      }
      return true;
    } on FirebaseAuthException catch (e) {
      _state = AuthState.unauthenticated;
      notifyListeners();
      _message = getMessageFromErrorCode(e);
      return _message;
    } catch (e) {
      _state = AuthState.unauthenticated;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }

  Future<dynamic> signIn(String email, String password) async {
    try {
      _state = AuthState.authenticating;
      notifyListeners();
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return _message = e.message.toString();
    } catch (e) {
      _state = AuthState.unauthenticated;
      notifyListeners();
      return _message = 'Error: $e';
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> _onAuthStateChanged(User? firebaseUser) async {
    if (firebaseUser == null) {
      _state = AuthState.unauthenticated;
    } else {
      _user = firebaseUser;
      _state = AuthState.authenticated;
    }
    notifyListeners();
  }

  String getMessageFromErrorCode(FirebaseAuthException e) {
    switch (e.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Server error, please try again later.";
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
      default:
        return "Login failed. Please try again.";
    }
  }
}
