import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/ui/list/add_update_product_page.dart';
import 'package:dicoding_capstone_pos/widgets/product_add_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridProductCard extends StatelessWidget {
  final Item item;

  const GridProductCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImageProvider<Object> image;
    if (item.imageUrl != null) {
      image = NetworkImage(item.imageUrl!);
    } else {
      image = const AssetImage('assets/images/food.jpg');
    }

    return GestureDetector(
      onDoubleTap: () {
        Navigator.pushNamed(context, AddUpdateProductPage.routeName,
            arguments: item);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: image,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 3.0),
                    const Text(
                      '(must choose level)',
                      style: TextStyle(
                          fontSize: 12, color: CupertinoColors.inactiveGray),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${item.sellingPrice}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                              fontSize: 16),
                        ),
                        Container(
                          width: 31.0,
                          height: 29.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: secondaryColor),
                          child: ProductAddButton(item: item,),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
