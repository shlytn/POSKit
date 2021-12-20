import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dicoding_capstone_pos/data/api/database_service.dart';
import 'package:dicoding_capstone_pos/data/models/item.dart';
import 'package:dicoding_capstone_pos/utils/result_state.dart';
import 'package:flutter/cupertino.dart';

class DatabaseProvider extends ChangeNotifier {
  DatabaseProvider(){
    checkItems();
  }

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

  Future<dynamic> checkItems() async {
    try{
      _state = ResultState.loading;
      final data = await _api.getData();
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

  Future<void> addItem(Item item) async {
    try {
      await _api.addData(item);
      _message = "Success to add data";
    } catch (e) {
      _message = "Failed to add Data";
    }
    notifyListeners();
  }

  Future<void> updateItem(String id, Item item) async {
    try {
      await _api.updateData(id, item);
      _message = "Success to update data";
    } catch (e) {
      _message = "Failed to update data";
    }
    notifyListeners();
  }

  Future<void> deleteItem(String id) async {
    try {
      await _api.deleteData(id);
      _message = "Success to delete data";
    } catch (e) {
      _message = "Failed to delete data";
    }
    notifyListeners();
  }

  Future<String?> getImageUrl(File image, bool isItem) async {
    try {
      final url = await _api.uploadImage(image, isItem);
      _message = "Success to upload Image";
      notifyListeners();
      return url;
    } catch (e) {
      _message = "Failed to upload Image";
      notifyListeners();
      return null;
    }
  }

  Future<void> setUserProfile(String? imageUrl) async {
    try{
      await _api.setUserProfile(imageUrl);
      _message = "Success to add Profile";
    } catch (e) {
      _message = "Failed to add Profile";
    }
    notifyListeners();
  }

  Stream<DocumentSnapshot> getUserProfile() {
    return _api.getUserProfile();
  }
}