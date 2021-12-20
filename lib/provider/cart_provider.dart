import 'package:dicoding_capstone_pos/data/api/database_service.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/utils/result_state.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  final _api = DatabaseService();

  late ResultState _state;

  ResultState get state => _state;

  String _message = '';

  String get message => _message;

  Stream<List<CartItem>> getCart() {
    final result = _api.getCart();
    return result;
  }

  Future<void> addCart(Item item) async {
    try {
      await _api.addCart(item);
      _message = "Item added to cart";
    } catch (e) {
      _message = "Failed to add cart";
      print(e);
    }
    notifyListeners();
  }

  Future<void> deleteCart(String id) async {
    try {
      await _api.deleteCart(id);
      _message = "Delete Cart Item";
    } catch (e) {
      _message = "Failed to delete cart item";
    }
    notifyListeners();
  }
}