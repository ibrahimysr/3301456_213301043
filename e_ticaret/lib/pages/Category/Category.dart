// ignore_for_file: non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_ticaret/pages/Category/widget/CategoryContainer.dart';
import 'package:e_ticaret/pages/Category/widget/ImageList.dart';
import 'package:e_ticaret/pages/Category/widget/buildImage.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Appcolor,
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Center(
                child: Text(
                  "Kategoriler",
                  style: TextStyle(
                      color: TextColor, fontSize: 40, fontFamily: 'Schyler'),
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                CategoryContainer(SicaklarUrl, "Sıcak", context),
                CategoryContainer(CorbalarUrl, "Çorba", context),
                CategoryContainer(TatlilarUrl, "Tatlı", context),
                CategoryContainer(yemekUrl, "Yemek", context),
                CategoryContainer(MilkshakelarUrl, "Milkshake", context),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
