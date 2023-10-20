import 'package:app_votacao/context/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPopup extends StatelessWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isPopupOpen
          ? BottomSheet(
              onClosing: () {},
              builder: (context) {
                return Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: VideoPlayer(controller.videoPlayerController),
                      ),
                      ElevatedButton(
                        onPressed: controller.playPauseVideo,
                        child: Text(controller.isPlaying ? 'Pause' : 'Play'),
                      ),
                    ],
                  ),
                );
              },
            )
          : SizedBox.shrink(),
    );
  }
}
