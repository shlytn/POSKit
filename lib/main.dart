import 'package:dicoding_capstone_pos/ui/signup_page.dart';

import 'ui/login_page.dart';
import 'ui/onboarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // theme: CupertinoThemeData(
      //   primaryColor: CupertinoColors.systemBlue,
      // ),
      initialRoute: OnboardingPage.routeName,
      routes: {
        OnboardingPage.routeName: (context) => const OnboardingPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
      },
    );
  }
}
