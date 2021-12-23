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
    this.sold,
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
  int? sold;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    sellingPrice: json["sellingPrice"].toInt(),
    capitalPrice: json["capitalPrice"].toInt(),
    isManage: json["isManage"],
    stock: json["stock"] ?? 0,
    category: json["category"],
    barcode: json["barcode"],
    imageUrl: json["imageUrl"],
    sold: json["sold"].toInt() ?? 0,
  );

  factory Item.fromFirebase(DocumentSnapshot doc) => Item(
    id: doc.id,
    name: doc["name"],
    sellingPrice: doc["sellingPrice"].toInt(),
    capitalPrice: doc["capitalPrice"].toInt(),
    isManage: doc["isManage"],
    stock: doc["stock"] ?? 0,
    category: doc["category"],
    barcode: doc["barcode"],
    imageUrl: doc["imageUrl"],
    sold: doc["sold"].toInt() ?? 0,
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
    "sold": sold,
  };
}
