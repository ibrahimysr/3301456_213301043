// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

addDbLocation(String adres_baslik, String adres_detay) {
  FirebaseFirestore.instance
      .collection("adresler")
      .add({"adres_baslik": adres_baslik, "adres_detay": adres_detay});
}
