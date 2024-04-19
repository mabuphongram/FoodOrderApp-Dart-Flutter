import 'package:flutter/material.dart';
import 'package:foodmonkey_project/models/Cat.dart';
import 'package:foodmonkey_project/models/Tag.dart';
import 'package:foodmonkey_project/models/product.dart';
import 'package:foodmonkey_project/pages/Cart.dart';

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

  static String getImageLink(image) {
    return image;
  }

  static List<Tag> tags = [];
  static List<Cat> cats = [];

  static List<Product> cartProducts = [];

  static String sampleText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ";

  static addToCart(product) {
    bool exist = false;
    if (cartProducts.length > 0) {
      cartProducts.forEach((pro) {
        if (pro.id == product.id) {
          pro.count++;
          exist = true;
        }
      });
      if (!exist) {
        cartProducts.add(product);
      }
    } else {
      cartProducts.add(product);
    }
  }

  //remove product
  static removeProduct(product) {
    cartProducts.removeWhere((pro) => pro.id == product.id);
  }

  //add count product
  static addProductCount(product) {
    cartProducts.forEach((pro) {
      if (pro.id == product.id) {
        pro.count++;
      }
    });
  }

  //reduce count product
  static reduceProduct(product) {
    cartProducts.forEach((pro) {
      if (pro.id == product.id) {
       if (pro.count > 0) {
        pro.count--;
      }
      }
      // if (pro.count > 0) {
      //   pro.count--;
      // }
    });
  }

  //cart
  static Padding getCart(context,Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20),
      child: Stack(
        //another way to make overflow visible
        clipBehavior: Clip.none,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
            },
            child: Icon(
              Icons.shopping_cart,
              size: 40,
              color: color,
            ),
          ),
          Positioned(
            right: 0,
            top: -5,
            child: Container(
              width: 20,
              height: 20,
              decoration:
                  BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child:
                  Center(child: Text(Constants.cartProducts.length.toString())),
            ),
          )
        ],
      ),
    );
  }

  static int getTotalCart() {
    int total =0;
    cartProducts.forEach((p) {
      total += int.parse(p.price.toString()) * p.count;
     });
     return total;
  }
}
