import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/product_model_api.dart';
import '../../shared/constanta.dart';

class ProductService {
  Future<Product?> getProducts() async {
    try {
      final response = await dio.get('$url/products/');
      print(response.data);
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<ProductElement?> getDetailsProducts({required int id}) async {
    try {
      final response = await dio.get('$url/products/$id');
      print(response.data);
      if (response.statusCode == 200) {
        return ProductElement.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<List<String>> getCategory() async {
    try {
      final response = await dio.get('$url/products/category-list');
      print(response.data);
      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      }
      return [];
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<ProductElement?> getProductsByCategory({required int category}) async {
    try {
      final response = await dio.get('$url/products/$category');
      print(response.data);
      if (response.statusCode == 200) {
        return ProductElement.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return throw Exception(e);
    }
  }
}
