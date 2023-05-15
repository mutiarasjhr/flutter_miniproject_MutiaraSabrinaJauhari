import 'package:yourmuaa/api/api_mua.dart';
import 'package:yourmuaa/model/mua.dart';
import 'package:flutter/material.dart';

enum RequestState { empty, loading, loaded, error }

class MuaProvider extends ChangeNotifier {
  List<Specialist> _listmua = [];
  List<Specialist> get listmua => _listmua;

  Specialist? _specialist;
  Specialist? get specialist => _specialist;

  RequestState _requestState = RequestState.empty;
  RequestState get requestState => _requestState;

  String _message = '';
  String get message => _message;

  Future<void> fetchProductList() async {
    _requestState = RequestState.loading;
    notifyListeners();
    try {
      final result = await ApiMua.getSpecialist();
      _listmua = result;
      _requestState = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      _requestState = RequestState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<void> fetchSingleMua(String id) async {
    _requestState = RequestState.loading;
    // notifyListeners();
    try {
      final result = await ApiMua.getSpecialistById(id);
      _specialist = result;
      _requestState = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      _requestState = RequestState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
    notifyListeners();
  }
}
