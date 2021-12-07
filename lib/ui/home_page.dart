import 'package:dicoding_capstone_pos/ui/history_page.dart';
import 'package:dicoding_capstone_pos/ui/product_list_page.dart';
import 'package:dicoding_capstone_pos/ui/settings_page.dart';
import 'package:dicoding_capstone_pos/ui/stat_page.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  static const routeName = '/home';
  static const pageTitle = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: FancyBottomNavigation(
        onTabChangedListener: _onBottomNavTapped,
        tabs: _bottomNavBarItems,
      ),
    );
  }

  void _onBottomNavTapped(int position) {
    setState(() {
      _bottomNavIndex = position;
    });
  }

  final List<Widget> _listWidget = [
    StatPage(),
    const ProductListPage(),
    HistoryPage(),
    SettingsPage(),
  ];

  final List<TabData> _bottomNavBarItems = [
    TabData(
      iconData: CupertinoIcons.home,
      title: HomePage.pageTitle,
    ),
    TabData(
      iconData: CupertinoIcons.square_grid_2x2,
      title: ProductListPage.pageTitle,
    ),
    TabData(
      iconData: CupertinoIcons.square_list,
      title: HistoryPage.pageTitle,
    ),
    TabData(
      iconData: CupertinoIcons.person,
      title: SettingsPage.pageTitle,
    ),
  ];
}