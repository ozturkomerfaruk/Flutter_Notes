# yemekHazirla()

void yemekHazirla() async {
  yika();
  String pismisSebze = await pisir();
  tuzla(pismisSebze);
}

Biz sebzeyi pişirirken bir zaman geçmesini istiyoruz. Aşağıda onun nasıl yazıldığını anlattım. Burada sadece bunu göstermek için bir await yazdık. Gövdeden önce de async yazdık. Bu kadar!
Sebzeyi pişirdikten sonra tuzlanması gerektiğini göstermemiz için aralarında bir bağ olması lazım dedik. Bu bağ için de pisir() fonksiyonunu bir String'e aktarıp onu parametre olarak içine aldık.

# yika()

Hiçbir espirisi yok direk yazıldı.

# pisir()

Burada bir Future tipinde dosya döndürüyoruz. Future tipi dosya döndürmek demek şu demek. Döndürülen dosyayı **Future.delayed** ile oluşturuyoruz. Bu içerisine bir zaman belirteci ve bir fonksiyon alıyor.

Zaman olarak Duration sınıfından 5 saniyeyi gösteren bir obje oluşturduk. Fonksiyon olarak da sebzeler pişirildi yazılması istendi. Return olarak döndürdüğü String ise bir sonraki bağlı olduğu fonksiyonda çalıştırıldı.

Future döndüren fonksiyon Future döndürmesi lazım. Dolayısıyla başına Future<String> yazıldı. Ancak hiçbir şey döndürmeyen Future fonksiyonlarıda olabilir async olarak çalışan. Onlarda görüldüğü üzere **Future<void> FonksiyonAdi() async {}** olarak yazılabilir.
  
# tuzla()
  
  parametre olarak bir string alır ve bunu bastırır.
