import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/provider/cart_provider.dart';
import 'package:dicoding_capstone_pos/ui/result/success_page.dart';
import 'package:dicoding_capstone_pos/widgets/order_detail_list.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final provider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Order Details'),
      ),
      body: StreamProvider<List<CartItem>>.value(
        value: provider.getCart(),
        initialData: const [],
        child: Column(
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
                  const Padding(
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
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
            spacing(8.0),
            Wrap(
              spacing: 8,
              children: List.generate(
                _choicesList.length,
                (index) {
                  return ChoiceChip(
                    labelPadding: const EdgeInsets.all(2.0),
                    label: Text(
                      _choicesList[index],
                      style: const TextStyle(color: Colors.white),
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
            spacing(20.0),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: OrderDetailList(),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, SuccessPage.routeName);
                },
                style: ElevatedButton.styleFrom(
                    primary: secondaryColor, onPrimary: Colors.white),
                child: const SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Center(
                    child: Text(
                      'Confirm Order',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    defaultChoice = 0;
  }
}
