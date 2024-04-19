import 'package:flutter/material.dart';
import 'package:foodmonkey_project/models/product.dart';
import 'package:foodmonkey_project/pages/Login.dart';
import 'package:foodmonkey_project/utils/Constants.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: Constants.cartProducts.length,
                  itemBuilder: ((context, index) =>
                      _buildCartProducts(Constants.cartProducts[index])))),
          Container(
            height: 150,
            decoration: BoxDecoration(
                color: Constants.accent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sub Total : ',
                      style: TextStyle(
                          color: Constants.primary,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${Constants.getTotalCart()} Ks",
                      style: TextStyle(
                          color: Constants.normal,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                   if( Constants.user == null){
                     setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    });
                   } else {
                    print('Uploaded order');
                   }
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                  ), // Replace Icons.add with your desired icon
                  label: Text(
                    'Order Now',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCartProducts(Product product) {
    var url = product.images?[0];
    url =
        url.replaceAll('http://192.168.8.104:3000/', 'http://localhost:3000/');
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Stack(clipBehavior: Clip.none, children: [
          Positioned(
            right: -8,
            top: -5,
            child: InkWell(
              onTap: () {
                setState(() {
                  Constants.removeProduct(product);
                });
              },
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Constants.accent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: Icon(
                  Icons.clear,
                  color: Colors.white,
                )),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Image.network(
                  url,
                  width: 100,
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name ?? "",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    color: Constants.normal, fontSize: 16),
                                children: [
                                  TextSpan(
                                      text:
                                          "Price : ${product.price ?? 0} Ks\n"),
                                  TextSpan(
                                      text:
                                          "Total : ${(product.price ?? 0) * product.count} Ks"),
                                ]),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Constants.reduceProduct(product);
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Constants.normal,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.remove,
                                    size: 18,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                    product.count.toString().padLeft(2, '0'),
                                    style: TextStyle(fontSize: 18)),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    Constants.addProductCount(product);
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Constants.normal,
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Constants.primary,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
