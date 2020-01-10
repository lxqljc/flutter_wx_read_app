import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信读书',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
