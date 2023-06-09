// ignore_for_file: file_names, must_be_immutable

import 'package:e_ticaret/pages/settings/Pages/Card/SavedCard.dart';
import 'package:e_ticaret/pages/settings/Pages/Locationn/Savedlocation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../service/Function.dart';
import '../Pages/ResetPassword.dart';
import '../Pages/Userinformation .dart';
import 'SettingList.dart';

class SettingListColumn extends StatelessWidget {
  User? user;
  SettingListColumn(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingList("Kullanıcı Bilgilerim", context, () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Userinformation(user)));
        },
            const Icon(Icons.supervised_user_circle_rounded,
                color: Colors.white)),
        SettingList("Şifreyi Sıfırla", context, () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ResetPassword()));
        },
            const Icon(
              Icons.lock_rounded,
              color: Colors.white,
            )),
        SettingList("Adreslerim", context, () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Savedlocation()));
        },
            const Icon(
              Icons.location_on,
              color: Colors.white,
            )),
        SettingList("Kayıtlı Kartlarım", context, () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SavedCard()));
        }, const Icon(Icons.add_card, color: Colors.white)),
        SettingList("Çıkış Yap", context, () => {signOut(context)},
            const Icon(Icons.exit_to_app, color: Colors.white))
      ],
    );
  }
}
