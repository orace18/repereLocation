import 'package:get/get.dart';
import 'package:kimo/pages/connexion_page/controllers/connexion_controller.dart';

class ConnexionBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ConnexionController>(()=>ConnexionController());
  }
  
}