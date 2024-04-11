import 'package:flutter/material.dart';
import 'package:foodmonkey_project/models/Cat.dart';
import 'package:foodmonkey_project/models/Tag.dart';

class Constants {
  static const Color primary = Color(0xFFF6F6F6);
  static const Color secondary = Color(0xFFFFBB91);
  static const Color accent = Color(0xFFFF8E6E);
  static const Color normal = Color(0xFF515070);

  static const Color yellow = Color(0xffFDC054);
  static const Color darkGrey = Color(0xff202020);
  static const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);

  static const String API_VERSION = "1.0";

  static const String BASE_URL = "http://192.168.1.5:3000";
  static const String API_URL = "$BASE_URL/api";

  static List<Tag> tags = [];
  static List<Cat> cats = [];
}