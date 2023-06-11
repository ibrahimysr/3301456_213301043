// ignore_for_file: file_names, non_constant_identifier_names, duplicate_ignore

import 'package:flutter/material.dart';

import '../style/color.dart';

// ignore: non_constant_identifier_names
Widget SizeButtons(String Boyut, Function()? ontap, bool tercih) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          side: BorderSide(width: 3, color: tercih ? EnabledColor : Appcolor2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Appcolor),
      onPressed: ontap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(Boyut,
            style: TextStyle(
                color: tercih ? EnabledColor : Colors.white, fontSize: 16)),
      ));
}

Widget Button2(Function()? ontap, String title) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15),
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    ),
  );
}
