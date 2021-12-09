import 'package:dicoding_capstone_pos/widgets/image_field.dart';
import 'package:dicoding_capstone_pos/widgets/input_field.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:dicoding_capstone_pos/widgets/stock_manage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddUpdateProductPage extends StatelessWidget {
  static const routeName = '/add_product';
  static const pageTitle = 'add_product';

  final bool isUpdate;

  const AddUpdateProductPage({Key? key, this.isUpdate = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = isUpdate ? "Update Product" : "Add Product";
    var name, sellPrice, capPrice, stock, category, barcode;
    name = category = barcode = '';
    sellPrice = capPrice = stock = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitleText('Product Details'),
              _spacing(16.0),
              InputField(
                  label: "Product Name",
                  hint: "Product Name",
                  onChanged: (value) => name = value),
              _spacing(12.0),
              InputField(
                  label: "Selling Price",
                  hint: "20000",
                  type: TextInputType.number,
                  onChanged: (value) => sellPrice = value),
              _spacing(12.0),
              InputField(
                  label: "Capital Price",
                  hint: "18000",
                  type: TextInputType.number,
                  onChanged: (value) => capPrice = value),
              _spacing(12.0),
              _buildTitleText('Adds on Details (Optional)'),
              _spacing(12.0),
              ImageField(buttonText: "Add Image"),
              _spacing(12.0),
              const StockManage(),
              _spacing(12.0),
              InputField(
                  label: "Product Category",
                  hint: "Product Name",
                  onChanged: (value) => category = value),
              _spacing(12.0),
              InputField(
                label: "Barcode",
                hint: "8732349",
                type: TextInputType.number,
                onChanged: (value) => barcode = value,
              ),
              _spacing(12.0),
              RoundedButton(onClick: () {}, text: title),
              _spacing(12.0),
              TextButton(
                onPressed: () {
                  isUpdate ? null : Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.delete,
                      color: Colors.red,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      isUpdate ? 'Delete Product' : 'Cancel',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    );
  }

  Widget _spacing(double height) {
    return SizedBox(
      height: height,
    );
  }
}
