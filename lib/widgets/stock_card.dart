import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/ui/list/add_update_product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final Item item;

  const StockCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Navigator.pushNamed(context, AddUpdateProductPage.routeName,
            arguments: true);
      },
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: item.imageUrl != null
                  ? Image.network(
                      item.imageUrl!,
                      height: 100.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/food.jpg',
                      height: 100.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${item.name}\n\n',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextSpan(
                    text: "${item.stock!}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: secondaryColor,
                    ),
                  ),
                  const TextSpan(
                    text: ' left',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
