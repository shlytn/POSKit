import 'package:dicoding_capstone_pos/ui/profile/help/add_product.dart';
import 'package:flutter/material.dart';

class UserHelpPage extends StatelessWidget {
  static const routeName = '/user_help';
  const UserHelpPage({Key? key}) : super(key: key);

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
            _buildRowMenu(
                title: 'Bagaimana cara menambahkan barang',
                onClick: () {
                  Navigator.pushNamed(context, AddProductHelp.routeName);
                })
          ],
        ),
      ),
    );
  }

  Widget _buildRowMenu({required String title, required Function onClick}) {
    return InkWell(
      onTap: () => onClick(),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12.5,
          bottom: 12.5,
          left: 4.0,
          right: 18.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
