import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/provider/database_provider.dart';
import 'package:dicoding_capstone_pos/widgets/image_field.dart';
import 'package:dicoding_capstone_pos/widgets/input_field.dart';
import 'package:dicoding_capstone_pos/widgets/rounded_button.dart';
import 'package:dicoding_capstone_pos/widgets/stock_manage.dart';
import 'package:dicoding_capstone_pos/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AddUpdateProductPage extends StatelessWidget {
  static const routeName = '/add_product';
  static const pageTitle = 'add_product';

  final bool isUpdate;

  AddUpdateProductPage({Key? key, this.isUpdate = false}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context);

    var title = isUpdate ? "Update Product" : "Add Product";
    String name = '';
    String? category, barcode;
    int sellingPrice, capitalPrice, stock;
    sellingPrice = capitalPrice = stock = 0;
    bool isManage = false;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTitleText('Product Details'),
                spacing(16.0),
                InputField(
                    label: "Product Name",
                    hint: "Product Name",
                    onChanged: (value) => name = value),
                spacing(12.0),
                InputField(
                    label: "Selling Price",
                    hint: "20000",
                    type: TextInputType.number,
                    onChanged: (value) => sellingPrice = int.parse(value)),
                spacing(12.0),
                InputField(
                    label: "Capital Price",
                    hint: "18000",
                    type: TextInputType.number,
                    onChanged: (value) => capitalPrice = int.parse(value)),
                spacing(12.0),
                _buildTitleText('Adds on Details (Optional)'),
                spacing(12.0),
                ImageField(buttonText: "Add Image"),
                spacing(12.0),
                const StockManage(),
                spacing(12.0),
                InputField(
                    label: "Product Category",
                    hint: "Product Name",
                    validate: false,
                    onChanged: (value) => category = value),
                spacing(12.0),
                InputField(
                  label: "Barcode",
                  hint: "8732349",
                  validate: false,
                  type: TextInputType.number,
                  onChanged: (value) => barcode = value,
                ),
                spacing(12.0),
                RoundedButton(
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        provider.addItem(Item(
                          name: name,
                          sellingPrice: sellingPrice,
                          capitalPrice: capitalPrice,
                          isManage: isManage,
                          stock: stock,
                          category: category,
                          barcode: barcode,
                        ));
                        _formKey.currentState!.reset();
                      }
                    },
                    text: title),
                spacing(12.0),
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
      ),
    );
  }

  Widget _buildTitleText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
    );
  }
}
