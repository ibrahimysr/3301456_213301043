import 'package:e_ticaret/service/Function.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/Button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Completed extends StatelessWidget {
  const Completed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor,
        title: const Text("İşlem Sonu"),
        centerTitle: true,
      ),
      backgroundColor: Appcolor,
      body: Center(
        child: Column(
          children: [
            LottieBuilder.network(
                "https://assets6.lottiefiles.com/packages/lf20_w5oe9omf.json"),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "İşleminiz Tamamlandı",
                style: TextStyle(fontSize: 20, color: TextColor),
              ),
            ),
            Button2(() {
              deleteAllDocuments();
              Navigator.pop(context);
            }, "Alışverişe Devam Et")
          ],
        ),
      ),
    );
  }
}
