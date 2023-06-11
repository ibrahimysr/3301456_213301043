// ignore_for_file: file_names

import 'package:e_ticaret/pages/Payment/Location.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:flutter/material.dart';
import 'BasketStreambuilder.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  int toplam = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children:  const [
                   Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        "Sepetim",
                        style: TextStyle(
                            fontSize: 30,
                            color: TextColor,
                            fontFamily: 'Schyler'),
                      ),
                    ),
                  ),
                   BasketStream()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5, bottom: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Location()));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: EnabledColor),
                  child: const Center(
                    child: Text(
                      "Ödeme Yap",
                      style: TextStyle(color: Colors.white, fontSize: 21),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
