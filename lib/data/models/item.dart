import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  Item({
    this.id,
    required this.name,
    required this.sellingPrice,
    required this.capitalPrice,
    required this.isManage,
    this.stock,
    this.category,
    this.barcode,
    this.imageUrl,
  });

  String? id;
  String name;
  int sellingPrice;
  int capitalPrice;
  bool isManage = false;
  int? stock;
  String? category;
  String? barcode;
  String? imageUrl;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    sellingPrice: json["sellingPrice"].toInt(),
    capitalPrice: json["capitalPrice"].toInt(),
    isManage: json["isManage"],
    stock: json["stock"].toInt(),
    category: json["category"],
    barcode: json["barcode"],
    imageUrl: json["imageUrl"],
  );

  factory Item.fromFirebase(DocumentSnapshot doc) => Item(
    id: doc.id,
    name: doc["name"],
    sellingPrice: doc["sellingPrice"].toInt(),
    capitalPrice: doc["capitalPrice"].toInt(),
    isManage: doc["isManage"],
    stock: doc["stock"],
    category: doc["category"],
    barcode: doc["barcode"],
    imageUrl: doc["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "sellingPrice": sellingPrice,
    "capitalPrice": capitalPrice,
    "isManage": isManage,
    "stock": stock,
    "category": category,
    "barcode": barcode,
    "imageUrl": imageUrl,
  };
}
