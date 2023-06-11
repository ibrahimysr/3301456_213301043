// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../ControlPage.dart';
import '../Pages/Loginpage.dart';

class FlutterFireAuthService {
  final FirebaseAuth _firebaseauth;
  FlutterFireAuthService(this._firebaseauth);

  //kimlik belirteç değerlerini kontrol edecek
  Stream<User?> get authStateChanges => _firebaseauth.idTokenChanges();

  Future<String> SignUp(
      String email, String password, String KullaniciAdi, context) async {
    try {
      await _firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                FirebaseFirestore.instance.collection("Kullanıcılar").add({
                  "email": email,
                  "Sifre": password,
                  "Kullanıcı Adı": KullaniciAdi
                }),
                Navigator.pop(context)
              });
      
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>const LoginPage()));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return "Success";
  }

  Future<String> SignIn(String email, String password, context) async {
    try {
      await _firebaseauth.signInWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ControlPage(_firebaseauth.currentUser)));
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    return "Success";
  }
}
