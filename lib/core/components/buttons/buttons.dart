import 'package:app_votacao/core/components/loading/loading.dart';
import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

class AppButtons {
  static Widget buttonWithDisable(
      {required context,
      required String title,
      required Function() onTap,
      required bool enable,
      required bool isLoading}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width / 1.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: enable
                    ? [
                        AppThemes.gradient1,
                        AppThemes.gradient2,
                        AppThemes.gradient3,
                        AppThemes.gradient4,
                        AppThemes.gradient4,
                        AppThemes.gradient4,
                        AppThemes.gradient5,
                        AppThemes.gradient5,
                        AppThemes.gradient6,
                      ]
                    : [AppThemes.greyLight, AppThemes.greyLight])),
        child: Center(
            child: isLoading
                ? AppLoading.loading()
                : AppText.textPrimary(
                    text: title,
                    color: enable ? AppThemes.white : AppThemes.greyDarker,
                    fontWeight: FontWeight.w800,
                    fontSize: 15)),
      ),
    );
  }

  static Widget buttonSize(
      {required context, required String title, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppThemes.i1,
                  AppThemes.i3,
                  AppThemes.i4,
                  AppThemes.i5,
                ])),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppText.textPrimary(
              text: title,
              color: AppThemes.white,
              fontWeight: FontWeight.w800,
              fontSize: 15),
        )),
      ),
    );
  }
}
