import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  static final SqliteService _instance = SqliteService._internal();
  static Database? _database;

  factory SqliteService() {
    return _instance;
  }

  SqliteService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bill_and_balance.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    // Receipts table
    await db.execute('''
      CREATE TABLE receipts (
        id TEXT PRIMARY KEY,
        date TEXT NOT NULL,
        amount REAL NOT NULL,
        category TEXT NOT NULL,
        merchant TEXT,
        notes TEXT,
        image_path TEXT,
        is_shared INTEGER DEFAULT 0,
        shared_data TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Tasks table
    await db.execute('''
      CREATE TABLE tasks (
        id TEXT PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT,
        deadline TEXT NOT NULL,
        estimated_hours REAL NOT NULL,
        status TEXT DEFAULT 'active',
        completed_at TEXT,
        completion_type TEXT,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      )
    ''');

    // Task check-ins table
    await db.execute('''
      CREATE TABLE task_checkins (
        id TEXT PRIMARY KEY,
        task_id TEXT NOT NULL,
        checkin_date TEXT NOT NULL,
        status_response TEXT NOT NULL,
        notes TEXT,
        created_at TEXT NOT NULL,
        FOREIGN KEY (task_id) REFERENCES tasks (id) ON DELETE CASCADE
      )
    ''');

    // Categories table
    await db.execute('''
      CREATE TABLE categories (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        type TEXT NOT NULL,
        created_at TEXT NOT NULL
      )
    ''');

    // Insert default categories
    await _insertDefaultCategories(db);
  }

  Future<void> _insertDefaultCategories(Database db) async {
    final categories = [
      'Groceries',
      'Utilities',
      'Entertainment',
      'Transport',
      'Shopping',
      'Other'
    ];

    final now = DateTime.now().toIso8601String();

    for (var i = 0; i < categories.length; i++) {
      await db.insert('categories', {
        'id': 'default-cat-$i',
        'name': categories[i],
        'type': 'expense',
        'created_at': now,
      });
    }
  }

  // Helper methods for CRUD operations
  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return await db.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> query(String table) async {
    final db = await database;
    return await db.query(table);
  }

  Future<int> update(String table, Map<String, dynamic> data, String where, List<dynamic> whereArgs) async {
    final db = await database;
    return await db.update(table, data, where: where, whereArgs: whereArgs);
  }

  Future<int> delete(String table, String where, List<dynamic> whereArgs) async {
    final db = await database;
    return await db.delete(table, where: where, whereArgs: whereArgs);
  }
}