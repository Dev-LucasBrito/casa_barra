import 'package:app_votacao/context/palpites/controller/palpites_controller.dart';
import 'package:app_votacao/core/components/appbar/appbar.dart';
import 'package:app_votacao/core/components/buttons/buttons.dart';
import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PalpitesPage extends StatelessWidget {
  const PalpitesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PalpitesController>(
        init: PalpitesController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppAppBar.appBarBack(onTap: () {
              Get.back();
            }),
            body: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Column(
                children: [
                  Center(
                    child: AppText.textPrimary(
                        text: 'Selecione quem você acha que deve sair da casa!',
                        textAlign: TextAlign.center,
                        fontSize: 18),
                  ),
                  GridView.builder(
                      itemCount: controller.participantes.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 1, crossAxisCount: 2),
                      itemBuilder: (c, i) {
                        return InkWell(
                          onTap: () {
                            controller.setNewSelected(i);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Opacity(
                              opacity: controller.selected == i ? 1 : 0.5,
                              child: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.selected == i
                                            ? AppThemes.primary
                                            : AppThemes.greyRegular,
                                        width: 5),
                                    borderRadius: BorderRadius.circular(999),
                                    color: controller.selected == i
                                        ? AppThemes.greyRegular
                                        : AppThemes.greyRegular,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            controller.participantes[i]),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 43,
                  ),
                  AppButtons.buttonWithDisable(
                      context: context,
                      title: 'VOTAR',
                      onTap: () {},
                      enable: controller.selected != 100,
                      isLoading: controller.isLoading)
                ],
              ),
            ),
          );
        });
  }
}
