import 'dart:convert';

import 'package:cryptocurrency_app/Cryptocurrency.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() =>
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: CryptocurrencyApp(),
    ));

class CryptocurrencyApp extends StatefulWidget {
  CryptocurrencyState createState() => CryptocurrencyState();
}

class CryptocurrencyState extends State<CryptocurrencyApp> {

  List<Datum> currencies = [];
  final List<MaterialColor> _colors = [Colors.yellow, Colors.lime, Colors.cyan];

  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
    getCurrencies();
  }

  Future<Cryptocurrency> getCurrencies() async {
    //4c312a6a-f132-4898-9b97-bd3dce079556
    String url = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map";
    http.Response response = await http.get(url, headers: {
      "X-CMC_PRO_API_KEY": "4c312a6a-f132-4898-9b97-bd3dce079556"
    });
    print(response.body);
    Cryptocurrency convertData = Cryptocurrency.fromJson(jsonDecode(response.body));

    setState(() {
      currencies = convertData.data;
    });
    return convertData;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Kripto Para",style: TextStyle(color: Colors.grey),),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
        child: ListView.builder(
            shrinkWrap: false,
            itemCount: currencies.length,
            itemBuilder: (BuildContext context, int i) {
              final Datum currency = currencies[i];
              final MaterialColor color = _colors[i % _colors.length];
              return getListItem(currency, color);
            }),

      /*FutureBuilder<Cryptocurrency>(
          future: getCurrencies(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  shrinkWrap: false,
                  itemCount: currencies.length,
                  itemBuilder: (BuildContext context, int i) {
                    final Datum currency = currencies[i];
                    final MaterialColor color = _colors[i % _colors.length];
                    return getListItem(currency, color);
                  });
            }
            return Center(child: CircularProgressIndicator());
          }
        ),*/

    );
  }

  ListTile getListItem(Datum currency, MaterialColor color) {
    return ListTile(
      leading: CircleAvatar(backgroundColor: color,
        child: Text(currency.symbol),),
      title: Text(currency.name,
        style: TextStyle(color: Colors.grey),),
    );
  }
}
