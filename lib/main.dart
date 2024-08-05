import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kimo/helpers/languages/translator.dart';
import 'package:kimo/providers/theme.dart';
import 'package:kimo/providers/theme_provider.dart';
import 'package:kimo/routers/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider();
    return GetMaterialApp(
      navigatorKey: Get.key,
      translations: Translator(),
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      title: 'Kimo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.theme,
      initialRoute: '/splash',
      getPages: AppRouter.routes,

      // supportedLocales: const [...FormBuilderLocalizations.supportedLocales],
      localizationsDelegates: const [
        // GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
        //FormBuilderLocalizations.delegate,
      ],
    );
  }
}
