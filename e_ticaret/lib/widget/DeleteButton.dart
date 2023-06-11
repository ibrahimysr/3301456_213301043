// ignore_for_file: file_names, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../service/Function.dart';
import '../style/color.dart';

Widget DeleteButton(QueryDocumentSnapshot doc, context, String referans) {
  return IconButton(
    icon: const Icon(Icons.delete),
    color: Colors.red,
    onPressed: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Appcolor2,
              title: const Text(
                "Silmek İstiyormusunuz",
                style: TextStyle(color: Colors.white),
              ),
              content: const Text("Silinecek",
                  style: TextStyle(color: Colors.white)),
              actions: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: EnabledColor),
                    onPressed: () {
                      deleteData(doc.id, referans);
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Silindi")));
                      Navigator.pop(context);
                    },
                    child: const Text("Evet")),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: EnabledColor),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Hayır")),
              ],
            );
          });
    },
  );
}
