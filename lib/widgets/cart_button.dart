import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class CartButton extends StatelessWidget {
  final String route;

  const CartButton({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartProvider>(context);
    final formatCurrency = NumberFormat("#,##0", "en_US");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        style: ElevatedButton.styleFrom(
            primary: secondaryColor, onPrimary: Colors.white),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const WidgetSpan(
                      child: Padding(
                        padding: EdgeInsets.only(right: 4.0),
                        child: Icon(CupertinoIcons.cart_fill, size: 18),
                      ),
                    ),
                    TextSpan(text: '${provider.totalItem} items')
                  ],
                ),
              ),
              Text('Total: Rp. ${formatCurrency.format(provider.totalPrice)}')
            ],
          ),
        ),
      ),
    );
  }
}
