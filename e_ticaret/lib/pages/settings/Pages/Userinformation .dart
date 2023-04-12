// ignore_for_file: file_names, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/pages/settings/widget/Kullan%C4%B1c%C4%B1Colum.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Userinformation extends StatefulWidget {
  User? user;
  Userinformation(this.user, {super.key});

  @override
  State<Userinformation> createState() => _UserinformationState();
}

class _UserinformationState extends State<Userinformation> {
  final _kullaniciAdi = TextEditingController();
  final _email = TextEditingController();
  final _sifre = TextEditingController();

  firebaseData(
    User? user,
  ) async {
    var collection = FirebaseFirestore.instance.collection('Kullanıcılar');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      var email = data['email'];
      var kullaniciadi = data['Kullanıcı Adı'];
      var sifre = data['Sifre'];
      if (email == user?.email) {
        _kullaniciAdi.text = kullaniciadi;
        _email.text = email;
        _sifre.text = sifre;

        break;
      }
    }
  }

  @override
  void initState() {
    super.initState();
    firebaseData(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor,
        centerTitle: true,
        title: const Text(
          "Kullanıcı Bilgilerim",
          style: TextStyle(color: TextColor, fontSize: 20),
        ),
        elevation: 0,
      ),
      body: Container(
        color: Appcolor,
        child: Column(
          children: [
            kullaniciColum(
                "Kullanıcı Adı",
                const Icon(
                  Icons.supervised_user_circle,
                  color: Colors.grey,
                ),
                _kullaniciAdi),
            kullaniciColum(
                "Email",
                const Icon(
                  Icons.email,
                  color: Colors.grey,
                ),
                _email),
            kullaniciColum(
                "Şifre",
               const  Icon(
                  Icons.password,
                  color: Colors.grey,
                ),
                _sifre)
          ],
        ),
      ),
    );
  }
}

