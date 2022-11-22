import 'package:e_commerce/logic/controllers/cart_controller.dart';
import 'package:e_commerce/logic/controllers/categories_controller.dart';
import 'package:e_commerce/logic/controllers/product_controller.dart';
import 'package:get/get.dart';

class ProductBindings extends Bindings{
  @override
  void dependencies() {
   Get.put(ProductController());
   Get.put(CategoriesController());

   Get.lazyPut(() => CartController());
  }

}