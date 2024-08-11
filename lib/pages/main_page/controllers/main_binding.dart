import 'package:get/get.dart';
import 'package:kimo/pages/main_page/controllers/main_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MainController>(()=>MainController());
  }
  
}