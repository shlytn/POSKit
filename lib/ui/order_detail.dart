// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  static const routeName = '/order_detail';
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  int? defaultChoice;
  final List<String> _choicesList = ['Take Away', 'Delivery', 'Dine In'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Order Details'),
      ),
      body: Column(
        children: [
          Container(
            height: 56.0,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: CupertinoColors.lightBackgroundGray),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Customer',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Wrap(
            spacing: 8,
            children: List.generate(
              _choicesList.length,
              (index) {
                return ChoiceChip(
                  labelPadding: EdgeInsets.all(2.0),
                  label: Text(
                    _choicesList[index],
                    style: TextStyle(color: Colors.white),
                  ),
                  selected: defaultChoice == index,
                  selectedColor: secondaryColor,
                  onSelected: (value) {
                    setState(() {
                      defaultChoice = value ? index : defaultChoice;
                    });
                  },
                  elevation: 0,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                ListView.separated(
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                        Text('Tuna Salad'),
                        SizedBox(width: 60),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text('\$10.99'),
                        )
                      ],
                    );
                  },
                ),
                Divider(),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discount', style: TextStyle(fontSize: 16)),
                    Container(
                      height: 9,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 9,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Divider(),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      '\$10.99',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Divider(),
                SizedBox(height: 8.0),
                Center(
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                        primary: CupertinoColors.systemRed),
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.trash),
                    label: Text('Delete Order'),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
                    Text('Total: \$890.00')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    defaultChoice = 0;
  }
}
