import 'package:app_votacao/core/binding/binding.dart';
import 'package:app_votacao/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.splash,
      locale: const Locale(
          'pt', 'BR'), // translations will be displayed in that locale
      getPages: AppPages.pages,
      scrollBehavior: MyScrollBehavior(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'Casa na Barra',
    ),
  );
}

class MyScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
