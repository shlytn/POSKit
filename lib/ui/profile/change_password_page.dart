import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/widgets/password_field.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatelessWidget {
  static const routeName = '/change_password';
  static const pageTitle = 'Change Password';

  ChangePasswordPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthProvider>(context);
    var currentPassword = '';
    var newPassword = '';

    return Scaffold(
      appBar: AppBar(title: const Text(pageTitle)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                PasswordField(
                  label: 'Current Password',
                  hint: 'Enter Current Password',
                  onChanged: (value) => currentPassword = value,
                ),
                spacing(12.0),
                PasswordField(
                  label: 'New Password',
                  hint: 'Must at least 6 character',
                  onChanged: (value) => newPassword = value,
                ),
                spacing(32.0),
                RoundedButton(
                  text: 'Update Password',
                  onClick: () async {
                    if (_formKey.currentState!.validate()) {
                      await auth.changePassword(currentPassword, newPassword);

                      final snackBar = SnackBar(
                        content: Text(auth.message),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
