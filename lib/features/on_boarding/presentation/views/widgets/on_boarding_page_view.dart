import 'package:flutter/material.dart';
import 'package:marketi_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import '../../../../../core/utils/app_images.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          title:"Welcome to Marketi",
          subtitle: "Discover a world of endless possibilities and shop"
              " from the comfort of your fingertips Browse through a wide range of products,"
              " from fashion and electronics to home.",
          image: AppImages.onboardingImage1,
        ),
        PageViewItem(
          title: "Easy to Buy",
          subtitle: "Find the perfect item that suits your style"
              " and needs With secure payment options and fast delivery,"
              " shopping has never been easier.",
          image: AppImages.onboardingImage2,
        ),
        PageViewItem(
          title: "Wonderful User Experience",
          subtitle: "Start exploring now and experience the convenience of online shopping at its best.",
          image: AppImages.onboardingImage3,
        ),
      ],
    );
  }
}
