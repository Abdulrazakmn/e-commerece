

import 'package:e_commerce/authentication/login_screen/otp_verification_screen/otp_verification_view.dart';
import 'package:e_commerce/const/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.blue,
      child: SafeArea(
          child: Scaffold(
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Material(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(100),
                  ),
                  color: const Color.fromRGBO(230, 233, 250, 1),
                  child: SizedBox(
                    height: size.height / 1.5,
                    width: size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height / 10,
                        ),
                        Text(
                          "E-Commerce",
                          style: TextStyle(
                              color: Color.fromRGBO(9, 32, 196, 1),
                              fontSize: size.width / 9,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2),
                        ),
                        SizedBox(
                          height: size.height / 90,
                        ),
                        Text(
                          "It's all easy when it's at Home",
                          style: TextStyle(),
                        ),
                        SizedBox(
                          width: size.width / 1.2,
                          child: Row(
                            children: [
                              Container(
                                height: size.height / 10,
                                width: size.width / 150,
                                color: Color.fromRGBO(9, 32, 196, 1),
                              ),
                              SizedBox(
                                width: size.width / 40,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: "Welcome",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width / 20),
                                    children: [
                                      TextSpan(
                                          text:
                                              "Enter the details for Sign-up/Login",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  138, 132, 134, 1),
                                              fontSize: size.width / 50,
                                              fontWeight: FontWeight.w500))
                                    ]),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 20),
                  height: size.height / 15,
                  width: size.width / 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(9, 32, 196, 1))),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Phone Number",
                        counterText: ""),
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                CustomButton(
                  text: "Login/SignUp",
                  function: () {
                    Get.to(() => const OtpVerificationScreen());//navigation using getx
                  },
                  buttonwidth: 2.2,
                  radius: BorderRadius.circular(10),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
