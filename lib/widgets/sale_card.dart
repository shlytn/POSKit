import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SaleCard extends StatelessWidget {
  const SaleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat("#,##0", "en_US");
    return Container(
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/food.jpg'),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tuna Salad',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 28.0),
                Text(
                  'Rp.${formatCurrency.format(10000)}.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: secondaryColor),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Container(
            width: 41.0,
            height: 39.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: secondaryColor),
            child: Center(
              child: Text(
                "80",
                style: TextStyle(color: onSecondary),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
