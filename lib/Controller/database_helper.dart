
import 'package:sqflite/sqflite.dart';

class DBHelper{

  //Design Pattern
  DBHelper._();
  static final DBHelper _db = DBHelper._(); // Singleton is a creational design pattern that ensures that a class has only one instance and also provides a global point of access to it

  factory DBHelper(){
    return _db;
  }

  //CRUD
}
