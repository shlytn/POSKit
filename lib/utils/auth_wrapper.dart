import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/ui/home/home_page.dart';
import 'package:dicoding_capstone_pos/ui/auth/onboarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWrapper extends StatelessWidget {
  static const routeName = '/auth';

  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        switch (auth.state) {
          case AuthState.uninitialized:
          case AuthState.unauthenticated:
          case AuthState.authenticating:
            return const OnboardingPage();
          case AuthState.authenticated:
            return const HomePage();
        }
      },
    );
  }
}
