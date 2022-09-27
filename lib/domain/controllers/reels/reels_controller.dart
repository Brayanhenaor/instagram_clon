import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:video_player/video_player.dart';

class ReelsController extends GetxController {
  var _lastIndex = 0;

  final RxMap<int, VideoPlayerController> videoPlayerControllerMap =
      <int, VideoPlayerController>{
    0: VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-man-under-colored-lights-1241-large.mp4')
      ..setLooping(true)
      ..initialize(),
    1: VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-red-frog-on-a-log-1487-large.mp4')
      ..setLooping(true)
      ..initialize(),
    2: VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-little-girl-in-nature-with-a-marshmallow-on-a-twig-39766-large.mp4')
      ..setLooping(true)
      ..initialize(),
    3: VideoPlayerController.network(
        'https://assets.mixkit.co/videos/preview/mixkit-family-walking-together-in-nature-39767-large.mp4')
      ..setLooping(true)
      ..initialize(),
  }.obs;

  late Future<void> initializeVideoPlayerFuture;

  void pageChanged(int page) {
    videoPlayerControllerMap[_lastIndex]!.pause();
    _lastIndex = page;
    videoPlayerControllerMap[_lastIndex]!.play();
  }

  @override
  void onInit() {
    super.onInit();
    videoPlayerControllerMap[0]!.play();
  }

  @override
  onClose() => videoPlayerControllerMap.forEach((_, value) => value.dispose());
}
