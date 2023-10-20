import 'package:app_votacao/core/components/logo/logo.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemes.bgScaffoldDark,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           AppLogo.logo()
          ]),
    );
  }
}
