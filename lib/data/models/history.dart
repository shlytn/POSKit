import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';

class History {
  History({
    this.id,
    required this.date,
    required this.time,
    required this.items,
    required this.totalItem,
    required this.totalPrice,
  });

  String? id;
  String date;
  String time;
  List<CartItem> items;
  int totalItem;
  int totalPrice;

  factory History.fromJson(Map<String, dynamic> json) => History(
        date: json["date"],
        time: json["time"],
        items:
            List<CartItem>.from(json["items"].map((x) => CartItem.fromJson(x))),
        totalItem: json["totalItem"].toInt(),
        totalPrice: json["totalItem"].toInt(),
      );

  factory History.fromFirebase(DocumentSnapshot doc) => History(
        id: doc.id,
        date: doc["date"],
        time: doc["time"],
        items:
            List<CartItem>.from(doc["items"].map((x) => CartItem.fromJson(x))),
        totalItem: doc["totalItem"].toInt(),
        totalPrice: doc["totalItem"].toInt(),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "time": time,
        "items": List<CartItem>.from(items.map((x) => x.toJson())),
        "totalItem": totalItem,
        "totalPrice": totalPrice,
      };
}
