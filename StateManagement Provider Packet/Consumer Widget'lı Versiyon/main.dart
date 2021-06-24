import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tenor_gif_api/state_data.dart';

void main() => runApp(ChangeNotifierProvider<StateData>(
    create: (BuildContext context) => StateData(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('callback kullanımı'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: SolWidgetA()),
            Expanded(child: SagWidgetA())
          ],
        ),
      ),
    );
  }
}

class SolWidgetA extends StatelessWidget {
  ///Burada ne oldu şimdi? Bu Consumer Widget'i şu işe yarıyor:
  ///Beyaz olan yerde bir değişiklik yaptığın zaman ekrandaki hiçbir yerde bir değişiklik olmuyor.
  ///Hiçbir yer rebuid edilmiyor sadece beyaz olan kısım çalışıyor.
  ///Ayrıca bütün bu classların StatelessWidget olması da işin cabası.
  ///Bu paketler bir yerden bir yere bir yazı gönderilirken felan kullanılabilecek paketler.
  @override
  Widget build(BuildContext context) {
    print("Sarı rebuild edildi");
    return Container(
      color: Colors.yellow,
      child: Consumer<StateData>(
        builder: (context, data, child) {
          print("Consumer Widget'i çalıştı ve sadece Column Rebuild edildi");
          return Column(
            children: [
              Text(
                'Sol Widget',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Şehir: ${data.sehir}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'İlçe: ${data.ilce}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Mahalle: ${data.mahalle}',
                style: TextStyle(fontSize: 20),
              )
            ],
          );
        },
      ),
    );
  }
}

class SagWidgetA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Yeşil rebuild edildi");
    return Container(
      color: Colors.green,
      child: Column(children: [
        Text(
          'SagWidget A',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetB()
      ]),
    );
  }
}

class SagWidgetB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Mor rebuild edildi");
    return Container(
      height: 300,
      width: 180,
      color: Colors.purple,
      child: Column(children: [
        Text(
          'SagWidget B',
          style: TextStyle(fontSize: 20),
        ),
        SagWidgetC()
      ]),
    );
  }
}

class SagWidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Beyaz rebuild edildi");
    Function YeniSehir = Provider.of<StateData>(context).NewCity;
    return Container(
      color: Colors.white,
      height: 150,
      width: 160,
      child: Column(children: [
        Text(
          'SagWidget C',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Şehir: ${Provider.of<StateData>(context).sehir}',
          style: TextStyle(fontSize: 20),
        ),
        TextField(onChanged: (input) {
          //YeniSehir(input);
          Provider.of<StateData>(context, listen: false).NewCity(input);
        })
      ]),
    );
  }
}
