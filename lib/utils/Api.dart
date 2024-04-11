import 'dart:convert';

import 'package:foodmonkey_project/models/Cat.dart';
import 'package:foodmonkey_project/models/Tag.dart';
import 'package:foodmonkey_project/utils/Constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<bool> getApiVerstion() async {
    Uri uri = Uri.parse("${Constants.API_URL}/appversion");
    var resStr = await http.get(uri);
    var response = jsonDecode(resStr.body);
    return double.parse(response["result"]) == double.parse(Constants.API_VERSION);
  }

  static Future<bool> getAllTags() async {
    Uri uri = Uri.parse("${Constants.API_URL}/tags");
    var resStr = await http.get(uri);
    var response = jsonDecode(resStr.body);
    var tList = response['result'] as List;
    Constants.tags = tList.map((tag) => Tag.fromJson(tag)).toList();
    return true;
  }

  static Future<bool> getAllCats() async {
    Uri uri = Uri.parse("${Constants.API_URL}/categories");
    var resStr = await http.get(uri);
    var response = jsonDecode(resStr.body);
    if (response['con']) {
      var cList = response['result'] as List;
      Constants.cats = cList.map((cat) => Cat.fromJson(cat)).toList();
    }
    return true;
  }
}
