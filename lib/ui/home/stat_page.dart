import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/widgets/sale_list.dart';
import 'package:dicoding_capstone_pos/widgets/stats_widget.dart';
import 'package:dicoding_capstone_pos/widgets/stock_list.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatPage extends StatelessWidget {
  const StatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        shadowColor: Colors.white54,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const StatsWidget(),
            spacing(24.0),
            _buildTitleText("Best-Selling Products"),
            spacing(12.0),
            const SaleList(),
            spacing(24.0),
            _buildTitleText("Out of Stock!"),
            spacing(12.0),
            const SizedBox(
              height: 200.0,
              child: StockList(),
            ),
            spacing(24.0),
          ]),
        ),
      ),
    );
  }

  Widget _buildTitleText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
    );
  }
}
