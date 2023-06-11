// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/pages/settings/Pages/Card/dbSaveCard.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/CrediCard.dart';
import 'package:flutter/material.dart';

class SavedCard extends StatefulWidget {
  const SavedCard({super.key});

  @override
  State<SavedCard> createState() => _SavedCardState();
}

class _SavedCardState extends State<SavedCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor,
        centerTitle: true,
        title: (const Text(
          "Kayıtlı Kart Bilgilerim",
          style: TextStyle(fontSize: 20, color: TextColor),
        )),
      ),
      backgroundColor: Appcolor,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("kartlar").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                    shrinkWrap: true,
                    children: snapshot.data!.docs
                        .map((e) => CrediCardmodel(e, context))
                        .toList()),
              );
            } else {
              return const Text("Bilgi Yok");
            }
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: EnabledColor,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const dbSavedCard()));
          },
          child: const Icon(Icons.save_rounded)),
    );
  }
}
