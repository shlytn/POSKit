import 'package:dicoding_capstone_pos/data/models/history.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/provider/auth_provider.dart';
import 'package:dicoding_capstone_pos/provider/cart_provider.dart';
import 'package:dicoding_capstone_pos/provider/database_provider.dart';
import 'package:dicoding_capstone_pos/provider/history_provider.dart';
import 'package:dicoding_capstone_pos/provider/image_picker_provider.dart';
import 'package:dicoding_capstone_pos/ui/auth/email_sent_page.dart';
import 'package:dicoding_capstone_pos/ui/auth/forgot_password_page.dart';
import 'package:dicoding_capstone_pos/ui/history/history_detail_page.dart';
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
import 'package:dicoding_capstone_pos/ui/profile/settings/change_password_page.dart';
import 'package:dicoding_capstone_pos/ui/profile/help/add_product.dart';
import 'package:dicoding_capstone_pos/ui/profile/help/help_page.dart';
import 'package:dicoding_capstone_pos/ui/profile/settings/settings_page.dart';
import 'package:dicoding_capstone_pos/ui/result/failed_page.dart';
import 'package:dicoding_capstone_pos/ui/result/success_page.dart';
import 'package:dicoding_capstone_pos/utils/auth_wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Phoenix(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider.instance()),
        ChangeNotifierProvider(
          create: (_) => DatabaseProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ImagePickerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HistoryProvider(),
        ),
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
        initialRoute: AuthWrapper.routeName,
        routes: {
          AuthWrapper.routeName: (context) => const AuthWrapper(),
          OnboardingPage.routeName: (context) => const OnboardingPage(),
          LoginPage.routeName: (context) => LoginPage(),
          SignUpPage.routeName: (context) => SignUpPage(),
          HomePage.routeName: (context) => const HomePage(),
          ProductListPage.routeName: (context) => const ProductListPage(),
          AddUpdateProductPage.routeName: (context) => AddUpdateProductPage(
                item: ModalRoute.of(context)?.settings.arguments as Item?,
              ),
          CartPage.routeName: (context) => const CartPage(),
          OrderDetailPage.routeName: (context) => const OrderDetailPage(),
          HistoryDetailPage.routeName: (context) => HistoryDetailPage(
            history: ModalRoute.of(context)?.settings.arguments as History,
          ),
          AccountPage.routeName: (context) => const AccountPage(),
          ForgotPasswordPage.routeName: (context) => const ForgotPasswordPage(),
          SettingsPage.routeName: (context) => const SettingsPage(),
          ChangePasswordPage.routeName: (context) => ChangePasswordPage(),
          EmailSentPage.routeName: (context) => const EmailSentPage(),
          UserHelpPage.routeName: (context) => const UserHelpPage(),
          AddProductHelp.routeName: (context) => const AddProductHelp(),
          SuccessPage.routeName: (context) => const SuccessPage(),
          FailedPage.routeName: (context) => const FailedPage()
        },
      ),
    );
  }
}
