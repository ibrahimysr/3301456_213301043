import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {
  static const String VeritabaniAdi = "veri.sqlite";

  static Future<Database> veritabanierisim() async {
    String VeritabaniYolu = join(await getDatabasesPath(), VeritabaniAdi);

    if (await databaseExists(VeritabaniYolu)) {
      print("Veri Tabanı Zaten Kopyalanmış");
    } else {
      ByteData data = await rootBundle.load("veritabani/$VeritabaniAdi");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(VeritabaniYolu).writeAsBytes(bytes, flush: true);
    }

    return openDatabase(VeritabaniYolu);
  }
}
