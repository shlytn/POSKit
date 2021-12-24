import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/provider/database_provider.dart';
import 'package:dicoding_capstone_pos/ui/auth/onboarding_page.dart';
import 'package:dicoding_capstone_pos/ui/profile/help/help_page.dart';
import 'package:dicoding_capstone_pos/ui/profile/settings/settings_page.dart';
import 'package:dicoding_capstone_pos/widgets/row_menu.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  static const routeName = '/account';
  static const pageTitle = 'Account';

  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<DatabaseProvider>(context).profile;

    var profileImage = profile["profile_image"];
    dynamic image;
    if (profileImage != null) {
      image = NetworkImage(profileImage);
    } else {
      image = const AssetImage('assets/images/pp.jpg');
    }

    var user = Provider.of<AuthProvider>(context).user;
    var name = user.displayName != null && user.displayName != ''
        ? user.displayName
        : 'Anonymous';

    var padding = const EdgeInsets.only(
      top: 12.5,
      bottom: 12.5,
      left: 4.0,
      right: 18.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Account'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: image,
                  maxRadius: 40,
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black),
                    ),
                    Text(user.email!)
                  ],
                )
              ],
            ),
            spacing(22.0),
            RowMenu(
              title: 'Setting Account',
              padding: padding,
              onClick: () {
                Navigator.pushNamed(context, SettingsPage.routeName);
              },
            ),
            const Divider(
              height: 1,
            ),
            RowMenu(
                title: 'User Help',
                padding: padding,
                onClick: () {
                  Navigator.pushNamed(context, UserHelpPage.routeName);
                }),
            const Divider(
              height: 1,
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.systemRed),
                borderRadius: BorderRadius.circular(5),
              ),
              height: 60.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false).signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, OnboardingPage.routeName, (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  onPrimary: CupertinoColors.systemRed,
                  elevation: 0,
                ),
                child: const Text(
                  'Log out',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
