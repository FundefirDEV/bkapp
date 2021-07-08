import 'dart:io';

import 'package:bkapp_flutter/core/models/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ActivePartnersDbProvider {
  ActivePartnersDbProvider._();
  static final ActivePartnersDbProvider db = ActivePartnersDbProvider._();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "activepartners.db");
    return await openDatabase(path, version: 2,
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE IF NOT EXISTS ActivePartners ("
          "id integer primary key AUTOINCREMENT,"
          "firstname TEXT,"
          "lastname TEXT,"
          "gender TEXT,"
          "country INTEGER,"
          "phone TEXT,"
          "email TEXT,"
          "validationCode TEXT,"
          "password TEXT,"
          "passwordConfirmation TEXT,"
          "isActive BOOL,"
          "role TEXT"
          ")");
    });
  }

  addPartnerToDatabase(PartnerModel partner) async {
    final db = await database;
    var raw = await db.insert("ActivePartners", partner.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return raw;
  }

  updatePartner(PartnerModel partner) async {
    final db = await database;
    var response = await db.update("ActivePartners", partner.toJson(),
        where: "id = ?", whereArgs: [partner.id]);
    return response;
  }

  deletePartnerById(int id) async {
    final db = await database;
    return await db.rawDelete("DELETE FROM ActivePartners WHERE id = $id");
  }

  deleteAllPartners() async {
    final db = await database;
    db.delete("ActivePartners");
  }

  Future<PartnerModel> getPartnerById(int id) async {
    final db = await database;
    var response =
        await db.query('ActivePartners', where: "id = ?", whereArgs: [id]);
    return response.isNotEmpty ? PartnerModel.fromJson(response.first) : null;
  }

  Future<List<PartnerModel>> getAllParters() async {
    final db = await database;
    var response = await db.query("ActivePartners");
    List<PartnerModel> list =
        response.map((prop) => PartnerModel.fromJson(prop)).toList();
    return list;
  }

  Future closeDatabase() async {
    final db = await database;
    return db.close();
  }
}
