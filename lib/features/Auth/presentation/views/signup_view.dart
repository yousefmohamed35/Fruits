import 'package:flutter/material.dart';
import 'package:fruiteapp/core/widgets/build_app_bar.dart';
import 'package:fruiteapp/features/Auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حساب جديد'),
      body: SignupViewBody(),
    );
  }
}
