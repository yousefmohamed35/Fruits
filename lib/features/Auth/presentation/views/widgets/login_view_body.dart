import 'package:flutter/material.dart';
import 'package:fruiteapp/core/utils/app_colors.dart';
import 'package:fruiteapp/core/utils/app_text_styles.dart';
import 'package:fruiteapp/core/widgets/custom_text_form_field.dart';

import '../../../../../core/widgets/custom_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
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
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'لا تملك حساب؟ ',
                    style: TextStyles.semiBold16.copyWith(
                      color: const Color(0xff949D9E),
                    ),
                  ),
                  TextSpan(
                    text: ' قم بإنشاء حساب',
                    style: TextStyles.semiBold16.copyWith(
                      color: Color(0xff1B5E37),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
