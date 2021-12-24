import 'package:dicoding_capstone_pos/data/models/history.dart';
import 'package:dicoding_capstone_pos/provider/history_provider.dart';
import 'package:dicoding_capstone_pos/widgets/stat_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HistoryProvider>(context);
    final formatCurrency = NumberFormat("#,##0.00", "en_US");
    var width = MediaQuery.of(context).size.width;

    return StreamBuilder<List<History>>(
      stream: provider.getHistory(),
      builder: (context, snapshot) {
        var totalIncome = snapshot.hasData ? provider.totalIncome : 0;
        var totalTransaction = snapshot.hasData ? provider.totalTransaction : 0;
        return Row(
          children: [
            Expanded(
              child: StatCard(
                  isIncome: true,
                  total: "Rp ${formatCurrency.format(totalIncome)}"),
            ),
            SizedBox(
              width: width * 0.025,
            ),
            Expanded(
              child: StatCard(
                  isIncome: false,
                  total: "$totalTransaction"),
            ),
          ],
        );
      },
    );
  }
}
