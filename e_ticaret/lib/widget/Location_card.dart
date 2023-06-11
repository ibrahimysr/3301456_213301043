// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/widget/DeleteButton.dart';
import 'package:flutter/material.dart';

import '../style/color.dart';

Widget LocationCard(QueryDocumentSnapshot doc, context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      width: double.infinity,
      height: 160,
      decoration: BoxDecoration(
        color: Appcolor2,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: EnabledColor),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            doc["adres_baslik"],
            style: const TextStyle(fontSize: 23.0, color: TextColor),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: 10,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Text(
              doc["adres_detay"],
              style: const TextStyle(fontSize: 20.0, color: TextColor),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [DeleteButton(doc, context, "adresler")],
          )
        ],
      ),
    ),
  );
}
