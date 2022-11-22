import 'package:e_commerce/helper/constants/api_urls.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:http/http.dart'as http;
class CategoryServices {
  static Future<List<String>> getAllCategories() async {
    var response = await http.get(Uri.parse(allCategoriesApi));
    if (response.statusCode == 200) {
      var responseData = response.body;
      return categoryFromJson(responseData);
    } else {
      return throw Exception('Failed to load products');
    }
  }
  static List<String> images= [
    'https://images.unsplash.com/photo-1615655406736-b37c4fabf923?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1605100804763-247f67b3557e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1445205170230-053b83016050?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80'
  ];
}