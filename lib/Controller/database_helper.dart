import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task/Constants.dart';

class DBHelper {
  //Design Pattern
  DBHelper._();
  static final DBHelper _db = DBHelper
      ._(); // Singleton is a creational design pattern that ensures that a class has only one instance and also provides a global point of access to it

  factory DBHelper() {
    return _db;
  }
  Database? _database;
  Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'Tasks';
    final taskList = await openDatabase(path, version: 1, onCreate: _create);
    return taskList;
  }

  void _create(Database db, int version) async {
    await db.execute('CREATE TABLE Tasks'
        '($taskId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$taskTitle TEXT,'
        '$taskDate TEXT,'
        '$taskDesc TEXT,'
        '$taskImportance TEXT,'
        '$taskStatus TEXT)');
  }

  //CRUD
}
