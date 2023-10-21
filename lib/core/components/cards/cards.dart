import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

class AppCards {
  static Widget images(String img, String text, bool eliminated) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Stack(
        children: [
          Opacity(
            opacity: eliminated ? 0.5 : 1,
            child: Container(
              width: 110,
              height: 230,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  image: DecorationImage(
                      fit: BoxFit.fitHeight, image: AssetImage(img))),
            ),
          ),
          Container(
            width: 110,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(9),
                    bottomRight: Radius.circular(9)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: eliminated
                        ? [
                            AppThemes.greyDarker.withOpacity(0.0),
                            AppThemes.greyDarker.withOpacity(0.0),
                            AppThemes.greyDarker,
                            AppThemes.greyDarker
                          ]
                        : [
                            AppThemes.white.withOpacity(0.0),
                            AppThemes.white.withOpacity(0.0),
                            AppThemes.white.withOpacity(0.0),
                            AppThemes.white.withOpacity(0.0),
                            AppThemes.white.withOpacity(0.0),
                            AppThemes.white.withOpacity(0.0),
                            AppThemes.white.withOpacity(0.0),
                            AppThemes.i3.withOpacity(0.5),
                            AppThemes.i3.withOpacity(1),
                            AppThemes.i3.withOpacity(1),
                          ])),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: AppText.textPrimary(
                      text: eliminated ? 'E\nL\nI\nM\nI\nN\nA\nD\nO' : text,
                      textAlign: TextAlign.center,
                      fontSize: 18,
                      color: Colors.white),
                )),
          )
        ],
      ),
    );
  }

  static Widget ranking({
    required String img,
    required String name,
    required String votes,
    required int position,
    required bool selected,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: position == 1
              ? 80 : 60,
          width: position == 1
              ? 80 :60,
          decoration: BoxDecoration(
              border: Border.all(
                  color: selected ? AppThemes.primary : AppThemes.greyRegular,
                  width: 2),
              borderRadius: BorderRadius.circular(999),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, -1),
                    color: AppThemes.greyRegular,
                    blurRadius: 40,
                    spreadRadius: 0.1)
              ],
              image:
                  DecorationImage(image: AssetImage(img), fit: BoxFit.cover)),
        ),
        const SizedBox(
          height: 3,
        ),
        AppText.textPrimary(text: name, color: AppThemes.white, fontSize: 18),
        const SizedBox(
          height: 2,
        ),
        AppText.textSecundary(text: votes, color: AppThemes.white),
        const SizedBox(
          height: 3,
        ),
        Container(
          height: position == 1
              ? 85
              : position == 2
                  ? 55
                  : 40,
          width: 70,
          decoration: BoxDecoration(
            color: position == 1
                ? AppThemes.i1
                : position == 2
                    ? AppThemes.i3
                    : AppThemes.g1,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(9), topRight: Radius.circular(9)),
          ),
          child: Center(
              child: AppText.textPrimary(
                  text: position.toString(),
                  color: AppThemes.white,
                  fontSize: 28)),
        )
      ],
    );
  }

  static Widget palpites({required String title, required String description}) {
    return SizedBox(
      width: 230,
      child: Card(
        color: AppThemes.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.textPrimary(
                    text: title, fontSize: 18, color: AppThemes.primary),
                AppText.textSecundary(
                    text: description, color: AppThemes.dark72),
                AppText.textPrimary(
                    text: 'IR PARA A VOTAÇÃO',
                    fontSize: 12,
                    color: AppThemes.dark)
              ]),
        ),
      ),
    );
  }
}
