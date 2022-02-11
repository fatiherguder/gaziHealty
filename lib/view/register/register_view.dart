import 'dart:math';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gazihealty/core/components/customButton.dart';
import 'package:gazihealty/core/components/small_custon_textfield.dart';
import 'package:gazihealty/core/palette.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();

    return Stack(
      children: [
        buildBgImg(),
        buildBlackoutEffect(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: buildFormArea(),
          ),
        ),
      ],
    );
  }

  Container buildBgImg() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/core/assets/back.jpg"),
              fit: BoxFit.cover)),
    );
  }

  BackdropFilter buildBlackoutEffect() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
      ),
    );
  }

  Container buildAnimation() {
    return Container(
        width: 250,
        height: 250,
        child: Lottie.asset("lib/core/assets/register.json"));
  }

  static TextEditingController mailController = TextEditingController();
  static TextEditingController passController = TextEditingController();
  static TextEditingController ageController = TextEditingController();
  static TextEditingController weightController = TextEditingController();
  static TextEditingController heightController = TextEditingController();

  Column buildFormArea() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildAnimation(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: mailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Palette.light),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Palette.dark),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "E-Posta",
              hintStyle: TextStyle(color: Palette.light),
              prefixIcon: Icon(Icons.mail, color: Palette.light),
              filled: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: passController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Palette.light),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Palette.dark),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "Parola",
              hintStyle: TextStyle(color: Palette.light),
              prefixIcon: Icon(Icons.password, color: Palette.light),
              filled: true,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Palette.light),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Palette.dark),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: "Parola Tekrar",
              hintStyle: TextStyle(color: Palette.light),
              prefixIcon: Icon(Icons.password, color: Palette.light),
              filled: true,
            ),
          ),
        ),
        Row(
          children: [
            SmallCustomTextfield(
                "Yaş", Icons.calendar_today, false, ageController),
            SmallCustomTextfield(
                "Kilo", Icons.accessibility_new, false, weightController),
            SmallCustomTextfield("Boy", Icons.height, false, heightController),
          ],
        ),
        buildBtn()
      ],
    );
  }

  Padding buildBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: CustomButton(
          text: "Kayıt Ol", color: Palette.light, onClick: register),
    );
  }

  Future<void> register() async {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: mailController.text, password: passController.text)
        .then((user) => FirebaseFirestore.instance.collection("Users").add({
              'id': FirebaseAuth.instance.currentUser!.uid,
              'mail': mailController.text,
              'password': passController.text,
              'age': ageController.text,
              'weight': weightController.text,
              'height': heightController.text,
            }).whenComplete(
                () => print("Kullanıcı Firestore veritabanına eklendi")))
        .whenComplete(() => print("Kullanıcı Firebase'e eklendi"));
  }
}
