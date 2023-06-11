// ignore_for_file: file_names, non_constant_identifier_names

import 'package:e_ticaret/service/Bilgiler.dart';
import 'Veritabaniyardimcisi.dart';

class Bilgilerdao {
  Future<List<Bilgiler>> Tumbilgiler() async {
    var db = await VeritabaniYardimcisi.veritabanierisim();

    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kullanici");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Bilgiler(satir["id"], satir["ad"], satir["email"]);
    });
  }

  Future<void> BilgileriEkle(
    String ad,
    String email,
  ) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();

    var bilgiler = <String, dynamic>{};

    bilgiler["ad"] = ad;
    bilgiler["email"] = email;
    await db.insert("kullanici", bilgiler);
  }

  Future<Bilgiler> kisiyiGetir(int id) async {
    var db = await VeritabaniYardimcisi.veritabanierisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM kullanici where id='$id'");

    var satir = maps[0];
    return Bilgiler(satir["id"], satir["ad"], satir["email"]);
  }
}
