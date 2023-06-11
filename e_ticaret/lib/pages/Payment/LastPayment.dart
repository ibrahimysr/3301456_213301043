// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names
import 'package:e_ticaret/pages/Payment/ProductStream.dart';
import 'package:e_ticaret/pages/Payment/completed.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/Button.dart';
import 'package:flutter/material.dart';

class LastPayment extends StatefulWidget {
  String adres;
  String Kart_no;
  String Kart_tarih;
  String Kart_cvv;
  String Kart_sahibi;

  LastPayment(this.adres, this.Kart_no, this.Kart_tarih, this.Kart_cvv,
      this.Kart_sahibi,
      {super.key});

  @override
  State<LastPayment> createState() => _LastPaymentState();
}

class _LastPaymentState extends State<LastPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor,
      appBar: AppBar(
        title: const Text("Ödemeyi Tamamlayın"),
        centerTitle: true,
        backgroundColor: Appcolor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Appcolor2,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: EnabledColor),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Adres',
                    style: TextStyle(fontSize: 23.0, color: TextColor),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      height: 10,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Text(
                      widget.adres,
                      style: const TextStyle(fontSize: 20.0, color: TextColor),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Appcolor2,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: EnabledColor),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Kart Bilgileri',
                    style: TextStyle(fontSize: 23.0, color: TextColor),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      height: 10,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Kart Numara:  ",
                        style: TextStyle(fontSize: 18.0, color: TextColor),
                      ),
                      Text(
                        widget.Kart_no,
                        style:
                            const TextStyle(fontSize: 18.0, color: TextColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Tarih:",
                            style: TextStyle(fontSize: 18.0, color: TextColor),
                          ),
                          Text(
                            widget.Kart_tarih,
                            style: const TextStyle(
                                fontSize: 18.0, color: TextColor),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "CVV:",
                            style: TextStyle(fontSize: 18.0, color: TextColor),
                          ),
                          Text(
                            widget.Kart_cvv,
                            style: const TextStyle(
                                fontSize: 18.0, color: TextColor),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Kart Sahibi:",
                            style: TextStyle(fontSize: 18.0, color: TextColor),
                          ),
                          Text(
                            widget.Kart_sahibi,
                            style: const TextStyle(
                                fontSize: 18.0, color: TextColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Appcolor2,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: EnabledColor),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Ürünler',
                          style: TextStyle(fontSize: 23.0, color: TextColor),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            height: 10,
                            color: Colors.black,
                          ),
                        ),
                        SingleChildScrollView(child: ProductStream())
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Button2(() {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Completed()));
            }, "Siparişi Tamamla")
          ],
        ),
      ),
    );
  }
}
