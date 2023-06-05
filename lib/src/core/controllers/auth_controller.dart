import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kopa/src/core/controllers/base_controller.dart';
import 'package:kopa/router/route_pathes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authcontroller extends BaseController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpVerifyActive = false;
  String verificationID = '';
  bool isLoading = false;
  User? user;

  // PHONE
  Future<void> loginWithPhone() async {
    await auth.verifyPhoneNumber(
      phoneNumber: 'phoneHint'.tr + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
          (value) {
            showMessage('successful'.tr);
          },
        );
      },
      verificationFailed: (FirebaseAuthException exception) {
        showMessage("${exception.message}");
      },
      codeSent: (String verificationId, [int? resendToken]) {
        verificationID = verificationId;
        otpVerifyActive = true;
        update();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationID,
      smsCode: otpController.text,
    );

    await auth.signInWithCredential(credential).then(
      (value) {
        user = FirebaseAuth.instance.currentUser;
        update();
      },
    ).whenComplete(
      () {
        if (user != null) {
          showMessage('successful'.tr);
          () => Get.toNamed(AppRouter.homeScreen);
        } else {
          showMessage('failed'.tr);
        }
      },
    );
  }

  // GOOGLE
  Future<void> googleSignIn(context) async {
    final google = GoogleSignIn();
    final googleAccount = await google.signIn();

    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await auth.signInWithCredential(GoogleAuthProvider.credential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ));
          Get.toNamed(AppRouter.homeScreen);
        } on FirebaseException catch (error) {
          showMessage("${error.message}");
        } catch (error) {
          showMessage('$error');
        } finally {}
      }
    }
  }
}
