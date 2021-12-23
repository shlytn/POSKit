import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/data/models/history.dart';
import 'package:dicoding_capstone_pos/provider/history_provider.dart';
import 'package:dicoding_capstone_pos/widgets/history_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  static const routeName = '/history';
  static const pageTitle = 'History';

  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HistoryProvider>(context);
    final formatCurrency = NumberFormat("#,##0.00", "en_US");

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Center(child: Text('History Transaction')),
        shadowColor: Colors.white54,
      ),
      body: StreamProvider<List<History>>.value(
        value: provider.getHistory(),
        initialData: const [],
        child: const HistorySection(),
      ),
    );
  }
}
