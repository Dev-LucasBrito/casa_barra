import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppText {
  static Widget textPrimary(
      {required String text,
      TextAlign? textAlign,
      Color? color = AppThemes.primaryText,
      double? fontSize,
      FontWeight? fontWeight = FontWeight.w700,
      TextDecoration? decoration,
      TextOverflow? textOverflow,
      int? maxLine,
      String? fontFamily = 'Baloo2',
      double? height}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      maxLines: maxLine,
      softWrap: true,
      
      style: TextStyle(
          height: height,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: decoration,
          overflow: textOverflow,
          fontFamily: fontFamily),
    );
  }

  static Widget textSecundary({
    required String text,
    TextAlign? textAlign,
    Color? color = AppThemes.secundaryText,
    double? fontSize,
    FontWeight? fontWeight = FontWeight.w400,
    TextOverflow? textOverflow,
    TextDecoration? decoration,
  }) {
    return Text(
      text.tr,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      overflow: textOverflow,
    );
  }

  static Widget textButtonUnderline({
    required String text,
    required VoidCallback onPressed,
    Color? color,
    double? fontSize = 10,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: textPrimary(
        text: text,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
        decoration: TextDecoration.underline,
        // color: color ?? SyxThemes.secundaryText,
      ),
    );
  }

  static Widget parternRinch({
    required List<InlineSpan> textSpan,
    String? textPrimary,
    double? fontSize = 12.0,
    FontWeight? fontWeight = FontWeight.w400,
    double? heigth = 1.8,
    Color? color = AppThemes.primaryText,
    String? fontFamily,
    TextAlign? textAlign = TextAlign.start,
    bool? overflow = false,
  }) {
    return RichText(
      textAlign: textAlign!,
      text: TextSpan(
          spellOut: false,
          style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              overflow: overflow == true ? TextOverflow.ellipsis : null,
              decoration: TextDecoration.none),
          text: textPrimary,
          children: textSpan),
    );
  }
}
