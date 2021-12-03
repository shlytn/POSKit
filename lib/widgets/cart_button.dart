// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:dicoding_capstone_pos/common/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: secondaryColor, onPrimary: Colors.white),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(CupertinoIcons.cart_fill, size: 18),
                      ),
                    ),
                    TextSpan(text: '8 items')
                  ],
                ),
              ),
              Text('Total: \$890.00')
            ],
          ),
        ),
      ),
    );
  }
}
