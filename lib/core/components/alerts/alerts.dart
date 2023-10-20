import 'package:app_votacao/core/components/loading/loading.dart';
import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppAlertsDialog {
  static alertOutWidget(
      {required BuildContext context,
      required Widget widget,
      bool? needClose = true,
      bool? barrieDismissible = false,
      double? maxHeight = 400,
      double? maxWidth = 250}) {
    return showGeneralDialog<void>(
      context: context,
      barrierDismissible: barrieDismissible!,
      barrierLabel: "",
      transitionDuration: const Duration(milliseconds: 200),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      pageBuilder: (context, _, __) {
        return SafeArea(
          child: Align(
            child: Container(
              constraints:
                  BoxConstraints(maxHeight: maxHeight!, maxWidth: maxWidth!),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Stack(
                  children: [
                    Center(
                      child: widget,
                    ),
                    Visibility(
                      visible: needClose!,
                      child: IconButton(
                          onPressed: () {
                            Get.close(0);
                          },
                          icon: const Icon(Icons.close)),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static alertLoading({
    required String text,
    required BuildContext context,
  }) {
    return AppAlertsDialog.alertOutWidget(
        context: context,
        barrieDismissible: false,
        needClose: false,
        widget: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9), color: AppThemes.white),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppLoading.loading(
                    color: AppThemes.i1,
                    secondRingColor: AppThemes.i3,
                    thirdRingColor: AppThemes.i5,
                    size: 33),
                const SizedBox(
                  height: 9,
                ),
                AppText.textPrimary(text: text)
              ],
            ),
          ),
        ));
  }

  static alertMenssagemStatus(
      {required String text,
      required IconData icon,
      required BuildContext context,
      Color? iconColor}) {
    return AppAlertsDialog.alertOutWidget(
        maxHeight: 100,
        maxWidth: 200,
        context: context,
        barrieDismissible: true,
        needClose: false,
        widget: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9), color: AppThemes.white),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ),
                const SizedBox(
                  height: 9,
                ),
                AppText.textPrimary(text: text, textAlign: TextAlign.center)
              ],
            ),
          ),
        ));
  }

  static alertVote(
      {required String img,
      required String name,
      required Function() onTapOk,
      required Function() onTapClose,
      required BuildContext context,
      Color? iconColor}) {
    return AppAlertsDialog.alertOutWidget(
        maxHeight: 230,
        maxWidth: 230,
        context: context,
        barrieDismissible: true,
        needClose: false,
        widget: Container(
          height: 230,
          width: 230,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9), color: AppThemes.white),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, -1),
                              color: AppThemes.greyRegular,
                              blurRadius: 10,
                              spreadRadius: 0.1)
                        ],
                        image: DecorationImage(
                            image: AssetImage(img), fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  AppText.textPrimary(
                      text: name, color: AppThemes.dark, fontSize: 18),
                  AppText.textSecundary(
                      text: 'Deseja votar em $name ?',
                      color: AppThemes.dark,
                      textAlign: TextAlign.center,
                      fontSize: 18),
                  const SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: onTapClose,
                            child: AppText.textPrimary(text: 'CANCELAR')),
                        InkWell(
                            onTap: onTapOk,
                            child: AppText.textPrimary(
                                text: 'VOTAR', color: AppThemes.primary)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  static alertWithButtons(
      {required IconData icon,
      required String title,
      required String description,
      required String textBtnOk,
      required Function() onTapOk,
      required Function() onTapClose,
      required BuildContext context,
      Color? iconColor}) {
    return AppAlertsDialog.alertOutWidget(
        maxHeight: 230,
        maxWidth: 230,
        context: context,
        barrieDismissible: true,
        needClose: false,
        widget: Container(
          height: 230,
          width: 230,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9), color: AppThemes.white),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 9,
                  ),
                  AppText.textPrimary(text: title, textAlign: TextAlign.center),
                  AppText.textSecundary(
                      text: description, textAlign: TextAlign.center),
                  const SizedBox(
                    height: 2,
                  ),
                  InkWell(
                      onTap: onTapOk,
                      child: AppText.textPrimary(
                          text: textBtnOk, color: AppThemes.primary)),
                  AppText.textSecundary(text: "------ ou ------"),
                  InkWell(
                      onTap: onTapClose,
                      child: AppText.textPrimary(text: 'CANCELAR')),
                ],
              ),
            ),
          ),
        ));
  }
}
