import 'package:flutter/material.dart';
import 'package:foodmonkey_project/models/product.dart';

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
      appBar: AppBar(title: Text('Detail Page')),
    );
  }
}
