import 'dart:convert';

import 'package:chatting_app/src/feature/new_contact/model/friend_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserDatabase {
  static final UserDatabase instance = UserDatabase._init();
  static Database? _database;

  UserDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('user.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE $tableUser(
      ${UserFields.id} $idType,
      ${UserFields.name} $textType,
      ${UserFields.email} $textType,
      ${UserFields.phoneNumber} $textType,
      ${UserFields.bd} $textType,
      ${UserFields.createDate} $textType
      )
    ''');
  }

  Future<UserInfo> create(UserInfo userInfo) async {
    final db = await instance.database;
    final id = await db.insert(tableUser, userInfo.toJson());
    return userInfo.copy(id: id);
  }

  Future<UserInfo> readUser(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableUser,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UserInfo.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<UserInfo>> readAllUser() async {
    final db = await instance.database;
    final orderBy = '${UserFields.id} ASC';
    final result = await db.query(tableUser, orderBy: orderBy);
    return result.map((json) => UserInfo.fromJson(json)).toList();
  }

  Future<int> update(UserInfo userInfo) async {
    final db = await instance.database;
    return db.update(
      tableUser,
      userInfo.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [userInfo.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableUser,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
