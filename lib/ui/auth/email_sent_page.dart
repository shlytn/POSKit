import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/ui/auth/onboarding_page.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EmailSentPage extends StatelessWidget {
  static const routeName = '/email_sent_success';

  const EmailSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/mail.png',
              width: width * 0.7,
            ),
            const Text(
              "Check your Email",
              style: TextStyle(
                fontSize: 28.0,
                color: onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "We have sent password recover instruction to your email.",
              style: TextStyle(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            spacing(50.0),
            RoundedButton(
              text: 'Return to Login',
              onClick: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, OnboardingPage.routeName, (route) => false);
              },
            ),
            TextButton(
              child: const Text(
                'Resend Email?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: secondaryColor,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
