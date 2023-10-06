import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OtpScreenProvider extends ChangeNotifier {
  final String verificationId;
  OtpScreenProvider(this.verificationId);

  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void clearErrorMessage() {
    _errorMessage = '';
    notifyListeners();
  }

  Future<bool> verifyOtp(BuildContext context, String userOtp) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOtp,
      );
      await auth.signInWithCredential(credential);
      return true;
    } on FirebaseAuthException {
      _errorMessage = 'Error verifying OTP. Please enter correctly.';
      notifyListeners();
      return false;
    }
  }
}
