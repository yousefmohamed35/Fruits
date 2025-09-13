import 'package:flutter/material.dart';
import 'package:fruiteapp/core/utils/app_colors.dart';
import 'package:fruiteapp/core/utils/app_images.dart';
import 'package:fruiteapp/core/utils/app_text_styles.dart';
import 'package:fruiteapp/core/widgets/custom_text_form_field.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'dont_have_account.dart';
import 'or_divider.dart';
import 'social_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Color(0xffC9CECF),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomButton(title: 'تسجيل الدخول', onPressed: () {}),
            const SizedBox(height: 32),
            const DontHaveAccount(),
            const SizedBox(height: 32),
            const OrDivider(),
            const SizedBox(height: 16),
            SocialButton(
              title: 'تسجيل بواسطة جوجل',
              onPressed: () {},
              imageIcon: Assets.imagesGoogleIcon,
            ),
            const SizedBox(height: 16),
            SocialButton(
              title: 'تسجيل بواسطة أبل',
              onPressed: () {},
              imageIcon: Assets.imagesApplIcon,
            ),
            const SizedBox(height: 16),
            SocialButton(
              title: 'تسجيل بواسطة فيسبوك',
              onPressed: () {},
              imageIcon: Assets.imagesFacebookIcon,
            ),
          ],
        ),
      ),
    );
  }
}
