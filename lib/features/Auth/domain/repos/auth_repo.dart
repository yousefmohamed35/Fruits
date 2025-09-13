import 'package:dartz/dartz.dart';
import 'package:fruiteapp/features/Auth/domain/entities/user_entity.dart';

import '../../../../core/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<Either<Failure, UserEntity>> signInWithGoogle();
}
