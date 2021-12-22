import 'package:dicoding_capstone_pos/data/api/database_service.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/utils/result_state.dart';
import 'package:flutter/cupertino.dart';

class CartProvider extends ChangeNotifier {
  CartProvider(){
    checkItems();
  }

  final _api = DatabaseService();

  late ResultState _state;

  ResultState get state => _state;

  String _message = '';

  String get message => _message;

  int _totalItem = 0;

  int get totalItem => _totalItem;

  int _totalPrice = 0;

  int get totalPrice => _totalPrice;

  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  Future<void> countTotal() async {
    Stream<List<CartItem>> items = _api.getCart();
    _items = await items.first;
    _totalItem = _api.getTotalQuantity(_items);
    _totalPrice = _api.getTotalPrice(_items);

    notifyListeners();
  }

  Stream<List<CartItem>> getCart() {
    return _api.getCart();
  }

  Future<dynamic> checkItems() async {
    try{
      _state = ResultState.loading;
      final data = await _api.getCartData();
      await countTotal();
      if (data.size > 0){
        _state = ResultState.hasData;
      } else {
        _state = ResultState.noData;
      }
    } catch (e) {
      _state = ResultState.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> addCart(Item item) async {
    try {
      await _api.addCart(item);
      await countTotal();
      _message = "Item added to cart";
    } catch (e) {
      _message = "Failed to add cart";
    }
    notifyListeners();
  }

  Future<void> updateCart(String id, CartItem item, bool isPlus) async {
    try {
      await _api.updateCart(id, item, isPlus);
      await countTotal();
      _message = "Updated";
    } catch (e) {
      _message = "Failed to update item";
    }
    notifyListeners();
  }

  Future<void> deleteCart(String id) async {
    try {
      await _api.deleteCart(id);
      await countTotal();
      _message = "Deleted";
    } catch (e) {
      _message = "Failed to delete item";
    }
    notifyListeners();
  }
}