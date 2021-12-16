import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/provider/database_provider.dart';
import 'package:dicoding_capstone_pos/provider/image_picker_provider.dart';
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

  final Item? item;

  AddUpdateProductPage({Key? key, this.item}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DatabaseProvider>(context);
    final imageProvider = Provider.of<ImagePickerProvider>(context);

    var isUpdate = item != null;
    var title = isUpdate ? "Update Product" : "Add Product";
    String name = '';
    String? category, barcode, url;
    int? sellingPrice, capitalPrice, stock;
    stock = 0;
    bool isManage = false;
    String image = imageProvider.fileName;

    if (isUpdate) {
      name = item!.name;
      sellingPrice = item!.sellingPrice;
      capitalPrice = item!.capitalPrice;
      isManage = item!.isManage;
      category = item?.category;
      barcode = item?.barcode;
    }

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
                    text: name,
                    onChanged: (value) => name = value),
                spacing(12.0),
                InputField(
                    label: "Selling Price",
                    hint: "20000",
                    text: sellingPrice != null ? sellingPrice.toString() : '',
                    type: TextInputType.number,
                    onChanged: (value) => sellingPrice = int.parse(value)),
                spacing(12.0),
                InputField(
                    label: "Capital Price",
                    hint: "18000",
                    text: capitalPrice != null ? capitalPrice.toString() : '',
                    type: TextInputType.number,
                    onChanged: (value) => capitalPrice = int.parse(value)),
                spacing(12.0),
                _buildTitleText('Adds on Details (Optional)'),
                spacing(12.0),
                ImageField(
                  buttonText: "Add Image",
                  fileName: image,
                ),
                spacing(12.0),
                const StockManage(),
                spacing(12.0),
                InputField(
                    label: "Product Category",
                    hint: "Product Category",
                    validate: false,
                    text: category,
                    onChanged: (value) => category = value),
                spacing(12.0),
                InputField(
                  label: "Barcode",
                  hint: "8732349",
                  validate: false,
                  text: barcode,
                  type: TextInputType.number,
                  onChanged: (value) => barcode = value,
                ),
                spacing(12.0),
                RoundedButton(
                    onClick: () async {
                      if (_formKey.currentState!.validate()) {
                        if (imageProvider.image != null &&
                            imageProvider.fileName != '') {
                          url = await provider.getImageUrl(
                              imageProvider.image!, true);
                        }

                        final newItem = Item(
                            name: name,
                            sellingPrice: sellingPrice!,
                            capitalPrice: capitalPrice!,
                            isManage: isManage,
                            stock: stock,
                            category: category,
                            barcode: barcode,
                            imageUrl: url);

                        if (isUpdate) {
                          provider.updateItem(item!.id!, newItem);
                          Navigator.pop(context);
                        } else {
                          provider.addItem(newItem);
                          _formKey.currentState!.reset();
                        }
                        showMessageSnackBar(context, provider.message);
                        imageProvider.clearImage();
                      }
                    },
                    text: title),
                spacing(12.0),
                TextButton(
                  onPressed: () {
                    if (isUpdate) {
                      provider.deleteItem(item!.id!);
                    }
                    Navigator.pop(context);
                    imageProvider.clearImage();
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
