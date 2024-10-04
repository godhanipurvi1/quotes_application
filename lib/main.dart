import 'package:flutter/material.dart';
import 'package:quotes_app/screens/detailpage.dart';
import 'package:quotes_app/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'detailpage': (context) => DetailPage(),
      },
    );
  }
}
