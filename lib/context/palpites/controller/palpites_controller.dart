import 'package:app_votacao/core/components/alerts/alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PalpitesController extends GetxController {
  int selected = 100;

  List participantes = [
    "assets/imgs/homem.png",
    "assets/imgs/homem2.png",
    "assets/imgs/homem3.png",
    "assets/imgs/mulher1.png",
  ];

  bool isLoading = true;

  sendVote(BuildContext context) {
    isLoading = true;
    update();
    AppAlertsDialog.alertOutWidget(
        context: context, widget: Container());
  }

  setNewSelected(int v) {
    selected = v;
    update();
  }

  @override
  void onInit() {
    isLoading = false;
    update();

    super.onInit();
  }
}
