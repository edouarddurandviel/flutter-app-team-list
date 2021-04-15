import 'package:flutter/material.dart';
import 'package:myapp/Routes.dart';

import 'package:myapp/home/Home.dart';

void main() {
  Routes.initRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "App",
      home: new Home(),
    );
  }
}
