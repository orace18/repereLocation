import 'package:get/get.dart';
import 'package:kimo/pages/connexion_page/controllers/connexion_binding.dart';
import 'package:kimo/pages/connexion_page/index.dart';
import 'package:kimo/pages/inscription_page/controllers/inscription_binding.dart';
import 'package:kimo/pages/inscription_page/index.dart';
import 'package:kimo/pages/main_page/controllers/main_binding.dart';
import 'package:kimo/pages/main_page/index.dart';
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
      page: () => MainPage(),
      binding: MainBinding(),
    ),
     GetPage(
      name: '/inscription',
      page: () => InscriptionPage(),
      binding: InscriptionBinding(),
    ),
     GetPage(
      name: '/connexion',
      page: () => ConnexionPage(),
      binding: ConnexionBinding(),
    ),
  ];
}