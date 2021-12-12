import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/widgets/image_widget.dart';
import 'package:dicoding_capstone_pos/widgets/input_field.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:dicoding_capstone_pos/widgets/row_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';
  static const pageTitle = 'Account Settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthProvider>(context).user;
    var name = user.displayName != null || user.displayName!.trim() != '' ? user.displayName : 'Anonymous';

    return Scaffold(
      appBar: AppBar(title: const Text(pageTitle)),
      body: Container(
        margin: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageWidget(),
            const SizedBox(
              height: 24.0,
            ),
            InputField(
              label: "Business Name",
              text: name,
              hint: "",
            ),
            const SizedBox(
              height: 12.0,
            ),
            InputField(
              label: "Email Address",
              text: user.email,
              hint: "",
              isEnable: false,
            ),
            const SizedBox(
              height: 12.0,
            ),
            RowMenu(
              title: 'Change Password',
              padding: const EdgeInsets.symmetric(vertical: 12.5),
              onClick: () {},
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(text: 'Save Changes', onClick: (){},),
          ],
        ),
      ),
    );
  }
}
