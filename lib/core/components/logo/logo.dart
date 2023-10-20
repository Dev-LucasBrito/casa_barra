import 'package:flutter/material.dart';

class AppLogo {
  static Widget logo({
    double? height = 100,
    double? width = 100,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/imgs/logo-casa.jpeg',
              ))),
    );
  }
}
