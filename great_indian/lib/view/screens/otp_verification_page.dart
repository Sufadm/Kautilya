import 'dart:async';
import 'package:flutter/material.dart';
import 'package:great_indian/controller/verify_otp_provider.dart';
import 'package:great_indian/view/screens/web_view.dart';
import 'package:provider/provider.dart';

class OtpVerificationPage extends StatefulWidget {
  final String verificationId;

  const OtpVerificationPage({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  Timer? _timer;
  final int _timerDuration = 60;
  TextEditingController otpController = TextEditingController();
  int _currentSeconds = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_currentSeconds < _timerDuration) {
          _currentSeconds++;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OtpScreenProvider(widget.verificationId),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Center(
                child: Text(
                  'RETRIEVING OTP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF64236),
                    fontSize: 27,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'ENTER VERIFICATION CODE\nSENT TO YOUR PHONE NO\nIF AUTO-VERIFICATION FAILS',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 50,
              ),
              Consumer<OtpScreenProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      onChanged: (String text) {
                        value.clearErrorMessage();
                      },
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      decoration: const InputDecoration(
                        hintText: 'ENTER OTP',
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 70,
              ),
              Consumer<OtpScreenProvider>(
                builder: (context, value, child) {
                  return value.loading
                      ? const Center(child: CircularProgressIndicator())
                      : InkWell(
                          onTap: () async {
                            String userOtp = otpController.text;
                            bool verificationSuccess =
                                await value.verifyOtp(context, userOtp);
                            if (verificationSuccess) {
                              value.loading = true;
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const WebViewScreen();
                              }));
                            } else {
                              value.clearErrorMessage();
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 189, 182, 182)),
                              color: Colors.white,
                            ),
                            height: 50,
                            width: 270,
                            child: const Center(
                              child: Text(
                                'SUBMIT',
                                style: TextStyle(
                                    color: Color(0xFFF64236),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                },
              ),
              const SizedBox(
                height: 25,
              ),
              if (_currentSeconds < _timerDuration)
                Text(
                  ' ${_timerDuration - _currentSeconds}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFFF64236)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
