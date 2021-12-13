import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddProductHelp extends StatelessWidget {
  static const routeName = '/add_product_help';
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
            SizedBox(height: 20.0),
            BulletList(
              text: 'Masuk ke halaman List barang',
            ),
            BulletList(
              text: 'Tekan tombol + pada app bar',
            ),
            Center(
              child: SizedBox(
                width: 300,
                child: Image.asset(
                  'assets/images/help/add.jpg',
                ),
              ),
            ),
            BulletList(
              text:
                  'Akan ada form untuk menginput data barang, silahkan isi sesuai kebutuhan',
            ),
            BulletList(
              text:
                  'Jika sudah, tekan tombol Add Product untuk menambahkan barang',
            ),
            RoundedButton(onClick: () {}, text: 'Add Product')
          ],
        ),
      ),
    );
  }
}

class BulletList extends StatelessWidget {
  final String text;
  const BulletList({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\u2022',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(width: 5.0),
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
