
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart'as path;
import 'package:sqflite/sqflite.dart';

class DBHelper{


  static Future<Database> database(String name)async{
    final dbPath=await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath,'$name.db'),onCreate:(db,version){
      return db.execute('CREATE TABLE $name(id TEXT PRIMARY KEY,name TEXT,age TEXT,address TEXT,phone TEXT');
    },version: 1);
  }


  /*static Future<Database> databasePatients()async{
    final dbPath=await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath,'patients.db'),onCreate:(db,version){
      return db.execute('CREATE TABLE patients(id TEXT PRIMARY KEY,name TEXT,age TEXT,address TEXT,phone TEXT');
    },version: 1);
  }*/

  static Future<void> insertPatients(String table,Map<String,dynamic> data)async{
   final db=await DBHelper.database('patients');
   db.insert(table, data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getPatientsData(String table)async{
    final db=await DBHelper.database('patients');
    return db.query(table);
  }


  /*static Future<Database> databaseVisits()async{
    final dbPath=await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath,'visit.db'),onCreate:(db,version){
      return db.execute('CREATE TABLE visits(id TEXT PRIMARY KEY,time TEXT,type TEXT');
    },version: 1);
  }*/

  static Future<void> insertVisit(String table,Map<String,dynamic> data)async{

    final db=await DBHelper.database('visit');
    db.insert(table, data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getVisitsData(String table)async{
    final db=await DBHelper.database('visit');
    return db.query(table);
  }





  /*static Future<Database> databaseAssessment()async{
    final dbPath=await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath,'assessment.db'),onCreate:(db,version){
      return db.execute('CREATE TABLE assessment(id TEXT PRIMARY KEY,diagonis TEXT,prescription TEXT,lab TEXT');
    },version: 1);
  }*/

  static Future<void> insertAssessment(String table,Map<String,dynamic> data)async{

    final db=await DBHelper.database('assessment');
    db.insert(table, data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getAssessmentData(String table)async{
    final db=await DBHelper.database('assessment');
    return db.query(table);
  }






  /*static Future<Database> databaseProcedures()async{
    final dbPath=await sql.getDatabasesPath();
    return sql.openDatabase(path.join(dbPath,'procedure.db'),onCreate:(db,version){
      return db.execute('CREATE TABLE procedure(id TEXT PRIMARY KEY,procedures TEXT');
    },version: 1);
  }*/

  static Future<void> insertProcedure(String table,Map<String,dynamic> data)async{

    final db=await DBHelper.database(table);
    db.insert(table, data,conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getProceduresData(String table)async{
    final db=await DBHelper.database(table);
    return db.query(table);
  }
}