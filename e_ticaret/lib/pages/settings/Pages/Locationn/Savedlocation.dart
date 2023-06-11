// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/pages/settings/Pages/Locationn/dbSaveLocation.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/Location_card.dart';
import 'package:flutter/material.dart';

class Savedlocation extends StatefulWidget {
  const Savedlocation({super.key});

  @override
  State<Savedlocation> createState() => _SavedlocationState();
}

class _SavedlocationState extends State<Savedlocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor,
        centerTitle: true,
        title: (const Text(
          "Kayıtlı Adreslerim",
          style: TextStyle(fontSize: 20, color: TextColor),
        )),
      ),
      backgroundColor: Appcolor,
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("adresler").snapshots(),
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
                        .map((e) => LocationCard(e, context))
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
                MaterialPageRoute(builder: (context) => const dbSaveLocation()));
          },
          child: const Icon(Icons.save_rounded)),
    );
  }
}
