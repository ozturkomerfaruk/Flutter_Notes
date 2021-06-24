import 'package:flutter/cupertino.dart';

class StateData with ChangeNotifier{
  String sehir = "asd";

  void NewCity(String city) {
    sehir = city;
    notifyListeners(); //ChangeNotifier'den türemiştir.
  }
}