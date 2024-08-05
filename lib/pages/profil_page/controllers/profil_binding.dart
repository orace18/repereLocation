import 'package:get/get.dart';
import 'package:kimo/pages/profil_page/controllers/profil_controller.dart';

class ProfilBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<ProfilController>(()=> ProfilController());
  }
  
}