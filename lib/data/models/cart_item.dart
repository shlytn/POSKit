import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';

class Cart {
  Cart({
    this.id,
    required this.items,
    required this.totalItem,
    required this.totalPrice,
  });

  String? id;
  CartItem items;
  int totalItem;
  int totalPrice;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    items: json["items"],
    totalItem: json["totalItem"].toInt(),
    totalPrice: json["totalPrice"].toInt(),
  );

  factory Cart.fromFirebase(DocumentSnapshot doc) => Cart(
    id: doc.id,
    items: doc["items"],
    totalItem: doc["totalItem"].toInt(),
    totalPrice: doc["totalPrice"].toInt(),
  );

  Map<String, dynamic> toJson() => {
    "items": items,
    "totalItem": totalItem,
    "totalPrice": totalPrice,
  };
}

class CartItem {
  CartItem({
    this.id,
    required this.item,
    required this.quantity,
    required this.total,
  });

  String? id;
  Item item;
  int quantity;
  int total;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["item"].id,
    item: Item.fromJson(json["item"]),
    quantity: json["count"].toInt(),
    total: json["total"].toInt(),
  );

  factory CartItem.fromFirebase(DocumentSnapshot doc) => CartItem(
    id: doc.id,
    item: Item.fromJson(doc["item"]),
    quantity: doc["count"].toInt(),
    total: doc["total"].toInt(),
  );

  Map<String, dynamic> toJson() => {
    "item": item.toJson(),
    "count": quantity,
    "total": total,
  };
}
