import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/ui/views/account/account_view.dart';
import 'package:oberi_mobile/ui/views/home/home_view.dart';
import 'package:oberi_mobile/ui/views/main_nav/main_nav_controller.dart';
import 'package:oberi_mobile/ui/views/my_learning/my_learning_view.dart';
import 'package:oberi_mobile/ui/views/my_points/my_points_view.dart';
import 'package:oberi_mobile/ui/widgets/colored_status_bar.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class MainNavView extends StatelessWidget {
  static const String route = '/main-nav';

  const MainNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<MainNavController>(
      builder: (controller) {
        return ColoredStatusBar(
          color: Colors.white,
          bottomSafe: false,
          child: Scaffold(
            extendBody: true,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff5053EA).withOpacity(0.4),
                    spreadRadius: 4,
                    blurRadius: 12,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: BottomNavigationBar(
                  backgroundColor: AppColors.primary,
                  onTap: controller.changeTabIndex,
                  currentIndex: controller.tabIndex.value,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  unselectedItemColor: Colors.grey,
                  selectedItemColor: Colors.white,
                  selectedFontSize: 12,
                  items: [
                    _bottomNavigationBarItem(
                      label: 'Home',
                      selectedIcon: const SkyImage(
                          src: 'assets/images/nav_home_filled.svg'),
                      unSelectedIcon: const SkyImage(
                          src: 'assets/images/nav_home.svg'),
                    ),
                    _bottomNavigationBarItem(
                      label: 'My Learning',
                      selectedIcon: const SkyImage(
                          src: 'assets/images/nav_my_learning_filled.svg'),
                      unSelectedIcon: const SkyImage(
                          src: 'assets/images/nav_my_learning.svg'),
                    ),
                    _bottomNavigationBarItem(
                      label: 'My Point',
                      selectedIcon: const SkyImage(
                        src: 'assets/images/nav_my_point_filled.svg',
                      ),
                      unSelectedIcon:
                          const SkyImage(src: 'assets/images/nav_my_point.svg'),
                    ),
                    _bottomNavigationBarItem(
                      label: 'Account',
                      selectedIcon:
                          const SkyImage(src: 'assets/images/nav_account_filled.svg'),
                      unSelectedIcon:
                          const SkyImage(src: 'assets/images/nav_account.svg'),
                    ),
                  ],
                ),
              ),
            ),
            body: IndexedStack(
              index: controller.tabIndex.value,
              children: const [
                HomeView(),
                MyLearningView(),
                MyPointsView(),
                AccountView(),
              ],
            ),
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({
    required Widget selectedIcon,
    required Widget unSelectedIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      activeIcon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: selectedIcon,
      ),
      icon: Padding(
        padding: const EdgeInsets.all(4.0),
        child: unSelectedIcon,
      ),
      label: label,
    );
  }
}
