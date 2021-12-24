import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/provider/database_provider.dart';
import 'package:dicoding_capstone_pos/provider/image_picker_provider.dart';
import 'package:dicoding_capstone_pos/ui/profile/settings/change_password_page.dart';
import 'package:dicoding_capstone_pos/widgets/image_widget.dart';
import 'package:dicoding_capstone_pos/widgets/input_field.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:dicoding_capstone_pos/widgets/row_menu.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';
  static const pageTitle = 'Account Settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  var isEnable = false;

  setEnable(condition) {
    setState(() {
      isEnable = condition;
    });
  }

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
    
    if (imageProvider.image != null && imageProvider.fileName != ''){
      setEnable(true);
    }

    return Scaffold(
      appBar: AppBar(title: const Text(SettingsPage.pageTitle)),
      body: StreamProvider<DocumentSnapshot?>.value(
        value: dbProvider.getUserProfile(),
        initialData: null,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const ImageWidget(),
                  TextButton(
                    child: const Text("Clear Avatar",
                        style: TextStyle(color: secondaryColor)),
                    onPressed: () => dbProvider.setUserProfile(null),
                  ),
                  spacing(24.0),
                  InputField(
                      label: "Business Name",
                      text: name,
                      hint: "Enter your Business Name",
                      onChanged: (value) {
                        newName = value;
                        setEnable(value != name);
                      }),
                  spacing(12.0),
                  InputField(
                    label: "Email Address",
                    text: user.email!,
                    hint: "Email Address",
                    isEnable: false,
                    textColor: Colors.black54,
                  ),
                  spacing(12.0),
                  RowMenu(
                    title: 'Change Password',
                    padding: const EdgeInsets.symmetric(vertical: 12.5),
                    onClick: () {
                      Navigator.pushNamed(
                          context, ChangePasswordPage.routeName);
                    },
                  ),
                  spacing(24.0),
                  RoundedButton(
                    text: 'Save Changes',
                    isEnable: isEnable,
                    onClick: () async {
                      if (_formKey.currentState!.validate()) {
                        await auth.updateProfile(newName);
                        if (imageProvider.image != null &&
                            imageProvider.fileName != '') {
                          final url = await dbProvider.getImageUrl(
                              imageProvider.image!, false);

                          await dbProvider.setUserProfile(url);
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
      ),
    );
  }
}
