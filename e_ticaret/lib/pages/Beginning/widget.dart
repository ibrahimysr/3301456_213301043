import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../style/color.dart';

class BeginContainer extends StatelessWidget {
  String title;
  String LottieTitle;
  BeginContainer(this.title, this.LottieTitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appcolor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 28, color: TextColor, fontFamily: 'Schyler'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                height: 220,
                width: 220,
                child: Lottie.network(LottieTitle, fit: BoxFit.fill),
              ),
            )
          ],
        ),
      ),
    );
  }
}
