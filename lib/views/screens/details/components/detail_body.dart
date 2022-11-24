import 'package:flutter/material.dart';
import 'package:karostartup/views/screens/details/components/product_poster.dart';

import '../../../../constants.dart';
import '../../../../models/products_model.dart';
import 'add_cart.dart';
import 'list_of_colors.dart';

class DetailBody extends StatelessWidget {
  DetailBody({Key? key, required this.product}) : super(key: key);

  ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: '${product.id}',
                    child: ProductPoster(
                      size: MediaQuery.of(context).size,
                      image: product.image,
                    ),
                  ),
                ),
                ListOfColors(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    product.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: secondary,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    product.description,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const AddCart(),
        ],
      ),
    );
  }
}
