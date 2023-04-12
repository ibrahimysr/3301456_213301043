import 'package:e_ticaret/pages/Login/Pages/Registerpage.dart';
import 'package:e_ticaret/pages/Login/widget/Container.dart';
import 'package:e_ticaret/pages/Login/widget/Loginbutton.dart';
import 'package:e_ticaret/pages/Login/widget/Textfield.dart';
import 'package:e_ticaret/pages/settings/Pages/ResetPassword.dart';
import 'package:e_ticaret/style/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../ControlPage.dart';
import '../loginService/function.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.orange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(top: 16, left: 16),
                            child: Text(
                              "Hoşgeldiniz",
                              style: TextStyle(
                                  fontSize: 45,
                                  color: TextColor,
                                  fontFamily: 'Schyler'),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16, top: 16),
                            child: Text(
                              "Giriş Yap",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: TextColor,
                                  fontFamily: 'Schyler'),
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Appcolor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Mytextfield(
                              _email, "Email", const Icon(Icons.email), false),
                          const SizedBox(
                            height: 20,
                          ),
                          Mytextfield(
                              _password, "Şifre", const Icon(Icons.lock), true),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ResetPassword()));
                                  },
                                  child: const Text(
                                    "Şifremi Unuttum",
                                    style: TextStyle(
                                        color: TextColor, fontSize: 16),
                                  ),
                                ),
                              )
                            ],
                          ),
                          LoginButton(
                            "Giriş Yap",
                            () async {
                              User? user = await loginFunction(
                                  _email.text, _password.text, context);
                              if (user != null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ControlPage(user)));
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register()));
                              },
                              child: const Text(
                                "Kayıt Ol",
                                style:
                                    TextStyle(color: TextColor, fontSize: 16),
                              ),
                            ),
                          ),
                          Row(children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: const Divider(
                                    color: Colors.white,
                                    height: 36,
                                  )),
                            ),
                            const Text(
                              "Veya",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            Expanded(
                              child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: const Divider(
                                    color: Colors.white,
                                    height: 36,
                                  )),
                            ),
                          ]),
                          LoginContainer("assets/google.png", "Google"),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginContainer("assets/facebook.png", "Facebook"),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
