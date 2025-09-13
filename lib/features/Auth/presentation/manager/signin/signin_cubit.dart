
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruiteapp/features/Auth/domain/repos/auth_repo.dart';

import '../../../domain/entities/user_entity.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SigninLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SigninFailure(errorMessage: failure.message)),
      (user) => emit(SigninSuccess(user: user)),
    );
  }
}
