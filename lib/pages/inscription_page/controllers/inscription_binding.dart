import 'package:get/get.dart';
import 'package:kimo/pages/inscription_page/controllers/inscription_controller.dart';

class InscriptionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<InscriptionController>(()=>InscriptionController());
  }

}