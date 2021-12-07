import 'package:dicoding_capstone_pos/ui/home_page.dart';
import 'package:dicoding_capstone_pos/ui/onboarding_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  static const routeName = '/auth';
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return HomePage();
    }
    return const OnboardingPage();
  }

}