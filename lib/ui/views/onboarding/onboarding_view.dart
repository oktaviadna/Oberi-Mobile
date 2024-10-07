import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oberi_mobile/core/themes/app_colors.dart';
import 'package:oberi_mobile/core/themes/app_style.dart';
import 'package:oberi_mobile/ui/views/onboarding/onboarding_controller.dart';
import 'package:oberi_mobile/ui/widgets/sky_button.dart';
import 'package:oberi_mobile/ui/widgets/sky_image.dart';

class OnBoardingData {
  final String image, tittle, description;

  OnBoardingData({
    required this.image,
    required this.tittle,
    required this.description,
  });
}

final List<OnBoardingData> onBoardItem = [
  OnBoardingData(
      image: "assets/images/onboarding_1.png",
      tittle: "Belajar Public Speaking \nsecara Online",
      description:
          "Oberi is a well platform for public speaking.You \ncan learn online anywhere & anytime!"),
  OnBoardingData(
      image: "assets/images/onboarding_2.png",
      tittle: "Review & Konsultasi\n dengan Mentor",
      description:
          "Join live session with mentor and get notified \nfor their review & consultation"),
  OnBoardingData(
      image: "assets/images/onboarding_3.png",
      tittle: "Post-test & Challenge \n Mingguan",
      description: "Do your post test & challenge to \nmeasure your ability"),
];

class OnboardingView extends GetView<OnboardingController> {
  static const route = "/onboarding";

  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              itemCount: onBoardItem.length,
              controller: controller.pageController,
              itemBuilder: (context, index) {
                return onBoardingContent(
                  context,
                  image: onBoardItem[index].image,
                  title: onBoardItem[index].tittle,
                  description: onBoardItem[index].description,
                );
              },
              onPageChanged: (index) {
                controller.currentIndex.value = index;
              },
            ),
            Obx(
              () => Container(
                height: kToolbarHeight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (controller.isFirstPage)
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () =>
                                controller.pageController.jumpToPage(2),
                            child: const Icon(Icons.arrow_back),
                          ),
                    controller.isLastPage
                        ? const SizedBox.shrink()
                        : GestureDetector(
                            onTap: () =>
                                controller.pageController.jumpToPage(2),
                            child: const Text(
                              "Lewati",
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: const Alignment(0, 0.60),
              child: Obx(
                () => buildIndicator(
                  itemCount: onBoardItem.length,
                  currentIndex: controller.currentIndex.value,
                ),
              ),
            ),
            const SizedBox(height: 41),
            Container(
              alignment: const Alignment(0, 0.80),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SkyButton(
                text: 'Selanjutnya',
                onPressed: () {
                  controller.onNextPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget onBoardingContent(
    BuildContext context, {
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SkyImage(
          src: image,
          height: 270,
          fit: BoxFit.cover,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyle.subtitle2.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Text(
                description,
                textAlign: TextAlign.center,
                style: AppStyle.subtitle4.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildIndicator({required int itemCount, required int currentIndex}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(
        itemCount,
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: (index == currentIndex)
                ? const SkyImage(src: 'assets/images/oval_horizontal.svg')
                : Icon(Icons.circle, size: 10, color: Colors.grey.shade400),
          );
        },
      ),
    );
  }
}
