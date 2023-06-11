// ignore_for_file: file_names

import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/kategory_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Category/CategoryStream.dart';

class HomePage extends StatefulWidget {
  String CategoryName;
  HomePage(this.CategoryName, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController arama = TextEditingController();

  int index = 0;

  String name = "";

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Appcolor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 25),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xff232732),
                          borderRadius: BorderRadius.circular(10)),
                      height: 42,
                      width: 44,
                      child: IconButton(
                          onPressed: () {
                            if (scaffoldKey.currentState!.isDrawerOpen) {
                              scaffoldKey.currentState!.closeDrawer();
                            } else {
                              scaffoldKey.currentState!.openDrawer();
                            }
                          },
                          icon: const Icon(
                            Icons.menu,
                            color: Appcolor2,
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Lottie.network(
                          "https://assets5.lottiefiles.com/packages/lf20_uZq6rF.json"),
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 33,
                ),
                child: Text(
                  "En İyisini Bul",
                  style: TextStyle(
                      color: TextColor, fontSize: 30, fontFamily: 'Schyler'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 33,
                ),
                child: Text(
                  "Bu Lezzetler Senin İçin",
                  style: TextStyle(
                      color: TextColor, fontSize: 30, fontFamily: 'Schyler'),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 33, right: 58),
                child: TextField(
                  style: const TextStyle(color: TextColor),
                  controller: arama,
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                      fillColor: const Color(0xff282C34),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: EnabledColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: EnabledColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: SizedBox(
                        height: 5,
                        width: 5,
                        child: Lottie.network(
                            "https://assets9.lottiefiles.com/packages/lf20_vhppiil2.json"),
                      ),
                      hintText: "İstediğin İçeceği Ara",
                      hintStyle: const TextStyle(
                          color: Color(0xff52575D), fontSize: 13)),
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 21,
                ),
                CategoryStream(widget.CategoryName, name),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
