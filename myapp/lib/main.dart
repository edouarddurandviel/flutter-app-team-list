import 'package:flutter/material.dart';
import 'package:myapp/Routes.dart';

import 'package:myapp/home/Home.dart';

void main() {
  Routes.initRoutes();
  runApp(new MaterialApp(
    title: "App",
    home: new Home(),
  ));
}
