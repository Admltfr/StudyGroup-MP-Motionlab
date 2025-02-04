import 'package:dio/dio.dart';
import 'package:study_group_flutter/app/data/models/user_model_api.dart';

import '../models/product_model_api.dart';
import '../../shared/constanta.dart';

class ApiService {
  Future<Product?> getProducts() async {
    try {
      final response = await dio.get('$url/products/');
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
      if (response.statusCode == 200) {
        return List<String>.from(response.data);
      }
      return [];
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<UserModel> userLogin(
      {required String username, required String password}) async {
    try {
      final response = await dio.post('$url/auth/login',
          data: {'username': username, 'password': password});
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception('Login Failed');
      }
    } catch (e) {
      return throw Exception(e);
    }
  }

  Future<User> getUserData(String? token) async {
    try {
      final response = await dio.get('$url/user/me',
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      } else {
        throw Exception('Login Failed');
      }
    } catch (e) {
      return throw Exception(e);
    }
  }
}
