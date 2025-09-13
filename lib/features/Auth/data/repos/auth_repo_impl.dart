import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String name, required String email, required String password}) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }
 
}
