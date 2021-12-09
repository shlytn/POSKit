import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/ui/list/add_update_product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  const StockCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
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
              child: Image.asset(
                'assets/images/food.jpg',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Tuna Salad\n\n',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  TextSpan(
                    text: '0',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: secondaryColor,
                    ),
                  ),
                  TextSpan(
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
