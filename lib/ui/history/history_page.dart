import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/widgets/history_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  static const routeName = '/history';
  static const pageTitle = 'History';

  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Center(child: Text('History Transaction')),
        shadowColor: Colors.white54,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
            child: ListHistory(),
          );
        },
        itemCount: 2,
      ),
    );
  }
}
