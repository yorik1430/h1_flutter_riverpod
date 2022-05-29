import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/data/models/counter_model.dart';
import 'package:h1_flutter_riverpod/data/repository/Repository.dart';
import 'package:h1_flutter_riverpod/domain/usecase/UseCase.dart';

final viewModelProvider = ChangeNotifierProvider((ref) => ViewModel(Repository()));

class ViewModel extends ChangeNotifier {

  final UseCase _useCase;

  CounterModel get counter => _useCase.getCounter();

  CounterModel get evenCounter => _useCase.getEvenCounter();

  ViewModel(this._useCase) {
    _useCase.iniLoad();
  }

  void increment() {
    _useCase.increment();
  }

  bool isEven() {
    return _useCase.isEven();
  }


  void incrementEvenCounter() {
    _useCase.incrementEvenCounter();
  }

  void onFabPressed() {
    increment();
    if (isEven()) {
      setEvenState();
    }
  }


  void setEvenState() {
    incrementEvenCounter();
    notifyListeners();
  }
}
