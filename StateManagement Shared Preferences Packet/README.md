# Shared Preferences Paketi Hakkında Bilgiler

Bu paket ne imkanı sağlamaktadır? Mesela kullanıcı kırmızı temadan, yeşil temaya geçirmek için bir Switch butonu kullandı. Bu değişikliği basit bir kendi içerisinde veri tabanında tutmasını sağlamaktadır. Yani en son yeşil tema açık kaldıysa app çalışırken kapandıktan sonra da tekrar yeşil açık kalmasını sağlamaktadır.


![image](https://user-images.githubusercontent.com/56068905/122168612-2adc8780-ce85-11eb-9bfe-7602d801c89f.png)

![image](https://user-images.githubusercontent.com/56068905/122168628-329c2c00-ce85-11eb-93b3-7c62a58586e0.png)

Ekranda görüldüğü üzere switch butonuyla kolay bir şekilde tema geçişi yapabilmektedir. Şimdi nasıl bakalım

Mimari açıdan düzenli olabilmesi için tema geçişlerini ayrı bir sınıfta tutmak çok daha isabetli olacaktır. theme_data.dart dosyası oluşturuldu. Ardından içine ThemeData tipinde temalar tanımlandı.

# **theme_data.dart**

Daha sonra ChangeNotifier sınıfının metotlarını kullanabilir şekilde ThemeColorData sınıfı türetildi.

Switch butonu sadece true false alabildiği için class da bool tipinde _isGreen oluşturuldu. Dışarıdan ulaşılabilir şeklinde olabilmesi için private yapılıp, get ile çağrıldı.

Burada oluşturulan temayı dışarıdan kullanılabilmesi için ThemeData get themeColor oluşturuldu.

Dışarıdan switch ile true ise false, false ise true yapabilmesini sağlayan get toggleTheme metodu oluşturuldu.

# **main.dart**

MyApp'i ChangeNotifierProvider ile sarmalandı.

    SwitchListTile içerisinde

tittle: Provider.of<ThemeColorData>(context).isGreen
                  ? Text("Yeşil Tema")
                  : Text("Kırmızı Tema"),
  
onChanged: (_) {
                Provider.of<ThemeColorData>(context, listen: false)
                    .toggleTheme();
              },

value: Provider.of<ThemeColorData>(context).isGreen,
  
şeklinde satırları yazılmıştır.
    
# **Sıra Shared Preferences Paketini Kodlamakta**
    
Temanın değişmesini istediğimiz sınıfta bu paketin objesini oluşturabiliriz.
    
Ardından sisteme kaydedebileceğimiz bir Instance var. Bunu createSharedPrefObject metodunda yapabiliriz. Daha doğrusu burada sistemi oluştuyoruz. Basit veritabanı diyebiliriz.
    
saveThemeToSharedPref metounda ise sisteme kaydedebiliyoruz, set ediyoruz diyebiliriz.
    
loadThemeFromSharedPref ise uygulama kapanıp açıldıktan sonra en son kaydedilenin çağrılması için kullanıyoruz diyebiliriz.
    
Yalnız tekrar yüklenmesini sağlarken main.dart dosyasında void main'de RunApp çalışmadan önce çalıştırmamız gerekmektedir. Aksi durum sıkıntılar çıkartmaktadır. Bunu yapabilmemiz için de mainde en önce  WidgetsFlutterBinding.ensureInitialized(); yazmak zorunda oluşumuzdur. Ardından yine async - await şeklinde çalıştırabiliriz.
    
Not: class ThemeColorData sınıfında SharedPreferences objesini oluştururken static kullanmak zorundayız. Bunun detaylı açıklamalarını kod içerisinde yorum satırlarında anlattım.
    
Not 2: Bu notlar Kod Planet Youtube kanalının bu videosundan hazırlanmıştır. https://www.youtube.com/watch?v=DrApZAt8f_g&list=PLJ5EAGz05Q3FJG96SH8GoWcSUg8IHwtnt&index=75 
