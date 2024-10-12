import 'package:flutter/material.dart';

class ExampleOneProvider with ChangeNotifier {
  double _value = 1;
  double get value => _value;
  void setValue(double value) {
    _value = value;
    notifyListeners();
  }
}
