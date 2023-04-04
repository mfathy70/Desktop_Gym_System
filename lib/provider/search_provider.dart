import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  String searchValue = "Empty";

  void getSearchValue(String value) {
    searchValue = value;

    notifyListeners();
  }
}
