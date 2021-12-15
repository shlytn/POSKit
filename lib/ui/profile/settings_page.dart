import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/ui/profile/change_password_page.dart';
import 'package:dicoding_capstone_pos/widgets/image_widget.dart';
import 'package:dicoding_capstone_pos/widgets/input_field.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:dicoding_capstone_pos/widgets/row_menu.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';
  static const pageTitle = 'Account Settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthProvider>(context);
    var user = auth.user;
    var name = user.displayName != null && user.displayName!.trim() != ''
        ? user.displayName
        : 'Anonymous';
    var newName = '';

    return Scaffold(
      appBar: AppBar(title: const Text(pageTitle)),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ImageWidget(),
              spacing(24.0),
              InputField(
                  label: "Business Name",
                  text: name,
                  hint: "Enter your Business Name",
                  onChanged: (value) => newName = value),
              spacing(12.0),
              InputField(
                label: "Email Address",
                hint: user.email!,
                isEnable: false,
              ),
              spacing(12.0),
              RowMenu(
                title: 'Change Password',
                padding: const EdgeInsets.symmetric(vertical: 12.5),
                onClick: () {
                  Navigator.pushNamed(context, ChangePasswordPage.routeName);
                },
              ),
              spacing(24.0),
              RoundedButton(
                text: 'Save Changes',
                onClick: () async {
                  await auth.updateProfile(newName);

                  final snackBar = SnackBar(
                    content: Text(auth.message),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
