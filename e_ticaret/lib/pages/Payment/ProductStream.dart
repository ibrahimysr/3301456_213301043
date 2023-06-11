// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductStream extends StatefulWidget {
  const ProductStream({Key? key}) : super(key: key);

  @override
  State<ProductStream> createState() => _ProductStreamState();
}

class _ProductStreamState extends State<ProductStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Sepet").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return ListView(
              shrinkWrap: true,
              children: snapshot.data!.docs
                  .map((kahve) => ProductCard(kahve, context))
                  .toList(),
            );
          } else {
            return const Text("Ürün Yok");
          }
        });
  }
}
