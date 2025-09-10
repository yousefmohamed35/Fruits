import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruiteapp/core/widgets/custom_button.dart';
import 'package:fruiteapp/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';

import '../../../../../core/utils/app_colors.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(child: OnboardingPageView()),
          DotsIndicator(
            dotsCount: 2,
            decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: AppColors.primaryColor.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 29),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(onPressed: () {}, title: 'ابدأ الآن'),
          ),
          const SizedBox(height: 43),
        ],
      ),
    );
  }
}
