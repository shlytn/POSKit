import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/ui/home/home_page.dart';
import 'package:dicoding_capstone_pos/ui/auth/login_page.dart';
import 'package:dicoding_capstone_pos/widgets/account_check_text.dart';
import 'package:dicoding_capstone_pos/widgets/custom_app_bar.dart';
import 'package:dicoding_capstone_pos/widgets/input_field.dart';
import 'package:dicoding_capstone_pos/widgets/password_field.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  static const routeName = '/sign_up';
  static const pageTitle = 'Sign Up';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = '';
    var email = '';
    var password = '';

    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          return SingleChildScrollView(
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(title: pageTitle),
                    _spacing(24.0),
                    InputField(
                      label: 'Business Name',
                      hint: "Business Name",
                      onChanged: (value) => name = value,
                    ),
                    _spacing(16.0),
                    InputField(
                      label: 'Email',
                      hint: "mail@mail.com",
                      type: TextInputType.emailAddress,
                      onChanged: (value) => email = value,
                    ),
                    _spacing(16.0),
                    PasswordField(
                      label: 'Password',
                      hint: "At least 8 characters",
                      onChanged: (value) => password = value,
                    ),
                    _spacing(44.0),
                    auth.state == AuthState.authenticating
                        ? const Center(child: CircularProgressIndicator())
                        : RoundedButton(
                        onClick: () async {
                          await auth.signUp(name, email, password);

                          if (auth.state == AuthState.authenticated) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, HomePage.routeName, (route) => false);
                          } else {
                            final snackBar = SnackBar(
                              content: Text(auth.message),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                        },
                        text: pageTitle),
                    _spacing(16.0),
                    AccountCheckText(
                      isLogin: false,
                      onClick: () =>
                          Navigator.pushNamed(context, LoginPage.routeName),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Widget _spacing(double height) {
    return SizedBox(
      height: height,
    );
  }
}
