// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/widget/DeleteButton.dart';
import 'package:flutter/material.dart';

import '../style/color.dart';

Widget FavoriCard(Function()? ontap, QueryDocumentSnapshot doc, context) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsets.all(14),
      child: Wrap(runSpacing: 15, children: [
        Container(
          decoration: BoxDecoration(
              color: Appcolor2, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListTile(
                leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                        "assets/${doc.data().toString().contains("detay") ? doc.get("detay") : ""}.jpg")),
                title: Text(
                    doc.data().toString().contains("isim")
                        ? doc.get("isim")
                        : "",
                    style: const TextStyle(fontSize: 20, color: TextColor)),
                trailing: DeleteButton(doc, context, "Favoriler")),
          ),
        ),
      ]),
    ),
  );
}
