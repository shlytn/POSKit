// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:dicoding_capstone_pos/widgets/cart_button.dart';
import 'package:dicoding_capstone_pos/widgets/grid_food.dart';
import 'package:dicoding_capstone_pos/widgets/list_food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  bool isListView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(width: 30),
            ),
            Expanded(
              child: Center(
                child: Text('Cashier'),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.add),
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: CupertinoColors.lightBackgroundGray),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.inactiveGray),
                          ),
                          suffixIcon: Icon(CupertinoIcons.search),
                          labelText: 'search product',
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: CupertinoColors.inactiveGray),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border:
                        Border.all(color: CupertinoColors.lightBackgroundGray),
                  ),
                  child: isListView
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isListView = false;
                            });
                          },
                          icon: Icon(CupertinoIcons.square_grid_2x2),
                        )
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isListView = true;
                            });
                          },
                          icon: Icon(CupertinoIcons.list_bullet),
                        ),
                ),
              )
            ],
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: isListView ? ListViewFood() : GridViewFood(),
          ),
          CartButton(),
          SizedBox(height: 8.0)
        ],
      ),
    );
  }
}
