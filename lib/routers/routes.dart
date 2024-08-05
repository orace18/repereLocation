import 'package:get/get.dart';
import 'package:kimo/pages/home_page/controllers/home_binding.dart';
import 'package:kimo/pages/home_page/index.dart';
import 'package:kimo/pages/onboarding_page/controllers/onboarding_binding.dart';
import 'package:kimo/pages/onboarding_page/index.dart';
import 'package:kimo/pages/splash_page/controllers/splash_binding.dart';
import 'package:kimo/pages/splash_page/index.dart';

class AppRouter {
  static var routes = [
    GetPage(
      name: '/splash',
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/onboarding',
      page: () => OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}