class Item {
  Item({
    required this.name,
    required this.sellingPrice,
    required this.capitalPrice,
    required this.isManage,
    this.stock,
    this.category,
    this.barcode,
    this.image,
  });

  String name;
  int sellingPrice;
  int capitalPrice;
  bool isManage = false;
  int? stock;
  String? category;
  String? barcode;
  String? image;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    name: json["name"],
    sellingPrice: json["sellingPrice"],
    capitalPrice: json["capitalPrice"],
    isManage: json["isManage"].toBoolean(),
    stock: json["stock"].toInt(),
    category: json["category"],
    barcode: json["barcode"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "sellingPrice": sellingPrice,
    "capitalPrice": capitalPrice,
    "isManage": isManage,
    "stock": stock,
    "category": category,
    "barcode": barcode,
  };
}
