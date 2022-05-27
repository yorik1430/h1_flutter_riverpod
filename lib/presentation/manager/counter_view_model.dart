import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/data/models/counter_model.dart';
import 'package:h1_flutter_riverpod/data/repository/Repository.dart';
import 'package:h1_flutter_riverpod/domain/usecase/UseCase.dart';

import 'model/view_state.dart';

final viewModelProvider = ChangeNotifierProvider((ref) => ViewModel());

class ViewModel extends ChangeNotifier {

  final UseCase _useCase = Repository();

  CounterModel get counter => _useCase.getCounter();

  ViewState _state = ViewState.odd();

  ViewState get state => _state;

  CounterModel get evenCounter => _useCase.getEvenCounter();

  ViewModel() {
    _useCase.iniLoad();
  }

  void increment() {
    _useCase.increment();
  }

  bool isEven() {
    return _useCase.isEven();
  }


  void resetState() {
    _state = ViewState.odd();
    notifyListeners();
  }

  void setState(ViewState viewsState) => _state = viewsState;


  void incrementEvenCounter() {
    _useCase.incrementEvenCounter();
  }

  void onFabPressed() {
    increment();
    if (isEven()) {
      setEvenState();
    } else
      resetState();
  }


  void setEvenState() {
    incrementEvenCounter();
    setState(ViewState.even());
    notifyListeners();
  }
}
