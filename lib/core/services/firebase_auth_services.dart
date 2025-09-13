import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruiteapp/core/error/exception/custom_exception.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
       throw CustomException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('The account already exists for that email.');
        } else {
        throw CustomException(e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
