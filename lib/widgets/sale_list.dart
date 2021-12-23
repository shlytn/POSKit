import 'package:dicoding_capstone_pos/widgets/sale_card.dart';
import 'package:flutter/cupertino.dart';

class SaleList extends StatelessWidget {
  const SaleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: SaleCard(),
        );
      },
      itemCount: 3,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }

}