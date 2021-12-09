import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/ui/account_page.dart';
import 'package:dicoding_capstone_pos/ui/cart_page.dart';
import 'package:dicoding_capstone_pos/ui/order_detail.dart';
import 'package:dicoding_capstone_pos/ui/product_list_page.dart';
import 'package:dicoding_capstone_pos/ui/signup_page.dart';

import 'ui/login_page.dart';
import 'ui/onboarding_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            primary: Colors.white,
            background: background,
            onPrimary: secondaryColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // theme: CupertinoThemeData(
      //   primaryColor: CupertinoColors.systemBlue,
      // ),
      initialRoute: OnboardingPage.routeName,
      routes: {
        OnboardingPage.routeName: (context) => const OnboardingPage(),
        LoginPage.routeName: (context) => const LoginPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
        ProductListPage.routeName: (context) => const ProductListPage(),
        CartPage.routeName: (context) => const CartPage(),
        OrderDetailPage.routeName: (context) => const OrderDetailPage(),
        AccountPage.routeName: (context) => const AccountPage()
      },
    );
  }
}
