import 'package:dicoding_capstone_pos/data/api/auth_service.dart';
import 'package:dicoding_capstone_pos/widgets/empty_widget.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/profile';
  static const pageTitle = 'Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        // height: double.infinity,
        child: RoundedButton(onClick: (){
          context.read<AuthService>().signOut();
        }, text: 'Log Out',)
      ),
    );
  }
}