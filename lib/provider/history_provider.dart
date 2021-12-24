import 'package:dicoding_capstone_pos/data/api/database_service.dart';
import 'package:dicoding_capstone_pos/data/models/cart_item.dart';
import 'package:dicoding_capstone_pos/data/models/history.dart';
import 'package:dicoding_capstone_pos/utils/result_state.dart';
import 'package:flutter/cupertino.dart';

class HistoryProvider extends ChangeNotifier {
  HistoryProvider() {
    checkItems();
  }

  final _api = DatabaseService();

  late ResultState _state;

  ResultState get state => _state;

  String _message = '';

  String get message => _message;

  int _totalIncome = 0;

  int get totalIncome => _totalIncome;

  List<History> _transactions = [];

  List<History> get transactions => _transactions;

  int _totalTransaction = 0;

  int get totalTransaction => _totalTransaction;

  Stream<List<History>> getHistory() {
    final result = _api.getHistory();
    countTotal(result);
    return result;
  }

  Future<dynamic> checkItems() async {
    try {
      _state = ResultState.loading;
      final data = await _api.getHistoryData();
      if (data.size > 0) {
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

  Future<bool> addHistory(List<CartItem> items) async {
    try {
      await _api.addHistory(items);
      _message = "Transaction Success";
      notifyListeners();
      return true;
    } catch (e) {
      _message = "Failed to make Transaction";
      notifyListeners();
      return false;
    }
  }

  Future<void> countTotal(Stream<List<History>> history) async {
    _transactions = await history.first;
    _totalIncome = _api.countTotalTransaction(_transactions);
    _totalTransaction = await history.length;

    notifyListeners();
  }
}
