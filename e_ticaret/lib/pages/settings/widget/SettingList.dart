// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../../style/color.dart';

Widget SettingList(String baslik, context, Function()? ontap, Icon icon) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Appcolor2,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: EnabledColor),
            boxShadow: [
              BoxShadow(
                  color: EnabledColor.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 3)),
            ]),
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 16,
            ),
            Text(
              baslik,
              style: const TextStyle(fontSize: 18, color: TextColor),
            ),
          ],
        ),
      ),
    ),
  );
}
