import 'package:flutter/material.dart';
import 'package:karostartup/views/screens/details/components/detail_body.dart';

import '../../../constants.dart';
import '../../../models/products_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.product}) : super(key: key);

  ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: 20),
          icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
        title: Text(
          'Back',
          style: Theme.of(context).textTheme.bodyText2,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 30,),
            onPressed: () {},
          ),
        ],
      ),
      body: DetailBody(product: product),
    );
  }
}
