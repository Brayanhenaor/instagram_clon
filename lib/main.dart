import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:instagram_clon/domain/controllers/main/main_controller.dart';
import 'package:instagram_clon/domain/controllers/reels/reels_controller.dart';
import 'package:instagram_clon/ui/layout/main/main_layout.dart';
import 'package:instagram_clon/ui/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.darkTheme,
        initialRoute: '/main',
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(
            name: '/main',
            page: () => MainLayout(),
            binding: BindingsBuilder(
              () {
                Get.lazyPut<MainController>(() => MainController());
                Get.lazyPut<ReelsController>(() => ReelsController(),
                    fenix: true);
              },
            ),
          ),
        ]);
  }
}
