import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/widgets/sale_card.dart';
import 'package:dicoding_capstone_pos/widgets/stat_card.dart';
import 'package:dicoding_capstone_pos/widgets/stock_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Center(child: Text('Home')),
        shadowColor: Colors.white54,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Expanded(
                  child: StatCard(
                      isProfit: true,
                      isIncrease: true,
                      percentage: "8.00%",
                      total: "Rp 50.000,00"),
                ),
                SizedBox(
                  width: width * 0.025,
                ),
                Expanded(
                  child: StatCard(
                      isProfit: false,
                      isIncrease: true,
                      percentage: "2.13%",
                      total: "150"),
                ),
              ],
            ),
            _spacing(24.0),
            _buildTitleText("Best-Selling Products"),
            _spacing(12.0),
            ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: SaleCard(),
                );
              },
              itemCount: 3,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
            ),
            _spacing(24.0),
            _buildTitleText("Out of Stock!"),
            _spacing(12.0),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: StockCard(),
                  );
                },
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
              ),
            ),
            _spacing(24.0),
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

  Widget _spacing(double height) {
    return SizedBox(
      height: height,
    );
  }
}
