import 'package:byte/screens/transfers/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.purple,
        ),
        primaryColor: Colors.green[900],
        // ignore: deprecated_member_use
        accentColor: Colors.redAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.accent,
        ),
      ),
      home: TransferList(),
    );
  }
}
