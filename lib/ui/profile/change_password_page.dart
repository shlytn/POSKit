import 'package:dicoding_capstone_pos/widgets/input_field.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  static const routeName = '/change_password';
  static const pageTitle = 'Change Password';

  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pageTitle)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              InputField(
                  label: 'Current Password', hint: 'Enter Current Password'),
              spacing(12.0),
              InputField(
                  label: 'New Password', hint: 'Must at least 6 character'),
              spacing(32.0),
              RoundedButton(
                text: 'Update Password',
                onClick: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
