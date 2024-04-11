import 'package:flutter/material.dart';
import 'package:foodmonkey_project/pages/Flash.dart';
import 'package:foodmonkey_project/pages/Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context) => Flash(),
      "/home":(context) => Home(),

    },
  ));
}

