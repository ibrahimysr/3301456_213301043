// ignore_for_file: file_names, must_be_immutable, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/pages/Payment/LastPayment.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:e_ticaret/widget/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';

class CrediCard extends StatefulWidget {
  String konum;
  CrediCard(this.konum, {super.key});

  @override
  State<CrediCard> createState() => _CrediCardState();
}

class _CrediCardState extends State<CrediCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  dbDataAdd() {
    FirebaseFirestore.instance.collection("Bilgiler").add({
      "adres": widget.konum,
      "kart_no": cardNumber,
      "kart_tarih": expiryDate,
      "kart_sahibi": cardHolderName,
      "kart_cvv": cvvCode
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Appcolor,
        centerTitle: true,
        title: const Text(
          "Kartını Tanımla",
          style: TextStyle(fontFamily: 'Schyler', fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
          child: Container(
            color: Appcolor,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  CreditCardWidget(
                    glassmorphismConfig:
                        useGlassMorphism ? Glassmorphism.defaultConfig() : null,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    bankName: 'Axis Bank',
                    frontCardBorder: !useGlassMorphism
                        ? Border.all(color: Colors.grey)
                        : null,
                    backCardBorder: !useGlassMorphism
                        ? Border.all(color: Colors.grey)
                        : null,
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: false,
                    isHolderNameVisible: true,
                    cardBgColor: Appcolor2,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                    customCardTypeIcons: <CustomCardTypeIcon>[
                      CustomCardTypeIcon(
                        cardType: CardType.mastercard,
                        cardImage: Image.asset(
                          "assets/master.png",
                          height: 48,
                          width: 48,
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        CreditCardForm(
                          formKey: formKey,
                          //obscureCvv: true,
                          //obscureNumber: true,
                          cardNumber: cardNumber,
                          cvvCode: cvvCode,
                          isHolderNameVisible: true,
                          isCardNumberVisible: true,
                          isExpiryDateVisible: true,
                          cardHolderName: cardHolderName,
                          expiryDate: expiryDate,
                          themeColor: Colors.blue,
                          textColor: Colors.white,
                          cardNumberDecoration: InputDecoration(
                            labelText: 'Number',
                            hintText: 'XXXX XXXX XXXX XXXX',
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                          ),
                          expiryDateDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Expired Date',
                            hintText: 'XX/XX',
                          ),
                          cvvCodeDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'CVV',
                            hintText: 'XXX',
                          ),
                          cardHolderDecoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.white),
                            labelStyle: const TextStyle(color: Colors.white),
                            focusedBorder: border,
                            enabledBorder: border,
                            labelText: 'Card Holder',
                          ),
                          onCreditCardModelChange: onCreditCardModelChange,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Button2(() {
                          if (formKey.currentState!.validate()) {
                            //dbDataAdd();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LastPayment(
                                        widget.konum,
                                        cardNumber,
                                        expiryDate,
                                        cvvCode,
                                        cardHolderName)));
                          } else {
                            print('invalid!');
                          }
                        }, "Devam Et")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
