import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SaleCard extends StatelessWidget {
  final Item item;

  const SaleCard({Key? key, required this.item}) : super(key: key);

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
            child: item.imageUrl != null
                ? Image.network(item.imageUrl!, height: 100.0, fit: BoxFit.cover,)
                : Image.asset('assets/images/food.jpg', height: 100.0, fit: BoxFit.cover,),
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
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                spacing(28.0),
                Text(
                  'Rp.${formatCurrency.format(item.sellingPrice)}.',
                  style: const TextStyle(
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
                "${item.sold}",
                style: const TextStyle(color: onSecondary),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
