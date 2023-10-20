import 'package:app_votacao/context/votacao/model/participante_model.dart';
import 'package:app_votacao/core/components/alerts/alerts.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class VotacaoController extends GetxController {
  int selected = 100;

  int votesUser = 1;

  List<ParticipanteEliminationModel> participantes = [
    ParticipanteEliminationModel(
        id: 1, name: 'Mario', votes: 200, img: "assets/imgs/homem3.png"),
    ParticipanteEliminationModel(
        id: 2, name: 'Laura', votes: 123, img: "assets/imgs/mulher1.png"),
    ParticipanteEliminationModel(
      id: 3,
      name: 'João',
      votes: 3211,
      img: "assets/imgs/homem.png",
    ),
    ParticipanteEliminationModel(
        id: 4, name: 'Clara', votes: 324, img: "assets/imgs/homem2.png"),
    ParticipanteEliminationModel(
        id: 5, name: 'Gertrudes', votes: 567, img: "assets/imgs/homem3.png"),
    ParticipanteEliminationModel(
        id: 6, name: 'Mariana', votes: 454, img: "assets/imgs/mulher1.png"),
    ParticipanteEliminationModel(
        id: 7, name: 'Clara', votes: 986, img: "assets/imgs/mulher1.png"),
  ];

  bool isLoading = true;

  confirmSendVote(ParticipanteEliminationModel model, BuildContext context) {
    if (votesUser == 0) {
      AppAlertsDialog.alertWithButtons(
          textBtnOk: 'COMPRAR MAIS VOTOS',
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
            sendVote(context);
          },
          onTapClose: () {
            Get.close(0);
          },
          context: context);
    }
  }

  sendVote(
    BuildContext context,
  ) async {
    isLoading = true;
    update();
    AppAlertsDialog.alertLoading(text: 'Registrando voto...', context: context);
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
    participantes.sort((a, b) => b.votes.compareTo(a.votes));

    isLoading = false;
    update();

    super.onInit();
  }
}
