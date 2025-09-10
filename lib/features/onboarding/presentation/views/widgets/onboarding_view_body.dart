import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruiteapp/core/widgets/custom_button.dart';
import 'package:fruiteapp/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/kay_route.dart';
import '../../../../../core/services/setup_service_locator.dart';
import '../../../../../core/services/shared_prefrences_services.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_constants.dart';

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
          Expanded(child: OnboardingPageView(pageController: pageController)),
          DotsIndicator(
            dotsCount: 2,
            position: currentPage.toDouble(),
            decorator: DotsDecorator(
              activeColor: AppColors.primaryColor,
              color: AppColors.primaryColor.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 29),
          Visibility(
            visible: currentPage == 1,
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                onPressed: () {
                  getIt.get<SharedPreferencesService>().setBool(
                    AppConstants.kIsOnboardingSeen,
                    true,
                  );
                  GoRouter.of(context).go(KayRoute.login);
                },
                title: 'ابدأ الآن',
              ),
            ),
          ),
          const SizedBox(height: 43),
        ],
      ),
    );
  }
}
