import 'package:flutter/material.dart';
import 'package:fruiteapp/core/animation/animate_do.dart';
import 'package:fruiteapp/core/routes/kay_route.dart';
import 'package:fruiteapp/core/services/setup_service_locator.dart';
import 'package:fruiteapp/core/utils/app_constants.dart';
import 'package:fruiteapp/core/utils/app_images.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/services/shared_prefrences_services.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  void excuteNavigation() {
    final isOnboardingSeen = getIt.get<SharedPreferencesService>().getBool(
      AppConstants.kIsOnboardingSeen,
    );

    Future.delayed(Duration(seconds: 3), () {
      if (isOnboardingSeen == true) {
        GoRouter.of(context).pushReplacement(KayRoute.login);
        return;
      }
      GoRouter.of(context).pushReplacement(KayRoute.onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [SvgPicture.asset(Assets.imagesPlant)],
        ),
        CustomBounceInDown(
          duration: Duration(seconds: 1),
          child: SvgPicture.asset(Assets.imagesLogoo),
        ),

        SvgPicture.asset(Assets.imagesSplashBottom, fit: BoxFit.fill),
      ],
    );
  }
}
