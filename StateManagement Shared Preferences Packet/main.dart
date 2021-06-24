import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();//RunApp den önce bir şey çalıştırmak istiyorsak bunu kullanıcaz
  await ThemeColorData().createSharedPrefObject();
  runApp(ChangeNotifierProvider<ThemeColorData>(
      create: (BuildContext context) => ThemeColorData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeColorData>(context, listen: false)
        .loadThemeFromSharedPref();

    ///Bunu burada kullanmamız lazım. BuildContext'ten sonra, return den önce

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeColorData>(context).themeColor,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Tema Seçimi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              title: Provider.of<ThemeColorData>(context).isGreen
                  ? Text("Yeşil Tema")
                  : Text("Kırmızı Tema"),
              onChanged: (_) {
                Provider.of<ThemeColorData>(context, listen: false)
                    .toggleTheme();
              },
              value: Provider.of<ThemeColorData>(context).isGreen,
            ),
            Card(
              child: ListTile(
                title: Text("Yapılacaklar"),
                trailing: Icon(Icons.check_box),
              ),
            ),
            SizedBox(height: 8.0),
            TextButton(
              child: Text("Ekle"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
