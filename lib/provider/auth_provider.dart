import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/api/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

enum AuthState { uninitialized, authenticated, authenticating, unauthenticated }

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;

  AuthProvider.instance() : _firebaseAuth = FirebaseAuth.instance {
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
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        user.updateDisplayName(name);
        await user.reload();
        user = _firebaseAuth.currentUser;
        _user = user!;
        _state = AuthState.authenticated;
        notifyListeners();
        await DatabaseService().setUserProfile(null);
      }
      return true;
    } on FirebaseAuthException catch (e) {
      _state = AuthState.unauthenticated;
      _message = getMessageFromErrorCode(e, "Sign Up");
      notifyListeners();
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
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      _state = AuthState.unauthenticated;
      _message = getMessageFromErrorCode(e, "Login");
      notifyListeners();
      return _message;
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

  Future<dynamic> changePassword(
      String currentPassword, String newPassword) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        final credential = EmailAuthProvider.credential(
            email: user.email!, password: currentPassword);

        await user.reauthenticateWithCredential(credential);
        await user.updatePassword(newPassword);

        return _message = "Password changed Succeeded";
      }
    } on FirebaseAuthException catch (e) {
      return _message = e.message.toString();
    } catch (e) {
      return _message = 'Error: $e';
    }
  }

  Future<dynamic> updateProfile(String name) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        await user.updateDisplayName(name);
        await user.reload();
        user = _firebaseAuth.currentUser;
        _user = user!;
        _message = "Changes Saved";
      }
    } catch (e) {
      _message = "Failed to save account changes";
    }
    notifyListeners();
  }

  Future<dynamic> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      _message = "Password Reset sent to Email";
      notifyListeners();
      return true;
    } catch (e) {
      _message = "Failed to send email";
      notifyListeners();
      return false;
    }
  }

  String getMessageFromErrorCode(FirebaseAuthException e, String auth) {
    switch (e.code) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Please go to login page.";
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
        return "$auth failed. Please try again. Make sure your internet are connected.";
    }
  }
}
