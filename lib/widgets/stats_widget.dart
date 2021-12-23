import 'package:dicoding_capstone_pos/widgets/stat_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat("#,##0.00", "en_US");
    var width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Expanded(
          child: StatCard(
              isProfit: true,
              isIncrease: true,
              percentage: "8.00%",
              total: "Rp. ${formatCurrency.format(50000)}"),
        ),
        SizedBox(
          width: width * 0.025,
        ),
        const Expanded(
          child: StatCard(
              isProfit: false,
              isIncrease: true,
              percentage: "2.13%",
              total: "150"),
        ),
      ],
    );
  }
}
