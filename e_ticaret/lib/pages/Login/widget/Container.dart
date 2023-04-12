import 'package:flutter/material.dart';

Widget LoginContainer(String asset, String title) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    child: ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(asset)),
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      trailing: const Icon(
        Icons.navigate_next,
        size: 27,
      ),
    ),
  );
}
