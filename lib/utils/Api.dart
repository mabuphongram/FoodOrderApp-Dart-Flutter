import 'dart:convert';

import 'package:foodmonkey_project/models/Cat.dart';
import 'package:foodmonkey_project/models/Tag.dart';
import 'package:foodmonkey_project/models/User.dart';
import 'package:foodmonkey_project/models/product.dart';
import 'package:foodmonkey_project/utils/Constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<bool> getApiVerstion() async {
    Uri uri = Uri.parse("${Constants.API_URL}/appversion");
    var resStr = await http.get(uri);
    var response = jsonDecode(resStr.body);
    return double.parse(response["result"]) ==
        double.parse(Constants.API_VERSION);
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

  static Future<List<Product>> getPaginatedProducts(pageNo) async {
    Uri uri = Uri.parse("${Constants.API_URL}/products/${pageNo}");
    var resStr = await http.get(uri);
    var response = json.decode(resStr.body);
    List<Product> products = [];
    if (response['con']) {
      var pList = response['result'] as List;
      products = pList.map((product) => Product.fromJson(product)).toList();
    }
    return products;
  }

  static Future<bool> loginUser({phone,password}) async{
    Uri uri= Uri.parse("${Constants.BASE_URL}/user");
    var json = jsonEncode({"phone":phone,"password":password});
    var resStr = await http.post(uri,body: json,headers: Constants.headers);
    var responseData = jsonDecode(resStr.body);
    var userData = responseData['result'];
    print(userData);
   Constants.user = User.fromJson(userData);
    return responseData['con'];
  }
  static Future<bool> registerUser({name,phone,password}) async{
    Uri uri= Uri.parse("${Constants.BASE_URL}/user/register");
    var json = jsonEncode({"name":name,"phone":phone,
    "email":"$name.com","password":password});
    var resStr = await http.post(uri,body: json,headers: Constants.headers);
    var responseData = jsonDecode(resStr.body);
    return responseData['con'];
  }
  
  static Future<bool> uploadOrder({total,items}) async{
    var json = jsonEncode({"total":total,"items":items});
     Uri uri= Uri.parse("http://localhost:3000/api/order");
     var response = await http.post(uri,body:json,headers: Constants.tokenheaders );
     var responseData = jsonDecode(response.body);
     print(responseData);
    return true;
  }
}
