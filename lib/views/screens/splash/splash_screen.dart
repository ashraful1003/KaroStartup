import 'package:flutter/material.dart';
import 'package:karostartup/models/api_response.dart';
import 'package:karostartup/services/product_service.dart';
import 'package:get_it/get_it.dart';
import 'package:karostartup/views/screens/products/products_screen.dart';

import '../../../models/products_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ProductService get productService => GetIt.instance<ProductService>();

  APIResponse<List<ProductsModel>>? productsResponse;

  getProducts() async {
    productsResponse = await productService.getProductsData();

    if (productsResponse != null && !productsResponse!.error) {
      List<String> categories = [];
      categories.add("All");
      for (var product in productsResponse!.data!) {
        categories.add(product.category);
      }
      categories = categories.toSet().toList();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => ProductsScreen(
                  products: productsResponse!.data!,
                  categories: categories,
                )),
      );
    } else {
      /// if the status code is not 200
      SnackBar(content: Text(productsResponse!.errorMessage!));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome".toUpperCase(),
            style: const TextStyle(
                fontSize: 60, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            margin: const EdgeInsets.symmetric(vertical: 60),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/logo.png')),
            ),
          ),
          // Image.asset('assets/logo.png'),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
