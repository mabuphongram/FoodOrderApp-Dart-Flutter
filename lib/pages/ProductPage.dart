import 'package:flutter/material.dart';
import 'package:foodmonkey_project/models/product.dart';
import 'package:foodmonkey_project/pages/Preview.dart';
import 'package:foodmonkey_project/utils/Api.dart';
import 'package:foodmonkey_project/utils/Constants.dart';

class ProductPage extends StatefulWidget {
  final String? loadName, type;
  const ProductPage({super.key, this.loadName, this.type});

  @override
  State<ProductPage> createState() => _ProductPageState(loadName, type);
}

class _ProductPageState extends State<ProductPage> {
  String? loadName, type;
  List<Product> products = [];
  int pageNo = 0;
  bool isLoading = false;

  _ProductPageState(this.loadName, this.type);

  loadProducts() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 1));
    List<Product> pd = await Api.getPaginatedProducts(pageNo);
    print(await Api.getPaginatedProducts(0));
    setState(() {
      products.addAll(pd);
      pageNo++;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    print(type);
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Page'),
        ),
        body: Column(
          children: [
            Expanded(
                child: NotificationListener<ScrollNotification>(
              child: _buildProductGridView(),
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading && scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  loadProducts();
                }
                return false;
              },
            )),
            isLoading ? CircularProgressIndicator() : Text('')
          ],
        ));
  }

  GridView _buildProductGridView() {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => _buildProductCard(products[index]));
  }

  Column _buildProductCard(Product product) {
    var url = product.images?[0];
    url =
        url.replaceAll('http://192.168.8.104:3000/', 'http://localhost:3000/');
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Image.network(url),
        ),
        InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Preview(product: product,))),
          child: Text(product.name ?? "")),
        Text("${product.discount}")
      ],
    );
  }
}
