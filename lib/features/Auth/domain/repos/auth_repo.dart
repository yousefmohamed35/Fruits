import 'package:fruiteapp/features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> createUserWithEmailAndPassword(
      {required String name, required String email, required String password});
}
