import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumbersNotifier extends StateNotifier<List<String>> {
  NumbersNotifier(List<String>? initList) : super(initList ?? []);
  void add(String number) {
    state = [...state, number];
  }

  void deltete(String number) {
    state.removeWhere((element) => element == number);
  }
}

class NumbersChangeNotifier extends ChangeNotifier {
  final List<String> _numbers = [];
  UnmodifiableListView<String> get numbers => UnmodifiableListView(_numbers);
  void add(String number) {
    _numbers.add(number);
    notifyListeners();
  }
}
