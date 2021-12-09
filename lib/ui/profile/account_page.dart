// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/ui/auth/onboarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  static const routeName = '/account';
  static const pageTitle = 'Account';

  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
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
                  backgroundImage: AssetImage('assets/images/pp.jpg'),
                  maxRadius: 40,
                ),
                SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Store',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    Text('082112344321'),
                    Text('Owner@gmail.com')
                  ],
                )
              ],
            ),
            SizedBox(height: 22.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Setting Account',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subscription history',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Business Information',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dashboard',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'User Help',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                  ),
                ),
              ],
            ),
            Divider(
              height: 1,
            ),
            Spacer(),
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
                child: Text(
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
