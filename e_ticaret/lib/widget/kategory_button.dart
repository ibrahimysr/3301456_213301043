import 'package:e_ticaret/style/color.dart';
import 'package:flutter/material.dart';

Widget KategoryButton(String KategoryName, Function()? ontap, bool enabled) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 600),
    width: 125,
    height: 50,
    child: TextButton(
        style: TextButton.styleFrom(
            side: BorderSide(
                width: 3, color: enabled ? EnabledColor : TextColor2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: ontap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(KategoryName,
              style: TextStyle(
                  fontSize: enabled ? 17 : 14,
                  color: enabled ? EnabledColor : TextColor2)),
        )),
  );
}
