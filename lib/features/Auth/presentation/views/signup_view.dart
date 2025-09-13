import 'package:flutter/material.dart';
import 'package:fruiteapp/core/widgets/build_app_bar.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context, title: 'حساب جديد'));
  }
}
