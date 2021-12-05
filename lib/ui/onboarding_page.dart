import 'package:dicoding_capstone_pos/ui/login_page.dart';
import 'package:dicoding_capstone_pos/ui/signup_page.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  static const routeName = '/welcome';

  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
                onClick: () {},
                text: LoginPage.pageTitle),
            const SizedBox(
              height: 16.0,
            ),
            RoundedButton(
                onClick: () {},
                text: SignUpPage.pageTitle),
          ],
        ),
      ),
    );
  }
}
