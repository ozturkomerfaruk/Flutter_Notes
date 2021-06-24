import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData green = ThemeData(
    buttonColor: Colors.green.shade300,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green.shade50);

ThemeData red = ThemeData(
    buttonColor: Colors.red.shade300,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red.shade50);

class ThemeColorData with ChangeNotifier {
  static SharedPreferences _sharedPrefObject;// her şeyi burada yaptığımız için burada oluşturmamız daha mantıklıydı.
///Elimde bir sınıf var, bundan herhangi bir daha obje oluşturmadan, hiç obje oluşturmasam da
  ///kullanabileceğim bir örnek, Run eder etmez ver dememize yarıyor.

  bool _isGreen = true;
  bool get isGreen => _isGreen;

  ThemeData get themeColor {
    return _isGreen ? green : red;
  }

  void toggleTheme() { //true ise false, false ise true
    _isGreen =! _isGreen;
    saveThemeToSharedPref(_isGreen);
    notifyListeners(); //ile ekranları güncelliyor.
  }

  Future<void> createSharedPrefObject() async {
    _sharedPrefObject = await SharedPreferences.getInstance();
  }
  ///Bunu asenkron çalıştırmamız lazım çünkü bir anda bu kodu çalıştıramazsın
///Tabi bu zaman isteyeceği için bu çalışmadan önce -Splash Screen
///Ya da CircularProgressIndicator kullanmamız lazım
///Ancak bu şekilde kullanım yetmez. Bu paketle ilgili her şeyi burada yazmamız lazım

  void saveThemeToSharedPref(bool value) {
    _sharedPrefObject.setBool(('themeData'), value);
  }
  ///Her kırmızı yeşil, yeşil kırmızı olduğunda bu metot çalışacak

  void loadThemeFromSharedPref() async {
    //await createSharedPrefObject();
    ///Bunu kullanmamıza gerek kalmadı. Bu hatalı çalışıyor. Run eder etmez yeşil, kırmızı yapıyor bir anda
    ///Bunun çözümü için main.dart çalışır çalışmaz en tepeye bu asenkron olarak çalıştırmayı denedik


    //if(_sharedPrefObject.getBool('themeData') == null)
    //  _isGreen = true;
    //else
    //  _isGreen = _sharedPrefObject.getBool('themeData');

    ///Yukarıda ki if else'in çok daha kolay bir yolu var.
    _isGreen = _sharedPrefObject.getBool('themeData') ?? true;
    /// Bu 2 soru işareti null'sa true'ya eşitle demek
  }

}