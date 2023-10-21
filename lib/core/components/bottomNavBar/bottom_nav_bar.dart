import 'package:app_votacao/core/components/icon/gradient_icon.dart';
import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNavBar {
  static Widget pattern({
    required int selected,
    required Function() onTapHome,
    required Function() onTapPalpite,
    required Function() onTapRanking,
    required Function() onTapConta,
  }) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: onTapHome,
                  child: SizedBox(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppGradientIcon(
                          FontAwesomeIcons.house, 21, selected == 0, 23),
                      const SizedBox(
                        height: 3,
                      ),
                      AppText.textPrimary(
                          text: ' HOME',
                          fontSize: 11,
                          color: selected == 0 ? AppThemes.i4 : AppThemes.dark,
                          textAlign: TextAlign.center)
                    ],
                  )),
                ),
               const SizedBox(width: 180,),
                // Visibility(
                //   visible: false,
                //   child: InkWell(
                //     onTap: onTapPalpite,
                //     child: SizedBox(
                //         child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         AppGradientIcon(
                //             FontAwesomeIcons.question, 21, selected == 1, 23),
                //         const SizedBox(
                //           height: 3,
                //         ),
                //         AppText.textPrimary(
                //             text: ' PALPITES',
                //             fontSize: 11,
                //             color:
                //                 selected == 1 ? AppThemes.i4 : AppThemes.dark,
                //             textAlign: TextAlign.center)
                //       ],
                //     )),
                //   ),
                // ),
                // InkWell(
                //   onTap: onTapRanking,
                //   child: SizedBox(
                //       child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       AppGradientIcon(
                //           FontAwesomeIcons.rankingStar, 21, selected == 2, 23),
                //       const SizedBox(
                //         height: 3,
                //       ),
                //       AppText.textPrimary(
                //           text: ' RANKING',
                //           fontSize: 11,
                //           color: selected == 2 ? AppThemes.i4 : AppThemes.dark,
                //           textAlign: TextAlign.center)
                //     ],
                //   )),
                // ),
                InkWell(
                  onTap: onTapConta,
                  child: SizedBox(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppGradientIcon(
                          FontAwesomeIcons.solidUser, 21, selected == 3, 23),
                      const SizedBox(
                        height: 3,
                      ),
                      AppText.textPrimary(
                          text: 'CONTA',
                          fontSize: 11,
                          color: selected == 3 ? AppThemes.i4 : AppThemes.dark,
                          textAlign: TextAlign.center)
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
