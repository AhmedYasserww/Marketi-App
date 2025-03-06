import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:marketi_app/core/utils/app_color.dart';
import 'package:marketi_app/core/widgets/custom_button.dart';
import 'package:marketi_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:marketi_app/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentIndex=0;
  @override
  void initState() {
    pageController=PageController();
    pageController.addListener((){

      setState(() {
        currentIndex=pageController.page!.round();
      });
    });
    super.initState();
  }
  @override
  dispose(){
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
          ),
      ),
        DotsIndicator(
          position: currentIndex.toInt(),
          decorator:   const DotsDecorator(
              color: Colors.grey,
              size:  Size(10.0, 10.0),
              activeSize:  Size(15.0, 15.0),
            activeColor: AppColors.primaryColor,

          ),
          dotsCount: 3,
        ),
        const SizedBox(height: 29,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomButton(
            onPressed: () {
              if (currentIndex < 2) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                  Navigator.pushReplacementNamed(context, SignInView.routeName);
              }
            },
            text: currentIndex==2? "Get Started":
            "Next",),
        ),
        const SizedBox(height: 32)
      ],
    );
  }
}
