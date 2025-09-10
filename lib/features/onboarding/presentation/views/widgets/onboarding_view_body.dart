import 'package:flutter/material.dart';
import 'package:fruiteapp/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(children: [Expanded(child: OnboardingPageView())]),
    );
  }
}
