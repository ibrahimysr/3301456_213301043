// ignore_for_file: file_names, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/widget/coffe_card.dart';
import 'package:flutter/material.dart';
import '../Details.dart';

class CategoryStream extends StatefulWidget {
  String firebaseName;
  String name = "";
  CategoryStream(this.firebaseName, this.name, {super.key});

  @override
  State<CategoryStream> createState() => _CategoryStreamState();
}

class _CategoryStreamState extends State<CategoryStream> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<QuerySnapshot>(
          stream: (widget.name != "")
              ? FirebaseFirestore.instance
                  .collection(widget.firebaseName)
                  .where("Arama", arrayContains: widget.name)
                  .snapshots()
              : FirebaseFirestore.instance
                  .collection(widget.firebaseName)
                  .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.6 / 2.5,
                    crossAxisSpacing: 10),
                children: snapshot.data!.docs
                    .map((kahve) => CoffeCard(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailsScreen(kahve)));
                        }, kahve, context))
                    .toList(),
              );
            }
            return const Text("Veri yok");
          }),
    );
  }
}
