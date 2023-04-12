import 'package:e_ticaret/pages/Beginning/widget.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Login/Pages/Loginpage.dart';

class BeginningPage extends StatefulWidget {
  const BeginningPage({super.key});

  @override
  State<BeginningPage> createState() => _BeginningPageState();
}

class _BeginningPageState extends State<BeginningPage> {
  PageController _controller = PageController();

  bool _LastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (value) {
            setState(() {
              _LastPage = (value == 2);
            });
          },
          children: [
            BeginContainer("Leziz Yemekler Ve Harika İçecekler",
                "https://assets10.lottiefiles.com/packages/lf20_GUQObWT5Mw.json"),
            BeginContainer("Hızlı Ve Güvenilir Teslimat",
                "https://assets8.lottiefiles.com/packages/lf20_seishwbe.json"),
            BeginContainer("O Zaman Haydi Başlıyalım",
                "https://assets8.lottiefiles.com/packages/lf20_axztuerm.json")
          ],
        ),
        Container(
          alignment: Alignment(0, 0.7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                  onTap: () {
                    _controller.jumpToPage(2);
                  },
                  child: const Text(
                    "Geç",
                    style: TextStyle(
                        color: EnabledColor,
                        fontSize: 24,
                        fontFamily: 'Schyler'),
                  )),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const SwapEffect(activeDotColor: EnabledColor),
              ),
              _LastPage
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: const Text(
                        "Giriş Ekranı",
                        style: TextStyle(
                            fontSize: 24,
                            color: EnabledColor,
                            fontFamily: 'Schyler'),
                      ))
                  : GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: const Text(
                        "Sonraki",
                        style: TextStyle(
                            fontSize: 24,
                            color: EnabledColor,
                            fontFamily: 'Schyler'),
                      ))
            ],
          ),
        )
      ]),
    );
  }
}
