import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/Favori_card.dart';
import 'package:flutter/material.dart';
import 'Details.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Wrap(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    "Favorilerim",
                    style: TextStyle(
                        fontSize: 30, color: TextColor, fontFamily: 'Schyler'),
                  ),
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("Favoriler")
                      .snapshots(),
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
                            .map((kahve) => FavoriCard(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailsScreen(kahve)));
                                }, kahve, context))
                            .toList(),
                      );
                    } else {
                      return const Text(
                        "Favori Ürününüz Yok",
                        style: TextStyle(color: Colors.white),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
