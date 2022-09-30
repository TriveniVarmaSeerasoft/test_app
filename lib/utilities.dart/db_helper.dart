// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'dart:io';
// import 'package:test_app/utilities/db_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app/models/to_do_model.dart';
import '../model.dart/ToDoModel.dart';
import '../view/Project code/PersonalDetails.dart';

class DataBaseHelper {
  static const databasename = 'Profile_database.db';
  static const databaseVersion = 1;
  //Create a private constructor
  static const String tablename = 'PersonalDetails';

  static const String firstname = 'firstname';
  static const String middlename = 'middlename';
  static const String lastname = 'lastname';
  static const String email = 'email';
  static const String mobile = 'mobile';
  static const String DOB = 'DOB';

  static DataBaseHelper _dataBaseHelper =
      DataBaseHelper(); //singleton databasehelper
  static Database? _database;

  static var instance; //singleton

  DataBaseHelper._createInstance();

  factory DataBaseHelper() {
    if (_dataBaseHelper == null) {
      _dataBaseHelper = DataBaseHelper._createInstance();
    }
    return _dataBaseHelper;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "Profile_database.db";
    print('directory created');
    return await openDatabase(path, version: 1, onCreate: _create);
    // ignore: dead_code
  }

  // static Future<Database?> getDBConnector() async {
  //   if (_database != null) {
  //     return _database;
  //   }
  //   return initializeDatabase;
  // }
  Future<Database> get DBConnector async {
    // ignore: prefer_conditional_assignment
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  // static Future<Database?> ializeinitDatabase() async {
  //   _database = await openDatabase(
  //     join(await getDatabasesPath(), "my_path.db"),
  //     onCreate: (db, version) async {
  //       //on create
  //     },
  //     version: 1,
  //   );
  //   return _database;
  // }
  // //  static Future<Database> _initDatabase() async {
  //   _database = await openDatabase(
  //     join(await getDatabasesPath(), "my_path.db"),
  //     onCreate: (db, version) async {
  //       //on create
  //     },
  //     version: 1,
  //   );
  //   return _database;
  // }

  _create(Database database, int version) async {
    print('Database created');
    return await database.execute(
        'CREATE TABLE $tablename( $firstname TEXT,$middlename TEXT,$lastname TEXT PRIMARY KEY AUTOINCREMENT NOT NULL, $email TEXT,$mobile TEXT, $DOB TEXT)');
  }

// Future<Database?> _insert(ToDoModel toDoModel) async {
//     final Database database = await DBConnector;
//     await database.insert('PersonalDetails', toDoModel.toMap(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }
  Future<int> insert(ToDoModel toDoModel) async {
    Database? database = await _database;
    var results = database!.insert('PersonalDetails', toDoModel.toMap());
    print('Data inserted successfully');
    return results;
  }

  Future<List<Map<String, dynamic>>> getDatainMaps() async {
    Database? database = await _database;
    // var result =
    //     await database.rawQuery('SELECT * FROM $PersonalDetails orderBy $DOB');
    var res = database!.query('PersonalDetails', orderBy: '$DOB');
    return res;
  }

  Future<List<ToDoModel>> getModelsFromMapList() async {
    List<Map<String, dynamic>> mapList = await getDatainMaps();

    // ignore: deprecated_member_use, unnecessary_new
    List<ToDoModel> toDoListModel = [];
    for (int i = 0; i < mapList.length; i++) {
      toDoListModel.add(ToDoModel.fromMap(mapList[i]));
    }
    return toDoListModel;
  }

  Future close() async {
    var databaseClient = await _database;
    databaseClient?.close();
  }

  // String toDoModel(
  //     {required String firstname,
  //     required String email,
  //     required String lastname,
  //     required String DOB,
  //     required String mobile,
  //     required String middlename}) {}
}
