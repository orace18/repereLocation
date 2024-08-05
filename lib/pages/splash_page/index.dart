import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:kimo/pages/splash_page/controllers/splash_controller.dart';

class SplashPage extends GetWidget<SplashController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: controller.initApp(),
        builder: (_) =>
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logos/logo.png',
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ),
      ),
    );
  }
}