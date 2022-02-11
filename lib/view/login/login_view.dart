import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gazihealty/core/components/customButton.dart';
import 'package:gazihealty/core/components/custom_textfield.dart';
import 'package:gazihealty/core/palette.dart';
import 'package:gazihealty/view/main/main_view.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wave_transition/wave_transition.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static TextEditingController mailController = TextEditingController();
  static TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Firebase.initializeApp();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/core/assets/back.jpg"),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset("lib/core/assets/login.json"),
                  CustomTextfield("E-Posta", Icons.mail, false, mailController),
                  CustomTextfield(
                      "Parola", Icons.password, true, passController),
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: CustomButton(
                        text: "Giriş Yap",
                        color: Palette.light,
                        onClick: () => {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: mailController.text,
                                      password: passController.text)
                                  .then(
                                    (value) => Navigator.push(
                                      context,
                                      WaveTransition(
                                          child: const MainView(),
                                          center: const FractionalOffset(
                                              0.90, 0.90),
                                          duration: const Duration(
                                              milliseconds: 500)),
                                    ),
                                  )
                            }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
