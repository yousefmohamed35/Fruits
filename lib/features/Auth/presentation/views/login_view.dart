import 'package:flutter/material.dart';

import '../../../../core/widgets/build_app_bar.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'تسجيل الدخول'),
      body: const LoginViewBody(),
    );
  }
}
