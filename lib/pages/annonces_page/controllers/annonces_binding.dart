import 'package:get/get.dart';
import 'package:kimo/pages/annonces_page/controllers/annonces_controller.dart';

class AnnoncesBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AnnoncesController>(()=>AnnoncesController());
  }
  
}