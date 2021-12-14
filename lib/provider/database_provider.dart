import 'package:cloud_firestore/cloud_firestore.dart';
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

  List<Item> _items = [];

  List<Item> get items => _items;

  late Item _item;

  Item get item => _item;

  Future<void> addItem(Item item) async {
    try {
      await _api.addData(item);
      debugPrint("Success to add data");
    } catch (e) {
      debugPrint("Failed to add Data");
    }
  }
}
