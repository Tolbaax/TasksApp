import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task/Constants.dart';
import 'package:task/Model/Task.dart';

class DBHelper {
  //Design Pattern
  DBHelper._();
  static final DBHelper _db = DBHelper._(); // Singleton is a creational design pattern that ensures that a class has only one instance and also provides a global point of access to it

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
  //CRUD create read update delete
insertTask(TaskModel task)async
{
  Database dbb = await db;
  dbb.insert('Tasks', task.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);
}



//delete -------------------------------

deleteTask(TaskModel delete)async
{
  Database del = await db;
  del.delete('Tasks',where: '$taskId=?',whereArgs: [delete.id]);
}


//update --------------------------------

updateTask(TaskModel update)async
{
  Database upd = await db;
  upd.update('Tasks',update.toJson(),whereArgs: [update.id],where: '$taskId=?');
}

//Read ---------------------------------
 Future<List<TaskModel>> getAllTasks()async
{
  Database read = await db;
   List<Map<String,dynamic>> maps = await read.query('Tasks');
   return maps.map((e) => TaskModel.fromJson(e)).toList();
}
}
