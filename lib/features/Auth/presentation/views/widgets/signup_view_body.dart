import 'package:flutter/material.dart';
import 'package:fruiteapp/core/widgets/custom_button.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import 'have_account.dart';
import 'terms_and_conditions_widget_state.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 24),
            CustomTextFormField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 16),
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
            TermsAndConditionsWidget(),
            const SizedBox(height: 30),
            CustomButton(title: 'إنشاء حساب جديد', onPressed: () {}),
            const SizedBox(height: 26),
            HaveAccount(),
          ],
        ),
      ),
    );
  }
}
