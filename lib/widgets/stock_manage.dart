import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'input_field.dart';

class StockManage extends StatelessWidget {
  final ValueChanged onStockChanged;
  final ValueChanged onSwitchChange;
  final bool isManage;
  final String? text;

  const StockManage({
    Key? key,
    required this.onStockChanged,
    required this.onSwitchChange,
    required this.isManage,
    this.text,
  }) : super(key: key);

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
              onChanged: onSwitchChange,
            )
          ],
        ),
        const SizedBox(height: 8.0),
        if (isManage)
          InputField(
            label: "Product Stock",
            hint: "e.g. 100",
            text: text,
            type: TextInputType.number,
            onChanged: onStockChanged,
          ),
      ],
    );
  }
}
