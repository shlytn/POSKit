import 'package:dicoding_capstone_pos/ui/signup_page.dart';
import 'package:dicoding_capstone_pos/widgets/account_check_text.dart';
import 'package:dicoding_capstone_pos/widgets/custom_app_bar.dart';
import 'package:dicoding_capstone_pos/widgets/input_field.dart';
import 'package:dicoding_capstone_pos/widgets/password_field.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  static const pageTitle = 'Login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var email = '';
    var password = '';

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: pageTitle),
              _spacing(24.0),
              InputField(
                label: 'Email',
                hint: "mail@mail.com",
                onChanged: (value) => email = value,
              ),
              _spacing(16.0),
              PasswordField(
                label: 'Password',
                hint: "At least 8 characters",
                onChanged: (value) => password = value,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              _spacing(44.0),
              RoundedButton(onClick: () {}, text: pageTitle),
              _spacing(16.0),
              AccountCheckText(
                isLogin: true,
                onClick: () =>
                    Navigator.pushNamed(context, SignUpPage.routeName),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _spacing(double height) {
    return SizedBox(
      height: height,
    );
  }
}
