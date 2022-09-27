import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:instagram_clon/domain/controllers/reels/reels_controller.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatelessWidget {
  const ReelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReelsController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text(
            'Reels',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.camera_alt_outlined,
                size: 30,
              ),
              onPressed: () {},
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Obx(
          () => PageView.builder(
            onPageChanged: controller.pageChanged,
            itemCount: controller.videoPlayerControllerMap.length,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => ReelItem(
              controller: controller.videoPlayerControllerMap[index]!,
            ),
          ),
        ),
      ),
    );
  }
}

class ReelItem extends StatelessWidget {
  final VideoPlayerController controller;

  const ReelItem({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) => SizedBox(
        height: p1.maxHeight,
        width: p1.maxWidth,
        child: Stack(
          children: [
            GestureDetector(
                onTap: () => controller.value.isPlaying
                    ? controller.pause()
                    : controller.play(),
                child: VideoPlayer(controller)),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/100',
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Brayanhenaor0',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                          onPressed: null,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.messenger_outline,
                            color: Colors.white,
                          ),
                          onPressed: null,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.send_outlined,
                            color: Colors.white,
                          ),
                          onPressed: null,
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
