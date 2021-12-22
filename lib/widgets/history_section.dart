import 'package:dicoding_capstone_pos/widgets/history_list.dart';
import 'package:flutter/cupertino.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          child: ListHistory(),
        );
      },
      itemCount: 2,
    );
  }

}