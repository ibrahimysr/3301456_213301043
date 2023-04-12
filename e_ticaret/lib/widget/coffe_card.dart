
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/service/Function.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../style/color.dart';

Widget CoffeCard(Function()? ontap, QueryDocumentSnapshot doc, context) {
  return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          height: 240,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff282C34),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, top: 10),
                  child: Container(
                    height: 142,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/${doc["detay"]}.jpg")),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(doc["isim"],
                      style:
                          const TextStyle(fontSize: 18, color: Colors.white)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(doc["detay"],
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7),
                        child: Row(children: [
                          Text(
                            doc["fiyat"],
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                          const Text(
                            "₺",
                            style: TextStyle(fontSize: 18, color: EnabledColor),
                          ),
                        ]),
                      ),
                      GestureDetector(
                        onTap: () async {
                          AddFavoriData(doc);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Ürününüz Favorilere Eklendi")));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Lottie.network(
                                "https://assets8.lottiefiles.com/temp/lf20_Q4ruhe.json"),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ));
}
