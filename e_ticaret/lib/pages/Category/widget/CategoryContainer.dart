import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../HomePage.dart';
import 'buildImage.dart';

Widget CategoryContainer(List Url, String title, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage(title)));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 15, left: 40, right: 40),
      child: SizedBox(
        width: double.infinity,
        height: 180,
        child: Stack(children: [
          CarouselSlider.builder(
              itemCount: Url.length,
              itemBuilder: (context, index, realIndex) {
                final imageurl = Url[index];
                return buildImage(imageurl, index);
              },
              options: CarouselOptions(
                  height: 180,
                  viewportFraction: 1,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayInterval: const Duration(seconds: 7))),
          Center(
              child: Text(
            title,
            style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 1)),
          ))
        ]),
      ),
    ),
  );
}
