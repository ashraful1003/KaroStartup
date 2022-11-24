import 'dart:convert';

import 'package:karostartup/models/api_response.dart';
import 'package:karostartup/models/products_model.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class ProductService {
  Future<APIResponse<List<ProductsModel>>> getProductsData() {
    var myHeaders = {
      'Content-Type': 'application/json',
    };

    Uri apiUrl = Uri.parse(APIROOT);

    return http.get(apiUrl, headers: myHeaders).then((value) {
      /// if the statuscode is 200 then I store the products from api
      if (value.statusCode == 200) {
        final jsonData = json.decode(value.body);
        List<ProductsModel> products = [];
        for (var tempData in jsonData) {
          ProductsModel product = ProductsModel.fromJson(tempData);
          products.add(product);
        }
        return APIResponse<List<ProductsModel>>(data: products);
      }

      /// if the status code is not 200 then the error is handle here
      return APIResponse<List<ProductsModel>>(
        error: true,
        errorMessage: value.statusCode.toString(),
      );
    }).catchError((e) => APIResponse<List<ProductsModel>>(
          /// if something else error is happened
          error: true,
          errorMessage: e.toString(),
        ));
  }
}
