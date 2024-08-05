import 'package:get/get.dart';
import 'package:kimo/pages/home_page/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(()=> HomeController());
  }
  
}