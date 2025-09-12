import 'package:flutter/material.dart';

import '../../../../core/widgets/build_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context, title: 'تسجيل الدخول'));
  }
}
