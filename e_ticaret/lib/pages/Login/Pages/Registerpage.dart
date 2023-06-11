// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../service/Function.dart';
import '../../../style/color.dart';
import '../loginService/function.dart';
import '../widget/Loginbutton.dart';
import '../widget/Textfield.dart';
import 'Loginpage.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _username = TextEditingController();

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
                              "Kayıt Ol",
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
                          const SizedBox(
                            height: 20,
                          ),
                          Mytextfield(
                              _username,
                              "Kullanıcı Adı",
                              const Icon(Icons.supervised_user_circle_rounded),
                              false),
                          const SizedBox(
                            height: 20,
                          ),
                          LoginButton(
                            "Kayıt Ol",
                            () {
                              context.read<FlutterFireAuthService>().SignUp(
                                  _email.text.trim(),
                                  _password.text.trim(),
                                  _username.text.trim(),
                                  context);
                              //Signup(_email, _password, _username, context);
                              LocalVeriekle(_username.text, _email.text);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                          ),
                          const SizedBox(
                            height: 20,
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
                              "☕",
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
