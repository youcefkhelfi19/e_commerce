import 'package:e_commerce/models/product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  var cartList = {}.obs;
  RxDouble total = 0.00.obs;
  void addToCart(Product  product){
    if(cartList.containsKey(product)){
      cartList[product] +=1;
      print(productSubTotal);
     }else{
      cartList[product] = 1;
      print(productSubTotal);
    }

  }
  get productSubTotal => cartList.entries.map((item) => item.key.price*item.value).toList();
  get productsTotal =>cartList.entries.map((item) => item.key.price*item.value).toList().reduce((value, element) => value+element).toStringAsFixed(2);

  void removeSingleFromCart(Product product){
    cartList.removeWhere((key, value) => key==product);
  }
  void clearCart(){
    cartList.clear();
  }
  void removeItemsFromCart(Product product){
    if(cartList.containsKey(product)&&cartList[product]==1){
      cartList.removeWhere((key, value) => key==product);
    }else{
      cartList[product] -=1;
    }
  }

}