import 'package:dicoding_capstone_pos/data/api/database_service.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/data/models/history.dart';
import 'package:dicoding_capstone_pos/utils/result_state.dart';
import 'package:flutter/cupertino.dart';

class HistoryProvider extends ChangeNotifier {
  HistoryProvider(){
    checkItems();
  }

  final _api = DatabaseService();

  late ResultState _state;

  ResultState get state => _state;

  String _message = '';

  String get message => _message;

  Stream<List<History>> getHistory() {
    return _api.getHistory();
  }

  Future<dynamic> checkItems() async {
    try{
      _state = ResultState.loading;
      final data = await _api.getHistoryData();
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

  Future<void> addHistory(List<CartItem> items) async {
    try {
      await _api.addHistory(items);
      _message = "Added to history";
    } catch (e) {
      _message = "Failed to add history";
    }
    notifyListeners();
  }
}