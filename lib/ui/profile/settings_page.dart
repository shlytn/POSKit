import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/provider/database_provider.dart';
import 'package:dicoding_capstone_pos/provider/image_picker_provider.dart';
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

  SettingsPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var auth = Provider.of<AuthProvider>(context);
    var user = auth.user;
    var name = user.displayName != null && user.displayName!.trim() != ''
        ? user.displayName
        : 'Anonymous';
    var newName = '';

    var dbProvider = Provider.of<DatabaseProvider>(context);
    var imageProvider = Provider.of<ImagePickerProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text(pageTitle)),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
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
                    if (_formKey.currentState!.validate()){
                      await auth.updateProfile(newName);
                      if (imageProvider.image != null &&
                          imageProvider.fileName != '') {
                        await dbProvider.getImageUrl(
                            imageProvider.image!, false);
                      }

                      showMessageSnackBar(context, auth.message);
                      imageProvider.clearImage();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
