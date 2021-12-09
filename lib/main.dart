import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/ui/auth/forgot_password_page.dart';
import 'package:dicoding_capstone_pos/ui/list/add_update_product_page.dart';
import 'package:dicoding_capstone_pos/ui/home/home_page.dart';
import 'package:dicoding_capstone_pos/ui/auth/login_page.dart';
import 'package:dicoding_capstone_pos/ui/auth/onboarding_page.dart';
import 'package:dicoding_capstone_pos/ui/list/product_list_page.dart';
import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/ui/profile/account_page.dart';
import 'package:dicoding_capstone_pos/ui/cart/cart_page.dart';
import 'package:dicoding_capstone_pos/ui/cart/order_detail.dart';
import 'package:dicoding_capstone_pos/ui/auth/signup_page.dart';
import 'package:dicoding_capstone_pos/utils/auth_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider.instance()),
      ],
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: Colors.white,
              background: background,
              onPrimary: secondaryColor,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // theme: CupertinoThemeData(
        //   primaryColor: CupertinoColors.systemBlue,
        // ),
        initialRoute: AuthWrapper.routeName,
        routes: {
          AuthWrapper.routeName: (context) => const AuthWrapper(),
          OnboardingPage.routeName: (context) => const OnboardingPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          SignUpPage.routeName: (context) => const SignUpPage(),
          HomePage.routeName: (context) => HomePage(),
          ProductListPage.routeName: (context) => const ProductListPage(),
          AddUpdateProductPage.routeName: (context) => AddUpdateProductPage(
            isUpdate: ModalRoute.of(context)?.settings.arguments as bool,
          ),
          CartPage.routeName: (context) => const CartPage(),
          OrderDetailPage.routeName: (context) => const OrderDetailPage(),
          AccountPage.routeName: (context) => const AccountPage(),
          ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
        },
      ),
    );
  }
}
