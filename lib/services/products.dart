import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shopmobile/models/Product.dart';

class ProductsApis {
  Future<List<Product>> fetchData() async {
    try {
      Dio dio = Dio();
      final response = await dio.get('http://192.168.1.106:8000/api/products/');

      print(response.data);

      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        List<Product> products =
            jsonData.map((json) => Product.fromJson(json)).toList();

        return products;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load products');
    }
  }
}
