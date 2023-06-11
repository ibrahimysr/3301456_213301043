// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

addDbCard(
    String kart_no, String kart_cvv, String kart_tarih, String kart_sahibi) {
  FirebaseFirestore.instance.collection("kartlar").add({
    "kart_no": kart_no,
    "kart_cvv": kart_cvv,
    "kart_tarih": kart_tarih,
    "kart_sahibi": kart_sahibi
  });
}
