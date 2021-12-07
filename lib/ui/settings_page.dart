import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/ui/onboarding_page.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/profile';
  static const pageTitle = 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24.0),
        alignment: Alignment.center,
        child: RoundedButton(onClick: (){
          Provider.of<AuthProvider>(context, listen: false).signOut();
          Navigator.pushNamedAndRemoveUntil(
              context, OnboardingPage.routeName, (route) => false);
        }, text: 'Log Out',)
      ),
    );
  }
}