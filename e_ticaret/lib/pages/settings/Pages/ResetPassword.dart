// ignore_for_file: file_names

import 'package:e_ticaret/pages/Login/widget/Textfield.dart';
import 'package:e_ticaret/service/Function.dart';
import 'package:e_ticaret/style/color.dart';

import 'package:flutter/material.dart';

import '../../Login/widget/Loginbutton.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _email = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Appcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Şifresini Sıfırlamak İstediğiniz \n Emaili Giriniz",
              style: TextStyle(fontSize: 25, color: TextColor),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Mytextfield(
                    _email,
                    "Email",
                    const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    false)),
            LoginButton(
              "Şifreyi Sıfırla",
              () {
                passwordReset(_email.text.trim(), context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
