import 'package:flutter/material.dart';
import 'package:karostartup/views/screens/products/components/categories.dart';
import 'package:karostartup/views/screens/products/components/product_card.dart';

import '../../../../constants.dart';
import '../../../../models/products_model.dart';
import '../../../widgets/search_box.dart';

class ProductBody extends StatefulWidget {
  ProductBody({
    Key? key,
    required this.products,
    required this.categories,
  }) : super(key: key);

  List<ProductsModel> products;
  List<String> categories;

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  int categoryIndex = 0;

  List<ProductsModel> _products = [];

  sortProduct(int index) {
    _products = [];
    if (index > 0) {
      for (var product in widget.products) {
        if (widget.categories[index].compareTo(product.category) == 0) {
          _products.add(product);
        }
      }
    } else {
      _products = widget.products;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sortProduct(0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBox(onChanged: (value) {}),
        Categories(
            categories: widget.categories,
            onChanged: (newIndex) {
              setState(() {
                categoryIndex = newIndex;
                sortProduct(categoryIndex);
              });
            }),
        const SizedBox(height: 10),
        Expanded(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 70),
                decoration: const BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              _products.isNotEmpty
                  ? ListView.builder(
                      itemCount: _products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          itemIndex: index,
                          product: _products[index],
                        );
                      })
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
