import 'package:get/get.dart';

class MainController extends GetxController {
  final RxInt page = 0.obs;
  
  void changePage(int value) {
    page.value = value;
  }
}
