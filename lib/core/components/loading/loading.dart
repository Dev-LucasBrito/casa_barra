import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoading {
  static Widget loading(
      {Color? color = AppThemes.white,
      Color? secondRingColor = AppThemes.white,
      Color? thirdRingColor = AppThemes.white,
      double? size = 15}) {
    return LoadingAnimationWidget.discreteCircle(
        color: color!,
        secondRingColor: secondRingColor!,
        thirdRingColor: thirdRingColor!,
        size: size!);
  }

  static Widget appLoadingScaffold({required String title}) {
    return Scaffold(
        backgroundColor: AppThemes.bgScaffold,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Center(
                    child: SizedBox(
                      width: 50,
                      child: LoadingAnimationWidget.dotsTriangle(
                        color: AppThemes.pinkSex,
                        size: 50,
                      ),
                    ),
                  ),
                ),
              ),
              AppText.textPrimary(text: title),
            ],
          ),
        ));
  }
}
