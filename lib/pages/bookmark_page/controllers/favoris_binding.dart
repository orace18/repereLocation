import 'package:get/get.dart';
import 'package:kimo/pages/bookmark_page/controllers/favoris_controller.dart';

class FavorisBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FavorisController>(()=> FavorisController());
  }
  
}