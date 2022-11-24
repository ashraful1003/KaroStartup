import 'package:flutter/material.dart';
import 'package:karostartup/views/screens/products/components/product_body.dart';

import '../../../constants.dart';
import '../../../models/products_model.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({
    Key? key,
    required this.products,
    required this.categories,
  }) : super(key: key);

  List<ProductsModel> products;
  List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        centerTitle: false,
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_none_outlined))
        ],
      ),
      body: ProductBody(
        products: products,
        categories: categories,
      ),
    );
  }
}
