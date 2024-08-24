import 'package:dio/dio.dart';
import 'package:finalproject/provider/models/Product_model.dart';
import 'package:finalproject/provider/models/cart_model.dart';
import 'package:finalproject/provider/models/catproduct_model.dart';

class ApiProvider {
  Future<List<String>?> getCategories() async {
    try {
      Response response = await Dio().get(
        'https://dummyjson.com/products/categories',
      );
      List<String> categories = List<String>.from(
          response.data.map((category) => category['name'].toString()));

      return categories;
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
      }
      print(e.toString());
    }
  }}

Future<Carts?> getCarts() async {
  final String url = 'https://dummyjson.com/carts';

  try {
    Response response = await Dio().get(url);

    if (response.statusCode == 200) {

      return Carts.fromJson(response.data);
    } else {
      print('Failed to load data: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Error: $e');
    return null;
  }
}


class CatProductApi {
  Future<CatProguct?> getProductsByCategory(String category) async {
    final String url = 'https://dummyjson.com/products/category/$category';

    try {
      Response response = await Dio().get(url);
      if (response.statusCode == 200) {
        return CatProguct.fromJson(response.data);
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching products: $e');
      return null;
    }
  }
}


Products? productsList;

class ProductsApi {
  Future<Products?> getProducts() async {
    try {
      Response response = await Dio().get(
        'https://dummyjson.com/products',
        queryParameters: {
          'select': 'id,title,category,price,thumbnail',
        },
      );
      productsList = Products.fromJson(response.data);
      print(response.data); // طباعة الاستجابة للتحقق من صحة البيانات

      return productsList;
    } catch (e) {
      if (e is DioException) {
        print('Dio Error: ${e.response?.data}');
      } else {
        print('Error: $e');
      }
      return null; // إعادة null في حالة الفشل
    }
  }
}
