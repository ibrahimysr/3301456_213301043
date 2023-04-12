import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Signup(TextEditingController Email, TextEditingController Sifre,
    TextEditingController KullaniciAdi, context) async {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: Email.text, password: Sifre.text)
      .then((value) => {
            FirebaseFirestore.instance.collection("Kullanıcılar").add({
              "email": Email.text,
              "Sifre": Sifre.text,
              "Kullanıcı Adı": KullaniciAdi.text
            }),
            Navigator.pop(context)
          });
}

Future<User?> loginFunction(
    String Email, String Sifre, BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: Email, password: Sifre);
    user = userCredential.user;
  } on FirebaseException catch (e) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("Hatalı Email veya Şifre Tekrar Deneyiniz"),
          );
        });

    print(e);
  }

  return user;
}
