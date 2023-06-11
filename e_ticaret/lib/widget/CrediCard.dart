// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/widget/DeleteButton.dart';
import 'package:flutter/material.dart';

import '../style/color.dart';

Widget CrediCardmodel(QueryDocumentSnapshot doc, context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      width: double.infinity,
      height: 190,
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
          const Text(
            'Kart Bilgileri',
            style: TextStyle(fontSize: 23.0, color: TextColor),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: 10,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Kart Numara:  ",
                style: TextStyle(fontSize: 18.0, color: TextColor),
              ),
              Text(
                doc["kart_no"],
                style: const TextStyle(fontSize: 18.0, color: TextColor),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const Text(
                    "Tarih:",
                    style: TextStyle(fontSize: 18.0, color: TextColor),
                  ),
                  Text(
                    doc["kart_tarih"],
                    style: const TextStyle(fontSize: 18.0, color: TextColor),
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "CVV:",
                    style: TextStyle(fontSize: 18.0, color: TextColor),
                  ),
                  Text(
                    doc["kart_cvv"],
                    style: const TextStyle(fontSize: 18.0, color: TextColor),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Text(
                    "Kart Sahibi:",
                    style: TextStyle(fontSize: 18.0, color: TextColor),
                  ),
                  Text(
                    doc["kart_sahibi"],
                    style: const TextStyle(fontSize: 18.0, color: TextColor),
                  )
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              DeleteButton(doc, context, "kartlar")
            ],
          ),
        ],
      ),
    ),
  );
}
