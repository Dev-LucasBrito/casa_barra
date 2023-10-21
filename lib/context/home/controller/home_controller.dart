import 'package:app_votacao/context/votacao/model/participante_model.dart';
import 'package:app_votacao/core/components/alerts/alerts.dart';
import 'package:app_votacao/core/controller/main_controller.dart';
import 'package:app_votacao/core/themes/app_themes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  VideoPlayerController videoPlayerController =
      VideoPlayerController.networkUrl(Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
  bool isPlaying = false;
  bool isPopupOpen = false;

  int selectedPage = 0;

  List<ParticipanteEliminationModel> participantes = [
    ParticipanteEliminationModel(
        id: 1,
        name: 'Amanda',
        img: 'assets/imgs/amanda.jpeg',
        votes: 300,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Ayarla',
        img: 'assets/imgs/ayarla.jpeg',
        votes: 300,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Castanho',
        img: 'assets/imgs/castanho.jpeg',
        votes: 300,
        eliminated: true),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Debochada',
        img: 'assets/imgs/debochada.jpeg',
        votes: 300,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Deolane',
        img: 'assets/imgs/deolane.jpeg',
        votes: 300,
        eliminated: true),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Disbocuda',
        img: 'assets/imgs/disbocuda.jpeg',
        votes: 300,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Emily',
        img: 'assets/imgs/emily.jpeg',
        votes: 300,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Gaga',
        img: 'assets/imgs/gaga.jpeg',
        votes: 300,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Gilzona',
        img: 'assets/imgs/gilzona.jpeg',
        votes: 300,
        eliminated: true),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Gracielly',
        img: 'assets/imgs/gracielly.jpeg',
        votes: 300,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 1,
        name: 'PyongLe',
        img: 'assets/imgs/pyongle.jpeg',
        votes: 300,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Richelly',
        img: 'assets/imgs/richelly.jpeg',
        votes: 300,
        eliminated: false),
    ParticipanteEliminationModel(
        id: 1,
        name: 'Tiago',
        img: 'assets/imgs/tiago.jpeg',
        votes: 300,
        eliminated: true),
  ];

  selectNewPage(int index) {
    selectedPage = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    videoPlayerController.initialize().then((_) {
      update();
    });
    isLoading = false;
    update();
  }

  void playPauseVideo() {
    if (isPlaying) {
      videoPlayerController.pause();
    } else {
      videoPlayerController.play();
    }
    isPlaying = !isPlaying;
    update();
  }

  void openPopup(context) async {
    videoPlayerController.pause();
    videoPlayerController.seekTo(Duration(seconds: 0));
    isPlaying = false;
    isPopupOpen = false;
    update();
    videoPlayerController.play();
    update();
    await Future.delayed(Duration(seconds: 4), () {
      Get.close(0);
      AppAlertsDialog.alertMenssagemStatus(
          text: 'Você ganhou + 1 VOTO',
          icon: FontAwesomeIcons.solidHeart,
          iconColor: AppThemes.i1,
          context: context);
      Get.find<MainController>().userVotes =
          Get.find<MainController>().userVotes + 1;
      update();
    });
    await Future.delayed(const Duration(seconds: 2), () {
      Get.close(0);
    });
  }

  void closePopup() {
    isPlaying = false;
    isPopupOpen = false;
    update();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
