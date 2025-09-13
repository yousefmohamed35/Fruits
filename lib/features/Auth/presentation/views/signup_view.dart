import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruiteapp/core/widgets/build_app_bar.dart';
import 'package:fruiteapp/features/Auth/presentation/manager/signup/signup_cubit.dart';
import '../../../../core/services/setup_service_locator.dart';
import '../../domain/repos/auth_repo.dart';
import 'widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
