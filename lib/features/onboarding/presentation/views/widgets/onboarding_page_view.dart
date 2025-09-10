import 'package:flutter/material.dart';
import 'package:fruiteapp/core/utils/app_images.dart';
import 'package:fruiteapp/features/onboarding/presentation/views/widgets/page_view_item.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          image: Assets.imagesPageViewItem1Image,
          title: Row(
            children: [Text('مرحبًا بك في '), Text('Fruit'), Text('HUB')],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
        ),
      ],
    );
  }
}
