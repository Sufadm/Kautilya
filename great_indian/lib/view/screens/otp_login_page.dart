import 'package:flutter/material.dart';
import 'package:great_indian/controller/authenticationservice.dart';
import 'package:great_indian/controller/loading.dart';
import 'package:great_indian/view/screens/otp_verification_page.dart';
import 'package:great_indian/view/utils/const/sizedbox.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController = TextEditingController();
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color(0xFFF64236),
      body: SafeArea(
          child: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            kHeight20,
            const Center(
                child: CircleAvatar(
              radius: 27,
              backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/1325013514/photo/young-man-portrait.jpg?s=612x612&w=0&k=20&c=FpZRzeQmapNtn4I9rM1K1Sd_dhAOk7XNEG3WPDzhSeQ='),
            )),
            kHeight10,
            Container(
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 150, top: 5),
                    child: Text(
                      '',
                      style: TextStyle(
                        color: Color(0xFFF64236),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12, left: 12),
                    child: TextFormField(
                      controller: phoneNumberController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a phone number.';
                        }
                        if (value.length != 10) {
                          return 'Phone number must be 10 digits.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: 'Enter Mobile Number',
                          hintStyle: TextStyle(color: Color(0xFFF64236)),
                          border: InputBorder.none),
                    ),
                  ),
                  kHeight10,
                ],
              ),
            ),
            kHeight10,
            Consumer<LoadingProvider>(
              builder: (context, value, child) {
                return value.loading
                    ? const Center(child: CircularProgressIndicator())
                    : InkWell(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            value.loading = true;
                            AuthenticationService.sendPhoneNumber(
                              phoneNumberController.text,
                              context,
                              (verificationIdOrCode) {
                                if (verificationIdOrCode.isNotEmpty) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return OtpVerificationPage(
                                        verificationId: verificationIdOrCode);
                                  }));
                                } else {}
                              },
                            );
                          }
                        },
                        child: const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 37,
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      )),
    );
  }
}
