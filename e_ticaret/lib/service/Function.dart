// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/service/BilgilerDao.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/Login/Pages/Loginpage.dart';

deleteData(id, String Referans) async {
  await FirebaseFirestore.instance.collection(Referans).doc(id).delete();
}

AddFavoriData(QueryDocumentSnapshot doc) async {
  FirebaseFirestore.instance.collection("Favoriler").add({
    "isim": doc["isim"],
    "detay": doc["detay"],
    "acıklama": doc["acıklama"],
    "fiyat": doc["fiyat"],
  });
}

addSepetData(QueryDocumentSnapshot doc, String UrunBoyutu, String UrunFiyat) {
  FirebaseFirestore.instance.collection("Sepet").add({
    "isim": doc["isim"],
    "detay": doc["detay"],
    "acıklama": doc["acıklama"],
    "fiyat": UrunFiyat,
    "Urun Boyutu": UrunBoyutu
  });
}



Future<void> signOut(context) async {
  final FirebaseAuth auth = FirebaseAuth.instance;
  await auth.signOut().then((value) => {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginPage()))
      });
}

Future<void> LocalVeriekle(String ad, String Email) async {
  await Bilgilerdao().BilgileriEkle(ad, Email);
}

Future passwordReset(String email, BuildContext context) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content:
                Text("Şifreniz Sıfırlandı Lütfen Emailinizi Kontrol Ediniz "),
          );
        });
  } on FirebaseAuthException catch (e) {
    print(e);
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("Hatalı İşlem Yaptınız Lütfen Tekrar Deneyiniz"),
          );
        });
  }
}


Future<void> deleteAllDocuments() async {
  final collectionRef = FirebaseFirestore.instance.collection('Sepet');
  final documents = await collectionRef.get();

  for (var document in documents.docs) {
    await document.reference.delete();
  }
}







