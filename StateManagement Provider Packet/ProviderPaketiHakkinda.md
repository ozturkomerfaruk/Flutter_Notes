![image](https://user-images.githubusercontent.com/56068905/122087857-dea23080-ce0d-11eb-98e9-4b6cc3591865.png)

**Sorun Nedir?**

Burada şehir olarak bulunan Mersin kelimesinin SagWidget C’den değiştirildiğinde Sol Widget’dan da değiştirilmesi lazım. Ancak nasıl?
Veyahut, yine beyaz dikdörtgendeki Mersin kelimesinin altında ki TextField’dan herhangi bir şey girildiğinde her iki taraftada nasıl değişiklik yaptırabiliriz?
Çözüm Nedir

Provider paketini indirmemiz lazım. İndirdikten sonra ;
![image](https://user-images.githubusercontent.com/56068905/122087820-d649f580-ce0d-11eb-8121-1ebcab35a908.png)


En tepede bulunan MyApp’i Provider ile kaplamamız lazım. Nasıl kaplayacaz? Yine bir widget ile etrafını çevreledikten sonra Provider<StateData>(create: BuilContext context) => StateData(), child: MyApp()));
İle yapabiliriz. Daha sonra şehrin gözükmesini istediğimiz yerlerde Provider.of<StateData>(context).sehir
Diyebiliriz. Tabi bunun için bir tane de class oluşturmamız lazım. Ekran görüntüsünde ki StateData class’ı bu görevi üstlenmektedir. İçinde sadece bir string tutuyor diyebiliriz. Oda string sehir = “Ankara”

**Sıra geldi TextField’a**
  
Bunda ise durum biraz farklı. StateData class’ını ChangeNotifier classından türetmemiz lazım. Bu class hazır bulunan bir classtır Flutter kütüphanelerinde. Bunu with ile sadece metotlarını kullanmamız için türetebiliriz.
Ardından bu class içerisinde bir metot oluşturabiliriz.
Void NewCity(String city) {sehir = city; notifyListeners();}
Bu fonksiyon aslında hazır olarak gelen bir metottur.

Daha sonra textfield’in içerisine şu ifadeyi yazabiliriz.
onChanged: (input) {Provider.of<StateData>(context).NewCity(input)};
Ancak bu kod satır çalışmayacak çünkü bu pakette bu satır diyor ki ben hem bilgi okurum hem bilgi veririm. Ancak bizim istediğimiz sadece bilgi vermesi, bütün statelerin bilgilerini okuması değil. Bunun için çözüm olarak context yazılan yerde listen: false yazabiliriz.

Ancak bütün bunların çalışabilmesi için MyApp’i çevreleyen Widget’in isminin de ChangeNotifierProvider olması gerekmektedir.

Bu notlar Kod Planet Youtube Kanalının Flutter Derslerini takip ederek alınmıştır. Alınan notlar bu videodan baz alınarak alınmıştır. https://www.youtube.com/watch?v=19gZHv9QBk4&list=PLJ5EAGz05Q3FJG96SH8GoWcSUg8IHwtnt&index=73
