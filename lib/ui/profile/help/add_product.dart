import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductHelp extends StatelessWidget {
  static const routeName = '/add_product';
  const AddProductHelp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('User Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bagaimana cara menambahkan barang',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
