import 'package:flutter/material.dart';
import 'package:fruiteapp/core/animation/animate_do.dart';
import 'package:fruiteapp/core/routes/kay_route.dart';
import 'package:fruiteapp/core/utils/app_images.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

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
    Future.delayed(Duration(seconds: 3), () {
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
