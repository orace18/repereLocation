import 'package:get/get.dart';
import 'package:kimo/pages/onboarding_page/controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<OnboardingController>(()=> OnboardingController());
  }

}