import 'package:app_votacao/context/home/controller/home_controller.dart';
import 'package:app_votacao/context/votacao/model/participante_model.dart';
import 'package:app_votacao/core/components/alerts/alerts.dart';
import 'package:app_votacao/core/controller/main_controller.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class VotacaoController extends GetxController {
  int selected = 100;



  List<ParticipanteEliminationModel> participantes = [];

  List<ParticipanteEliminationModel> participantesForSort = [
    ParticipanteEliminationModel(
        id: 1,
        name: 'Amanda',
        img: 'assets/imgs/amanda.jpeg',
        votes: 123,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 2,
        name: 'Ayarla',
        img: 'assets/imgs/ayarla.jpeg',
        votes: 231,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 3,
        name: 'Debochada',
        img: 'assets/imgs/debochada.jpeg',
        votes: 324,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 4,
        name: 'Disbocuda',
        img: 'assets/imgs/disbocuda.jpeg',
        votes: 345,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 5,
        name: 'Emily',
        img: 'assets/imgs/emily.jpeg',
        votes: 456,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 6,
        name: 'Gaga',
        img: 'assets/imgs/gaga.jpeg',
        votes: 533,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 7,
        name: 'Gracielly',
        img: 'assets/imgs/gracielly.jpeg',
        votes: 212,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 8,
        name: 'PyongLe',
        img: 'assets/imgs/pyongle.jpeg',
        votes: 111,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 9,
        name: 'Richelly',
        img: 'assets/imgs/richelly.jpeg',
        votes: 2345,
        eliminated: false),
  ];

  bool isLoading = true;

  confirmSendVote(
      ParticipanteEliminationModel model, BuildContext context, ) {
    if (Get.find<MainController>().userVotes == 0) {
      AppAlertsDialog.alertWithButtons(
          textBtnOk: 'COMPRAR MAIS VOTOS',
          // ignore: deprecated_member_use
          icon: FontAwesomeIcons.sadCry,
          title: 'Ops...',
          description: 'Que pena, parece que seus votos acabaram.',
          onTapOk: () {
            Get.close(0);
          },
          onTapClose: () {
            Get.close(0);
          },
          context: context);
    } else {
      AppAlertsDialog.alertVote(
          img: model.img,
          name: model.name,
          onTapOk: () {
            Get.close(0);
            sendVote(context, selected);
            Get.find<MainController>().userVotes = Get.find<MainController>().userVotes - 1;
            Get.find<HomeController>().update();
            update();
          },
          onTapClose: () {
            Get.close(0);
          },
          context: context);
    }
  }

  sendVote(BuildContext context, int index) async {
    isLoading = true;
    update();
    AppAlertsDialog.alertLoading(text: 'Registrando voto...', context: context);
    print(participantes[index].votes);
    participantes[index].votes = participantes[index].votes + 1;
    update();

    print(participantes[index].votes);
    await Future.delayed(const Duration(seconds: 1), () async {
      
      Get.close(0);
      AppAlertsDialog.alertMenssagemStatus(
          text: 'Voto registrado com sucesso!!',
          icon: FontAwesomeIcons.check,
          iconColor: AppThemes.success,
          context: context);
      await Future.delayed(const Duration(seconds: 1), () {
        Get.close(0);
      });
    });

    isLoading = false;
    update();
  }

  setNewSelected(int v) {
    selected = v;
    update();
  }

  @override
  void onInit() {
    participantesForSort.sort((a, b) => b.votes.compareTo(a.votes));

    participantes = participantesForSort;

    isLoading = false;
    update();

    super.onInit();
  }
}
