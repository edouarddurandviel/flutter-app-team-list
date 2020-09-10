import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:myapp/members/models/Model_short_team.dart';

final sqlDatabase = 'sqflite_team.db';
final sqlDataBaseName = 'app_team';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, sqlDatabase);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE $sqlDataBaseName('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'username TEXT,'
          'email TEXT,'
          ')');
    });
  }

  dropDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, sqlDatabase);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("DROP TABLE IF EXISTS $sqlDataBaseName");
    });
  }

  // Delete all employees
  Future<void> deleteEmployee(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove employee from the database.
    await db.delete(
      'app_team',
      // Use a `where` clause to delete a specific employee.
      where: "id = ?",
      // Pass the employee's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<void> createEmployee(Team newEmployee) async {
    // Get a ref to the database.
    final Database db = await database;

    // Insert the employee into the correct table. 
    // conflictAlgorithm it replaces the previous data.
    await db.insert(
      'app_team',
      newEmployee.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Team>> deleteAndGetAllEmployees(int id) async {
    // Get a reference to the database.
    final Database db = await database;

    deleteEmployee(id);

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('app_team');

    // Convert the List<Map<String, dynamic> into a List<Employee>.
    return List.generate(maps.length, (i) {
      return Team(
        id: maps[i]['id'],
        name: maps[i]['name'],
        username: maps[i]['username'],
        email: maps[i]['email'],
      );
    });
  }

  Future<List<Team>> getAllEmployees() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The employee.
    final List<Map<String, dynamic>> maps = await db.query('app_team');

    // Convert the List<Map<String, dynamic> into a List<employee>.
    return List.generate(maps.length, (i) {
      return Team(
        id: maps[i]['id'],
        name: maps[i]['name'],
        username: maps[i]['username'],
        email: maps[i]['email'],
      );
    });
  }
}
