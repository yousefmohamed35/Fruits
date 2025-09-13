import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruiteapp/core/error/exception/custom_exception.dart';

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
      if (e.code == 'weak-password') {
        throw CustomException('كلمة المرور ضعيفة جداً.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('هذا البريد الإلكتروني مستخدم بالفعل.');
      } else {
        throw CustomException('حدث خطأ غير معروف.');
      }
    } catch (e) {
      throw CustomException('حدث خطأ: يرجى المحاولة مرة أخرى لاحقاً.');
    }
  }
}
