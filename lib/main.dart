import 'package:flutter/material.dart';
import 'package:newsApp/screens/newsList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(child: NewsList()),
    );
  }
}
