import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruiteapp/core/error/exception/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Error in FirebaseAuthServices.createUserWithEmailAndPassword: $e and code: ${e.code}',
      );
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('هذا البريد الإلكتروني مستخدم بالفعل.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الإلكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('فشل في الاتصال بالشبكة. يرجى التحقق من اتصالك.');
      } else {
        throw CustomException('حدث خطأ غير معروف.');
      }
    } catch (e) {
      log('Error in FirebaseAuthServices.createUserWithEmailAndPassword: $e');
      throw CustomException('حدث خطأ: يرجى المحاولة مرة أخرى لاحقاً.');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Error in FirebaseAuthServices.signInWithEmailAndPassword: $e and code: ${e.code}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException('الرقم السري او البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'wrong-password') {
        throw CustomException('الرقم السري او البريد الإلكتروني غير صحيح.');
      } else if (e.code == 'invalid-email') {
        throw CustomException('البريد الإلكتروني غير صالح.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException('فشل في الاتصال بالشبكة. يرجى التحقق من اتصالك.');
      } else {
        throw CustomException('حدث خطأ غير معروف.');
      }
    } catch (e) {
      log('Error in FirebaseAuthServices.signInWithEmailAndPassword: $e');
      throw CustomException('حدث خطأ: يرجى المحاولة مرة أخرى لاحقاً.');
    }
  }
  Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
}
