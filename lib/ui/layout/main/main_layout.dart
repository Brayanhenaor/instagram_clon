import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:instagram_clon/ui/pages/home/home_page.dart';
import 'package:instagram_clon/ui/pages/profile/profile_page.dart';
import 'package:instagram_clon/ui/pages/reels/reels_page.dart';
import 'package:instagram_clon/ui/pages/search/search_page.dart';
import 'package:instagram_clon/ui/theme/colors.dart';

import '../../../domain/controllers/main/main_controller.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const ReelsPage(),
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Obx(
        () => Scaffold(
          body: pages.elementAt(controller.page.value),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            currentIndex: controller.page.value,
            showUnselectedLabels: false,
            backgroundColor: AppColors.black,
            onTap: controller.changePage,
            selectedItemColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined),
                activeIcon: Icon(Icons.search),
                label: 'Search',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation_outlined),
                activeIcon: Icon(Icons.movie_creation),
                label: 'Add',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                activeIcon: Icon(Icons.shopping_bag),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: const CircleAvatar(
                  radius: 14,
                  backgroundImage: NetworkImage(
                      'https://divineyouwellness.com/blog/wp-content/uploads/2021/03/shutterstock_563564683-2048x1365.jpg'),
                ),
                activeIcon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(
                        'https://divineyouwellness.com/blog/wp-content/uploads/2021/03/shutterstock_563564683-2048x1365.jpg'),
                  ),
                ),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
