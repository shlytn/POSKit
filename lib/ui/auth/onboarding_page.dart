import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/ui/auth/login_page.dart';
import 'package:dicoding_capstone_pos/ui/auth/signup_page.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = '/welcome';

  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final dotsDecorator = DotsDecorator(
    size: const Size.square(9.0),
    activeSize: const Size(18.0, 9.0),
    activeShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: IntroductionScreen(
                globalHeader: Align(
                  alignment: Alignment.topLeft,
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(top: 16, right: 16),
                      child: SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset('assets/images/logo/logo.png')),
                    ),
                  ),
                ),
                pages: _listPageViewModel,
                showDoneButton: false,
                showNextButton: false,
                // isBottomSafeArea: true,
                dotsDecorator: dotsDecorator,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundedButton(
                      onClick: () =>
                          Navigator.pushNamed(context, SignUpPage.routeName),
                      text: SignUpPage.pageTitle),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginPage.routeName),
                    child: const Text(LoginPage.pageTitle,
                        style:
                            TextStyle(fontSize: 16.0, color: secondaryColor)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<PageViewModel> _listPageViewModel = [
    PageViewModel(
        title: "Easy Management",
        body:
            "Manage your transaction and products easier and quicker\nProvide transaction history alongside with stat",
        image: Center(
          child: Image.asset("assets/images/onboarding/screen1.png"),
        ),
        decoration: const PageDecoration(imagePadding: EdgeInsets.all(0.0))),
    PageViewModel(
      title: "Increased Efficiency",
      body: "More productive and time saving, help reduce numbers of operation",
      image: Center(
        child: Image.asset("assets/images/onboarding/screen2.png"),
      ),
    ),
    PageViewModel(
      title: "More Accuracy",
      body: "Minimalist mistake in your transaction",
      image: Center(
        child: Image.asset("assets/images/onboarding/screen3.png"),
      ),
    ),
  ];
}
