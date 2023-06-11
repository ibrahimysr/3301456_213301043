// ignore_for_file: must_be_immutable, file_names, camel_case_types
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../style/color.dart';
import '../widget/SettingListColumn.dart';

class settings extends StatefulWidget {
  User? user;
  settings(this.user, {super.key});

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Appcolor2,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 110,
                                width: 110,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                child: const Center(
                                    child: Icon(
                                  Icons.add_a_photo,
                                  color: Colors.white,
                                  size: 30,
                                )),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text(
                                "Hoşgeldiniz",
                                style:
                                    TextStyle(color: TextColor, fontSize: 26),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    flex: 5,
                    child: Container(
                      color: Appcolor,
                      child: SizedBox(
                        width: double.infinity,
                        child:
                            Column(children: [SettingListColumn(widget.user)]),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
