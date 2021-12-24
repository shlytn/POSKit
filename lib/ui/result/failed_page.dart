import 'package:dicoding_capstone_pos/common/styles.dart';
import 'package:dicoding_capstone_pos/ui/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FailedPage extends StatelessWidget {
  static const routeName = '/failed';

  const FailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: error,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      CupertinoIcons.xmark_circle_fill,
                      color: CupertinoColors.destructiveRed,
                      size: 140,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Transaction Failed',
                      style: TextStyle(
                          color: error,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'NOTE: Do not forget to give smile to customers.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomePage.routeName, (route) => false);
              },
              style: ElevatedButton.styleFrom(
                  primary: primaryColor, onPrimary: error),
              child: const SizedBox(
                width: double.infinity,
                height: 60,
                child: Center(
                  child: Text(
                    'NEXT ORDER',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
