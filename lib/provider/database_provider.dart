import 'package:dicoding_capstone_pos/data/api/database_service.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/utils/result_state.dart';
import 'package:flutter/cupertino.dart';

class DatabaseProvider extends ChangeNotifier {
  final _api = DatabaseService();

  late ResultState _state;

  ResultState get state => _state;

  String _message = '';

  String get message => _message;

  late Item _item;

  Item get item => _item;

  List<Item> _items = [];

  List<Item> get items => _items;

  Stream<List<Item>> getItems() {
    final result = _api.getData();
    return result;
  }

  Future<void> addItem(Item item) async {
    try {
      await _api.addData(item);
      debugPrint("Success to add data");
    } catch (e) {
      debugPrint("Failed to add Data");
    }
  }

  Future<void> updateItem(String id, Item item) async {
    try {
      await _api.updateData(id, item);
      debugPrint("Success to update data");
    } catch (e) {
      debugPrint("Failed to update data");
    }
  }

  Future<void> deleteItem(String id) async {
    try {
      await _api.deleteData(id);
      debugPrint("Success to delete data");
    } catch (e) {
      debugPrint("Failed to delete data");
    }
  }
}