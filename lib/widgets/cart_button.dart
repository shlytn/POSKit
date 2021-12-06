import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: primaryColor, onPrimary: Colors.white),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: Icon(CupertinoIcons.cart_fill, size: 18),
                      ),
                    ),
                    TextSpan(text: '8 items')
                  ],
                ),
              ),
              const Text('Total: \$890.00')
            ],
          ),
        ),
      ),
    );
  }
}