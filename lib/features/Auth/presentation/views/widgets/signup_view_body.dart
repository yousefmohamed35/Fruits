import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

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
          ],
        ),
      ),
    );
  }
}
