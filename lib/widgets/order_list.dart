import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(),
      itemCount: 1,
      itemBuilder: (context, snapshot) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: secondaryColor),
              child: Center(
                child: Text(
                  '1',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(width: 25.0),
            Text('Tuna Salad'),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Text('\$10.99'),
            )
          ],
        );
      },
    );
  }
}
