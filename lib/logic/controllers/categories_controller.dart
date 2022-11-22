import 'package:e_commerce/services/api_services/categories_service.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController{
  var categories = <String>[].obs;
  var images = <String>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getCategories();
  }

  Future getCategories()async{
    var allCategories =  await CategoryServices.getAllCategories();
    try {
      isLoading(true);
      if(allCategories.isNotEmpty){
        categories.addAll(allCategories);
        images.value = CategoryServices.images;
      }
    }finally{
      isLoading(false);

    }
  }
}