import 'package:e_commerce/helper/constants/api_urls.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:http/http.dart'as http;
class ProductsServices{
 static Future<List<Product>> getAllProducts()async{
     var response = await http.get(Uri.parse(allProductsApi));
     if(response.statusCode == 200){
       var responseData = response.body;
       return productFromJson(responseData);
     }else {
       return throw Exception('Failed to load products');
     }
  }

 static Future<List<Product>> getSomeProducts()async{
   var response = await http.get(Uri.parse(someProductsApi));
   if(response.statusCode == 200){
     var responseData = response.body;
     return productFromJson(responseData);
   }else {
     return throw Exception('Failed to load products');
   }
 }
 static Future<List<Product>> getProductsByCategory(String category)async{
   var response = await http.get(Uri.parse('https://fakestoreapi.com/products/category/$category'));
   if(response.statusCode == 200){
     var responseData = response.body;
     return productFromJson(responseData);
   }else {
     return throw Exception('Failed to load products');
   }
 }
}