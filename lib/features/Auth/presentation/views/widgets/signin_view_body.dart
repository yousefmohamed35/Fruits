import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruiteapp/core/utils/app_colors.dart';
import 'package:fruiteapp/core/utils/app_images.dart';
import 'package:fruiteapp/core/utils/app_text_styles.dart';
import 'package:fruiteapp/core/widgets/custom_text_form_field.dart';
import 'package:fruiteapp/features/Auth/presentation/views/widgets/password_form_field.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../manager/signin/signin_cubit.dart';
import 'dont_have_account.dart';
import 'or_divider.dart';
import 'social_button.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  late String email, password;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordFormField(
                onSaved: (value) {
                  password = value!;
                },
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
              CustomButton(
                title: 'تسجيل الدخول',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<SigninCubit>().signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 32),
              const DontHaveAccount(),
              const SizedBox(height: 32),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialButton(
                title: 'تسجيل بواسطة جوجل',
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
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
      ),
    );
  }
}
