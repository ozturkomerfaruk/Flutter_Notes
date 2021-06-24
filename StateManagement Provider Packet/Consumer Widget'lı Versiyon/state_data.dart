import 'package:flutter/cupertino.dart';

class StateData with ChangeNotifier{
  String sehir = "Eskişehir";
  String ilce = "Odunpazarı";
  String mahalle = "Büyükdere";

  void NewCity(String city) {
    sehir = city;
    notifyListeners(); //ChangeNotifier'den türemiştir.
  }
}