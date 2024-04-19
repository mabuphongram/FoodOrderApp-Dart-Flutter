import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:foodmonkey_project/models/product.dart';
import 'package:foodmonkey_project/pages/Detail.dart';
import 'package:foodmonkey_project/utils/Constants.dart';
import 'dart:math' as math;

class Preview extends StatefulWidget {
  final Product? product;
  const Preview({super.key, this.product});

  @override
  State<Preview> createState() => _PreviewState(product);
}

class _PreviewState extends State<Preview> {
  final Product? product;
  _PreviewState(this.product);
  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Preview'),
        actions: [
          Constants.getCart(context,Constants.accent)
        ],
        ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CustomPaint(
              painter: ArcPainter(mSize),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    product?.name ?? "",
                    style: TextStyle(
                        color: Constants.normal,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 150,
                  child: Swiper(
                    index: 0,
                    itemCount: product?.images?.length ?? 0,
                    itemBuilder: (context, index) {
                      var url = product?.images?[index];
                      url = url.replaceAll(
                          'http://192.168.8.104:3000/', 'http://localhost:3000/');
        
                      return Image.network(
                        url ?? "",
                        fit: BoxFit.contain,
                      );
                    },
                    // autoplay: true,
                    scrollDirection: Axis.horizontal,
                    pagination:
                        SwiperPagination(alignment: Alignment.centerRight),
                    control: SwiperControl(),
                  ),
                ),
               _buildRichText("Price", '\t\t\t\t\t${product?.price} Ks'),
                SizedBox(
                  height: 20,
                ),
                _buildRichText("Size", '\t\t\t\t\t${product?.size}'),
                SizedBox(
                  height: 20,
                ),
                _buildRichText('Promo', '\t\t\t\t\tCoca Cola'),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                         Constants.addToCart(product);
                        });
                      },
                      icon: Icon(Icons
                          .shopping_cart), // Replace Icons.add with your desired icon
                      label: Text('Buy Now'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Detail(product: product,)));
                      },
                      icon: Icon(Icons
                          .more_horiz), // Replace Icons.add with your desired icon
                      label: Text('Detail'),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRichText(text1, text2) {
    return Padding(
      padding: EdgeInsets.only(left: 50),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "$text1\n",
            style: TextStyle(color: Colors.white, fontSize: 30)),
        TextSpan(
            text: "$text2",
            style: TextStyle(color: Constants.normal, fontSize: 18)),
      ])),
    );
  }
}

class ArcPainter extends CustomPainter {
  var mSize;

  ArcPainter(this.mSize);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var patin = new Paint();
    patin.color = Constants.secondary;
    final rect = Rect.fromLTRB(-550, 100, mSize.width + 5, mSize.height + 500);
    final startAngle = -degreeToRadian(100);
    final sweepAngle = degreeToRadian(300);
    final useCenter = false;

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, patin);
  }

  degreeToRadian(value) {
    return value * (math.pi / 180);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
