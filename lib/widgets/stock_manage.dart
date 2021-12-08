import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_field.dart';

class StockManage extends StatefulWidget {
  const StockManage({Key? key}) : super(key: key);

  @override
  State<StockManage> createState() => _StockManageState();
}

class _StockManageState extends State<StockManage> {
  var isManage = false;
  var stock = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Manage Stock'),
            Switch(
              value: isManage,
              onChanged: (value) => setState(() {
                isManage = value;
              }),
            )
          ],
        ),
        const SizedBox(height: 8.0),
        if (isManage)
          InputField(
            label: "Product Stock",
            hint: "100",
            type: TextInputType.number,
            onChanged: (value) => stock = int.parse(value),
          ),
      ],
    );
  }
}
