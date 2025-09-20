import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/student.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'hostel.db'),
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, room TEXT, feeStatus TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertStudent(Student student) async {
    final db = await DBHelper.database();
    await db.insert(
      'students',
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Student>> getStudents() async {
    final db = await DBHelper.database();
    final List<Map<String, dynamic>> maps = await db.query('students');
    return List.generate(maps.length, (i) {
      return Student(
        id: maps[i]['id'],
        name: maps[i]['name'],
        room: maps[i]['room'],
        feeStatus: maps[i]['feeStatus'],
      );
    });
  }
}
