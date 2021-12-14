import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/ui/auth/forgot_password_page.dart';
import 'package:dicoding_capstone_pos/ui/home/home_page.dart';
import 'package:dicoding_capstone_pos/ui/auth/signup_page.dart';
import 'package:dicoding_capstone_pos/widgets/account_check_text.dart';
import 'package:dicoding_capstone_pos/widgets/custom_app_bar.dart';
import 'package:dicoding_capstone_pos/widgets/input_field.dart';
import 'package:dicoding_capstone_pos/widgets/password_field.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';
  static const pageTitle = 'Login';

  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var email = '';
    var password = '';

    return Scaffold(
      body: Consumer<AuthProvider>(builder: (context, auth, _) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(title: pageTitle),
                    spacing(24.0),
                    InputField(
                      label: 'Email',
                      hint: "mail@mail.com",
                      type: TextInputType.emailAddress,
                      onChanged: (value) => email = value,
                    ),
                    spacing(16.0),
                    PasswordField(
                      label: 'Password',
                      hint: "At least 6 characters",
                      onChanged: (value) => password = value,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ForgotPasswordPage.routeName);
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                    spacing(44.0),
                    auth.state == AuthState.authenticating
                        ? const Center(child: CircularProgressIndicator())
                        : RoundedButton(
                            onClick: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                await auth.signIn(email, password);

                                if (auth.state == AuthState.authenticated) {
                                  Navigator.pushNamedAndRemoveUntil(context,
                                      HomePage.routeName, (route) => false);
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text(auth.message),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            },
                            text: pageTitle),
                    spacing(16.0),
                    AccountCheckText(
                      isLogin: true,
                      onClick: () =>
                          Navigator.pushNamed(context, SignUpPage.routeName),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
