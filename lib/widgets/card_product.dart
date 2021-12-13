import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/ui/list/add_update_product_page.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (){
        Navigator.pushNamed(context, AddUpdateProductPage.routeName, arguments: true);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                      Text(
                        '(must choose level)',
                        style: TextStyle(
                            fontSize: 12,
                            color: CupertinoColors.inactiveGray),
                      ),
                      spacing(15.0),
                      Text(
                        '\$10.99',
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
                padding: const EdgeInsets.only(right: 20.0, top: 25),
                child: Container(
                  width: 41.0,
                  height: 39.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: secondaryColor),
                  child: IconButton(
                      splashColor: Colors.transparent,
                      iconSize: 24,
                      padding: const EdgeInsets.all(0),
                      color: Colors.white,
                      onPressed: () {},
                      icon: const Icon(CupertinoIcons.add)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}