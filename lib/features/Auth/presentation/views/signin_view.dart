import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruiteapp/core/services/setup_service_locator.dart';
import 'package:fruiteapp/features/Auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';

import '../../../../core/widgets/build_app_bar.dart';
import '../../domain/repos/auth_repo.dart';
import '../manager/signin/signin_cubit.dart';


class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل الدخول'),
        body: SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
