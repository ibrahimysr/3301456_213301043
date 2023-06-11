// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';

addBilgiler(QueryDocumentSnapshot doc, String konum, String kart_no,String kart_tarih,String Kart_cvv,
String Kart_sahibi
 ) {
  FirebaseFirestore.instance.collection("Bilgiler").add({
    "isim": doc["isim"],
    "detay": doc["detay"],
    "acıklama": doc["acıklama"],
    "fiyat": doc["fiyat"],
    "konum" : konum , 
    "kart_no" : kart_no ,
    "kart_tarih" : kart_tarih,
    "kart_sahibi" : Kart_sahibi, 
    "kart_cvv" : Kart_cvv,
  });
}