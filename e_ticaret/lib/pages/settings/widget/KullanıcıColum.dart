// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../style/color.dart';

Widget kullaniciColum(String baslik, Icon icon, TextEditingController control) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          baslik,
          style: const TextStyle(color: TextColor, fontSize: 18),
        ),
        const SizedBox(
          height: 7,
        ),
        TextField(
          controller: control,
          style: const TextStyle(color: TextColor),
          decoration: InputDecoration(
              fillColor: const Color(0xff282C34),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 3, color: Colors.black),
                borderRadius: BorderRadius.circular(15),
              ),
              prefixIcon: icon,
              hintText: "Kullanıcı Adı",
              hintStyle:
              const TextStyle(color: Color(0xff52575D), fontSize: 13)),
        ),
      ],
    ),
  );
}
