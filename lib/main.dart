import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(primarySwatch: Colors.teal),
  home: CryptocurrencyApp(),
));

class CryptocurrencyApp extends StatefulWidget {
  CryptocurrencyState createState() => CryptocurrencyState();
}
class CryptocurrencyState extends State<CryptocurrencyApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }

}