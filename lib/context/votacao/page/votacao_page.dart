import 'package:app_votacao/context/votacao/controller/votacao_controller.dart';
import 'package:app_votacao/core/components/appbar/appbar.dart';
import 'package:app_votacao/core/components/buttons/buttons.dart';
import 'package:app_votacao/core/components/cards/cards.dart';
import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/controller/main_controller.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VotacaoPage extends StatelessWidget {
  const VotacaoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VotacaoController>(
        init: VotacaoController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppThemes.i5,
            appBar: AppAppBar.appBarBack(
                elevation: 0,
                color: AppThemes.i1,
                title: "Quem vai sair ?",
                colorIcon: AppThemes.white,
                colorText: AppThemes.white,
                onTap: () {
                  Get.back();
                }),
            body: Stack(
              children: [
                ListView(
                  children: [
                    Container(
                      height: 220,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            AppThemes.i1,
                            AppThemes.i3,
                            AppThemes.i4,
                            AppThemes.i5,
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 33, right: 33),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.setNewSelected(1);
                              },
                              child: AppCards.ranking(
                                  selected: controller.selected == 1,
                                  img: controller.participantes[1].img,
                                  name: controller.participantes[1].name,
                                  position: 2,
                                  votes: controller.participantes[1].votes
                                      .toString()),
                            ),
                            InkWell(
                              onTap: () {
                                controller.setNewSelected(0);
                              },
                              child: AppCards.ranking(
                                  selected: controller.selected == 0,
                                  img: controller.participantes[0].img,
                                  name: controller.participantes[0].name,
                                  position: 1,
                                  votes: controller.participantes[0].votes
                                      .toString()),
                            ),
                            InkWell(
                              onTap: () {
                                controller.setNewSelected(2);
                              },
                              child: AppCards.ranking(
                                  selected: controller.selected == 2,
                                  img: controller.participantes[2].img,
                                  name: controller.participantes[2].name,
                                  position: 3,
                                  votes: controller.participantes[2].votes
                                      .toString()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(33),
                              topRight: Radius.circular(33)),
                          color: AppThemes.white),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 21, right: 12, left: 12),
                            child: ListView.builder(
                                itemCount: controller.participantes.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (c, i) {
                                  if (i == 0 || i == 1 || i == 2) {
                                    return Container();
                                  } else {
                                    return InkWell(
                                      onTap: () {
                                        controller.setNewSelected(i);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                AppText.textPrimary(
                                                    text: (i + 1).toString()),
                                                const SizedBox(
                                                  width: 9,
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: controller
                                                                      .selected ==
                                                                  i
                                                              ? AppThemes
                                                                  .primary
                                                              : AppThemes
                                                                  .greyRegular,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              999),
                                                      color: controller.selected ==
                                                              i
                                                          ? AppThemes
                                                              .greyRegular
                                                          : AppThemes
                                                              .greyRegular,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              controller
                                                                  .participantes[i]
                                                                  .img),
                                                          fit: BoxFit.fill)),
                                                ),
                                                const SizedBox(
                                                  width: 9,
                                                ),
                                                AppText.textPrimary(
                                                    text: controller
                                                        .participantes[i].name),
                                                const Spacer(),
                                                AppText.textPrimary(
                                                    text: controller
                                                        .participantes[i].votes
                                                        .toString())
                                              ],
                                            ),
                                            const Divider()
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                }),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 100,
                    color: AppThemes.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        AppText.textSecundary(text: 'Selecione alguém para votar'),
                        AppText.textPrimary(
                            text: 'VOCÊ TEM ${Get.find<MainController>().userVotes} VOTOS'),
                        AppButtons.buttonWithDisable(
                            context: context,
                            title: 'VOTAR',
                            onTap: () {
                              controller.confirmSendVote(
                                  controller.participantes[controller.selected],
                                  context);
                            },
                            enable: controller.selected != 100,
                            isLoading: controller.isLoading),
                      ]),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
