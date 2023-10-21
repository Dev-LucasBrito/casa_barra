import 'package:app_votacao/context/home/controller/home_controller.dart';
import 'package:app_votacao/context/participante/page/participante_page.dart';
import 'package:app_votacao/context/votacao/model/participante_model.dart';
import 'package:app_votacao/core/components/alerts/alerts.dart';
import 'package:app_votacao/core/components/bottomNavBar/bottom_nav_bar.dart';
import 'package:app_votacao/core/components/buttons/buttons.dart';
import 'package:app_votacao/core/components/cards/cards.dart';
import 'package:app_votacao/core/components/loading/loading.dart';
import 'package:app_votacao/core/components/text/text.dart';
import 'package:app_votacao/core/controller/main_controller.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:app_votacao/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: AppThemes.whiteBG,
            body: controller.isLoading
                ? AppLoading.appLoadingScaffold(title: 'Carregando...')
                : Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: controller.selectedPage == 0
                        ? ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppText.textSecundary(
                                          text: 'USUÁRIO', fontSize: 12),
                                      AppText.textPrimary(
                                          text: 'LucasBrito', fontSize: 18),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppText.textSecundary(
                                          text: 'VOTOS', fontSize: 12),
                                      AppText.textPrimary(
                                          text: Get.find<MainController>().userVotes.toString(), fontSize: 18),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 21,
                              ),
                              SizedBox(
                                height: 250,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.participantes.length,
                                  itemBuilder: (BuildContext context, int index) { 
                                    ParticipanteEliminationModel model = controller.participantes[index];
                                    return   InkWell(
                                      onTap: () {
                                        AppAlertsDialog.alertOutWidget(
                                            context: context,
                                            barrieDismissible: true,
                                            maxHeight: 450,
                                            widget:  ParticipantePage(model: model,));
                                      },
                                      child: AppCards.images(
                                          model.img,
                                          model.name,
                                          model.eliminated),
                                    );
                                   },
                                  
                                ),
                              ),
                              const SizedBox(
                                height: 21,
                              ),

                              /// ------------------- HORA DA VOTAÇÃO

                              AppText.textPrimary(
                                  text:
                                      'Está na hora da votação.\nVote em quem deve sair da casa',
                                  textAlign: TextAlign.center,
                                  fontSize: 16,
                                  color: AppThemes.dark),
                              const SizedBox(
                                height: 9,
                              ),
                              AppButtons.buttonSize(
                                  context: context,
                                  title: 'Clique aqui',
                                  onTap: () {
                                    Get.toNamed(AppRoutes.votacao);
                                  }),
                              const SizedBox(
                                height: 21,
                              ),

                              /// ------------------- PALPITES

                              AppText.textPrimary(
                                  text: 'Palpites', fontSize: 17),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 130,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    AppCards.palpites(
                                        title: 'Quem vai ganhar?',
                                        description:
                                            'Quem você acha que vai ganhar a casa?'),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    AppCards.palpites(
                                        title: 'Shipar Casal',
                                        description:
                                            'Shipe um casa, se você acerta, você ganha 1 VOTO'),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                    AppCards.palpites(
                                        title: 'Próxima Casa!',
                                        description:
                                            'Quem você quer ver na próxima casa?'),
                                    const SizedBox(
                                      width: 9,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 21,
                              ),

                              /// ------------------- TENHA MAIS VOTOS

                              AppText.textPrimary(
                                  text: 'Tenha mais votos', fontSize: 17),
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: 230,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                      colors: [
                                        AppThemes.i1,
                                        AppThemes.i3,
                                        AppThemes.i4,
                                        AppThemes.i5,
                                      ]),
                                  borderRadius: BorderRadius.circular(9),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      color: Colors.black12,
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        AppText.textPrimary(
                                            text: '10 VOTOS',
                                            fontSize: 18,
                                            color: AppThemes.white),
                                        AppText.textPrimary(
                                            text: 'R\$9,90',
                                            fontSize: 24,
                                            color: AppThemes.white),
                                      ]),
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.openPopup(context);
                                  AppAlertsDialog.alertOutWidget(
                                      context: context,
                                      maxHeight:
                                          MediaQuery.of(context).size.height,
                                      maxWidth:
                                          MediaQuery.of(context).size.width,
                                      widget: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: VideoPlayer(controller
                                                  .videoPlayerController),
                                            ),
                                           
                                          ],
                                        ),
                                      ));
                                },
                                child: Container(
                                  width: 230,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 1),
                                          color: Colors.black12,
                                          blurRadius: 10,
                                        )
                                      ],
                                      color: AppThemes.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          AppText.textPrimary(
                                              text: 'Assista para ganhar:',
                                              fontSize: 18,
                                              color: AppThemes.dark),
                                          AppText.textPrimary(
                                              text: '+1 VOTO',
                                              fontSize: 18,
                                              color: AppThemes.primary),
                                        ]),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              )
                            ],
                          )
                        : Container(
                            color: Colors.amber,
                          ),
                  ),
            bottomNavigationBar: AppBottomNavBar.pattern(
                selected: controller.selectedPage,
                onTapHome: () {
                  controller.selectNewPage(0);
                },
                onTapPalpite: () {
                  controller.selectNewPage(1);
                },
                onTapRanking: () {
                  controller.selectNewPage(2);
                },
                onTapConta: () {
                  controller.selectNewPage(3);
                }),
          );
        });
  }
}
