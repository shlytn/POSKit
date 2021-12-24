import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/history.dart';
import 'package:dicoding_capstone_pos/widgets/history_detail_list.dart';
import 'package:dicoding_capstone_pos/widgets/order_detail_list.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryDetailPage extends StatelessWidget {
  static const routeName = '/history_detail';

  final History history;

  const HistoryDetailPage({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('Transaction Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextData('Transaction Id', history.id.toString(), 16.0),
            spacing(4.0),
            _buildTextData('Transaction Date', history.dateTime.toString(), 16.0),
            spacing(24.0),
            _buildTextData('Total Items', history.totalItem.toString(), 20.0),
            spacing(12.0),
            HistoryDetailList(items: history.items, totalPrice: history.totalPrice,),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextData(String label, String text, double size) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: "$label\t\t: "),
          TextSpan(
            text: text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
        style: TextStyle(
          fontSize: size,
          color: Colors.black,
        ),
      ),
      textAlign: TextAlign.center,
    );
  }
}
