import 'package:app_votacao/core/components/logo/logo.dart';
import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppAppBar {
  static appBarBack(
      {double? elevation = 3,
      required void Function()? onTap,
      Color? color = AppThemes.white,
      Color? colorText = AppThemes.dark,
      Color? colorIcon = AppThemes.dark,
      bool? needLogo = true,
      String? title = ""}) {
    return AppBar(
      elevation: elevation,
      backgroundColor: color,
      centerTitle: true,
      title: needLogo!
          ? AppText.textPrimary(text: title!, color: colorText)
          : Container(),
      iconTheme: IconThemeData(color: colorIcon!),
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(FontAwesomeIcons.arrowLeft, color: colorIcon),
        onPressed: onTap,
      ),
    );
  }

  static appBarWithAccount({
    double? elevation = 3,
    required onTap,
  }) {
    return AppBar(
      title: AppLogo.logo(height: 45, width: 45),
      elevation: elevation,
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: AppThemes.white,
      iconTheme: const IconThemeData(color: AppThemes.primary),
      actions: [
        InkWell(
          onTap: () {
            // Get.toNamed(AppRoutes.profile);
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(3.0),
                child: Center(
                  child: Icon(
                    FontAwesomeIcons.userGear,
                    color: AppThemes.primary,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  static appBarBackWithAccount({
    double? elevation = 3,
    required onTap,
  }) {
    return AppBar(
      title: AppLogo.logo(height: 35, width: 35),
      elevation: elevation,
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppThemes.white,
      iconTheme: const IconThemeData(color: AppThemes.dark),
      leading: IconButton(
        icon: const Icon(FontAwesomeIcons.arrowLeft),
        onPressed: onTap,
      ),
      actions: [
        InkWell(
          onTap: () {
            // Get.toNamed(AppRoutes.profile);
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.person,
              color: AppThemes.dark,
              size: 35,
            ),
          ),
        )
      ],
    );
  }
}
