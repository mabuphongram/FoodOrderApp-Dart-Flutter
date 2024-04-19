import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:foodmonkey_project/models/product.dart';
import 'package:foodmonkey_project/utils/Constants.dart';

class Detail extends StatefulWidget {
  final Product? product;
  const Detail({super.key, this.product});

  @override
  State<Detail> createState() => _DetailState(product);
}

class _DetailState extends State<Detail> {
  final Product? product;
  _DetailState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Page'),
      actions: [
        Constants.getCart(context,Constants.normal)
      ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    product?.name ?? "",
                    style: TextStyle(
                        color: Constants.normal,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                  Constants.getCart(context,Constants.accent)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildRichText("Price", '${product?.price} Ks'),
                  _buildRichText("Size", '${product?.size}'),
                  _buildRichText("Promo", 'Coca Cola'),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                Constants.sampleText,
                style: TextStyle(color: Constants.normal, fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 20,
              ),
              Table(
                border: TableBorder.all(color: Constants.normal),
                children: [
                  TableRow(children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Features',
                          style: TextStyle(
                              fontSize: 18, color: Constants.secondary),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Value',
                          style: TextStyle(
                              fontSize: 18, color: Constants.secondary),
                        ),
                      ),
                    ),
                  ]),
                  _buildTableRow('Size', 'Large Size'),
                  _buildTableRow('Size', 'Large Size'),
                ],
              ),
              SizedBox(height: 20,),
              Text(
                Constants.sampleText,
                style: TextStyle(color: Constants.normal, fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20,),
              Text('Warranty',style: TextStyle(color: Constants.normal,fontSize: 25),),
              SizedBox(height: 10,),
              Image.network('http://localhost:3000/uploads/7_Day_Return_Warrranty_1622277570833.png'),
              SizedBox(height: 20,),
              Text('Delivery',style: TextStyle(color: Constants.normal,fontSize: 25),),
              SizedBox(height: 10,),
              Image.network('http://localhost:3000/uploads/Hourly_Delivery_1617108235265.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRichText(text1, text2) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: "$text1\n",
          style: TextStyle(color: Constants.normal, fontSize: 30)),
      TextSpan(
          text: "\t\t\t\t\t\t${text2}",
          style: TextStyle(color: Constants.accent, fontSize: 18)),
    ]));
  }

  TableRow _buildTableRow(text1, text2) {
    return TableRow(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text1,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text2,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ),
    ]);
  }
}
