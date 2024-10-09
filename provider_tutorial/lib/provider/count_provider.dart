import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int count = 0;
  int get _count => count;
  void setCount() {
    count++;
    notifyListeners();
  }
}
