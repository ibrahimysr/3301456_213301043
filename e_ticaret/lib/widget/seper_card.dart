// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/widget/DeleteButton.dart';
import 'package:flutter/material.dart';

import '../style/color.dart';

Widget SepetCard(
    Function()? ontap, QueryDocumentSnapshot doc, context, Function()? ontap2 ) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.all(14),
      child: Wrap(runSpacing: 15, children: [
        Container(
          decoration: BoxDecoration(
              color: Appcolor2, borderRadius: BorderRadius.circular(15)),
          child: ListTile(
              leading: CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/${doc.data().toString().contains("detay") ? doc.get("detay") : ""}.jpg")),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      doc.data().toString().contains("isim")
                          ? doc.get("isim")
                          : "",
                      style: const TextStyle(fontSize: 20, color: TextColor)),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                        "${doc.data().toString().contains("fiyat") ? doc.get("fiyat") : ""} ₺",
                        style: const TextStyle(fontSize: 20, color: TextColor)),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  Text(
                      doc.data().toString().contains("detay")
                          ? doc.get("detay")
                          : "",
                      style: const TextStyle(fontSize: 18, color: TextColor2)),
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Text(
                        doc.data().toString().contains("Urun Boyutu")
                            ? doc.get("Urun Boyutu")
                            : "",
                        style:
                            const TextStyle(fontSize: 18, color: TextColor2)),
                  ),
                ],
              ),
              trailing:  DeleteButton(doc, context, "Sepet") ),
        ),
      ]),
    ),
  );
}
