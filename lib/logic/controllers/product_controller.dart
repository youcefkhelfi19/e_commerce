import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/services/api_services/products_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController{
  var products = <Product>[].obs;
  var someProducts = <Product>[].obs;
  var favoritesProducts = <Product>[].obs;
  var categoryProducts = <Product>[].obs;
  var searchList = <Product>[].obs;
  RxBool isLoading = false.obs;
  TextEditingController textEditingController = TextEditingController();
  GetStorage storage = GetStorage();
  @override
  void onInit() {
    getProduct();
    getSomeProduct();
    readFavoritListFromGetStorage();
    super.onInit();
  }

  Future getProduct()async{
   var allProducts =  await ProductsServices.getAllProducts();
   try {
      isLoading(true);
     if(allProducts.isNotEmpty){
       products.addAll(allProducts);
       getCategoryProducts('jewelery');

     }
   }finally{
     isLoading(false);

   }
  }
  Future getSomeProduct()async{
    var products =  await ProductsServices.getSomeProducts();
    try {
      isLoading(true);
      if(products.isNotEmpty){
        someProducts.addAll(products);
      }
    }finally{
      isLoading(false);

    }
  }
  void manageFavorites(int productId)async{
    var selectedIndex = favoritesProducts.indexWhere((element) => element.id == productId);
    if(isFavorit(productId)){
       favoritesProducts.removeAt(selectedIndex);
       await storage.remove('favorit');
    }else{
      favoritesProducts.add(products.firstWhere((element) => element.id == productId));
      await storage.write('favorit', favoritesProducts);

    }
  }
 bool isFavorit(int productId){
    return favoritesProducts.any((element) => element.id == productId);
 }
 readFavoritListFromGetStorage(){
    List?  items = storage.read<List>('favorit');
    if(items !=null){
  favoritesProducts = items.map((item) => Product.fromJson(item)).toList().obs;
    }
 }
 searchProduct(String searchValue){
    searchList.value = products.where((Product item) {
      return item.title.contains(searchValue.toLowerCase())|| item.price.toString().contains(searchValue.toLowerCase());
    }).toList();
 }
 clearSearchResult(){
    searchList.clear();
 }
 getProductsByCategory(String category)async{
   var products =  await ProductsServices.getProductsByCategory(category);
   try {
     isLoading(true);
     if(products.isNotEmpty){
       categoryProducts.value = products;
       print('from controller$categoryProducts');
     }
   }finally{
     isLoading(false);

   }

 }
  getCategoryProducts(String category)async{
  categoryProducts.value =  products.where((Product item) {
      return item.category.toString().contains(category.toLowerCase());
    }).toList();
    print(categoryProducts);
  }

}
