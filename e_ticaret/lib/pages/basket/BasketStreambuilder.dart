import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../service/Function.dart';
import '../../widget/seper_card.dart';
import '../Details.dart';

class BasketStream extends StatefulWidget {
  const BasketStream({Key? key}) : super(key: key);

  @override
  State<BasketStream> createState() => _BasketStreamState();
}

class _BasketStreamState extends State<BasketStream> {
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
                  .map((kahve) => SepetCard(
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsScreen(kahve)));
                      },
                      kahve,
                      context,
                      () {
                        deleteData(kahve.id, "Sepet");
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Ürün Kaldırıldı")));
                      }))
                  .toList(),
            );
          } else {
            return const Text("Sepetiniz Boş");
          }
        });
  }
}
