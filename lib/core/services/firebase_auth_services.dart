import 'dart:developer' as dev;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruiteapp/core/error/exception/custom_exception.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

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
      dev.log(
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
       dev.log('Error in FirebaseAuthServices.createUserWithEmailAndPassword: $e');
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
      dev.log(
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
     dev.log('Error in FirebaseAuthServices.signInWithEmailAndPassword: $e');
      throw CustomException('حدث خطأ: يرجى المحاولة مرة أخرى لاحقاً.');
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  String generateNonce([int length = 32]) {
    final charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => charset[random.nextInt(charset.length)],
    ).join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future<UserCredential> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: nonce,
    );
    final oauthCredential = OAuthProvider(
      "apple.com",
    ).credential(idToken: appleCredential.identityToken, rawNonce: rawNonce);
    return await FirebaseAuth.instance.signInWithCredential(oauthCredential);
  }
}
