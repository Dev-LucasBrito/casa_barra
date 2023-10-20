import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  final videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
  bool isPlaying = false;
  bool isPopupOpen = false;

  int selectedPage = 0;

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

  void openPopup() {
    isPopupOpen = true;
    update();
  }

  void closePopup() {
    videoPlayerController.pause();
    videoPlayerController.seekTo(Duration(seconds: 0));
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
