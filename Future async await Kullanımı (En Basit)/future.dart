void main() => yemekHazirla();

void yemekHazirla() async {
  yika();
  String pismisSebze = await pisir();
  tuzla(pismisSebze);
}

void yika() {
  String sonuc = "yikanmis sebze";
  print("1- sebzeler yikandi");
}

Future<String> pisir() {
  var besSaniye = Duration(seconds: 5);
  
  return Future.delayed(besSaniye, () {
    print("2- sebzeler pişirildi");
    return "Haşlanmış patates";
  });
}

void tuzla(String pismisSebze) {
  String sonuc = "tuzlanmış sebze";
  print("3- $pismisSebze pişiriciden alındı ve tuzlandı");
}