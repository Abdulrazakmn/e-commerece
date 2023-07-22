import 'package:e_commerce/authentication/login_screen/otp_verification_screen/otp_verification_view.dart';
import 'package:e_commerce/const/const.dart';
import 'package:e_commerce/home_screen/home_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController phone = TextEditingController();
  final TextEditingController otp = TextEditingController();
  String verificationId = "";
  bool isLoading = false;

  Future verifyPhoneNumber() async {
    isLoading = true;

    update();

    try {
      print("enter to try block");
      await _auth.verifyPhoneNumber(
        phoneNumber:"+91${phone.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          showAlert("Verifed");
        },
        verificationFailed: (FirebaseAuthException exception) {
          showAlert("Verification Failed");
        },
        codeSent: (String _verificationId, int? forceRespondToken) {
          showAlert("Verification code sent");

          verificationId = _verificationId;
          Get.to(() => const OtpVerificationScreen());
        },
        codeAutoRetrievalTimeout: (String _verificationId) {
          verificationId = _verificationId;
        },
      );
    } catch (e) {
      showAlert("Error Occured : $e");
    }
  }

  Future signInWithPhoneNumber() async {
    try {
      print("enter in signinwith phone number"
      );
      
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp.text,
      );

      var signInUser = await _auth.signInWithCredential(credential);//if user is new account create otherwise if there is account hten it wisign 

      final User? user = signInUser.user;

      showAlert("Sign In Sucessfully, User UID : ${user!.uid}");

      Get.to(() => const HomeScreenView());

      print("Sign In Sucessfully, User UID : ${user.uid}");
    } catch (e) {
      showAlert("Error Occured : $e");
    }
  }}