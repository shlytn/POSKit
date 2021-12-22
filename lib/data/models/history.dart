import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';

class History {
  History({
    this.id,
    required this.dateTime,
    required this.items,
    required this.totalItem,
    required this.totalPrice,
  });

  String? id;
  DateTime dateTime;
  List<CartItem> items;
  int totalItem;
  int totalPrice;

  factory History.fromJson(Map<String, dynamic> json) => History(
        dateTime: json["dateTime"],
        items:
            List<CartItem>.from(json["items"].map((x) => CartItem.fromJson(x))),
        totalItem: json["totalItem"].toInt(),
        totalPrice: json["totalPrice"].toInt(),
      );

  factory History.fromFirebase(DocumentSnapshot doc) => History(
        id: doc.id,
        dateTime: doc["dateTime"],
        items:
            List<CartItem>.from(doc["items"].map((x) => CartItem.fromJson(x))),
        totalItem: doc["totalItem"].toInt(),
        totalPrice: doc["totalPrice"].toInt(),
      );

  Map<String, dynamic> toJson() => {
        "dateTime": dateTime,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "totalItem": totalItem,
        "totalPrice": totalPrice,
      };
}
