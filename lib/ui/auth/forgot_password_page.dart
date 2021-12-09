import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = '/reset_password';
  static const pageTitle = 'Reset Password';

  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Consumer<AuthProvider>(builder: (context, auth, _) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Please enter your Email Address",
                  style: TextStyle(
                    fontSize: 28.0,
                    color: onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 32.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: onPrimary),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      suffixIcon:
                          _controller.text.isNotEmpty || _controller.text != ''
                              ? GestureDetector(
                                  child: const Icon(CupertinoIcons.xmark,
                                      color: onPrimary),
                                  onTap: () {
                                    _controller.clear();
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  })
                              : null,
                      hintText: "Email Address",
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                RoundedButton(
                  onClick: () {
                    auth.resetPassword(_controller.text);
                    final snackBar = SnackBar(
                      content: Text(auth.message),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  text: "Reset Password",
                )
              ],
            ),
          );
        }));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
