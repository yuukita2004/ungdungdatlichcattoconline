import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/booking_model.dart';

class StorageService {
  static Database? _database;

  static Future<Database?> get database async {
    // Nếu chạy trên Web, không khởi tạo sqflite vì không hỗ trợ
    if (kIsWeb) return null;
    
    if (_database != null) return _database!;
    _database = await _initDB('barber_shop.db');
    return _database;
  }

  static Future<Database?> _initDB(String filePath) async {
    if (kIsWeb) return null;
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, filePath);

      return await openDatabase(
        path,
        version: 1,
        onCreate: _createDB,
      );
    } catch (e) {
      debugPrint("DB Init Error: $e");
      return null;
    }
  }

  static Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE bookings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        serviceName TEXT,
        barberName TEXT,
        barberImage TEXT,
        date TEXT,
        time TEXT,
        price TEXT,
        status TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE user_profile (
        id TEXT PRIMARY KEY,
        name TEXT,
        phone TEXT,
        avatarUrl TEXT,
        membershipRank TEXT,
        points INTEGER
      )
    ''');
  }

  static Future<int> insertBooking(Booking booking) async {
    final db = await database;
    if (db == null) return -1;
    return await db.insert('bookings', booking.toJson(includeId: false));
  }

  static Future<List<Booking>> loadBookings() async {
    final db = await database;
    if (db == null) return [];
    final List<Map<String, dynamic>> maps = await db.query('bookings', orderBy: 'id DESC');
    return List.generate(maps.length, (i) {
      return Booking.fromJson(maps[i]);
    });
  }

  static Future<void> updateBooking(Booking booking) async {
    if (booking.id == null) return;
    final db = await database;
    if (db == null) return;
    await db.update(
      'bookings',
      booking.toJson(includeId: false),
      where: 'id = ?',
      whereArgs: [booking.id],
    );
  }

  static Future<UserProfile?> loadUserProfile() async {
    final db = await database;
    if (db == null) return null;
    final List<Map<String, dynamic>> maps = await db.query('user_profile', limit: 1);
    if (maps.isEmpty) return null;
    return UserProfile.fromJson(maps.first);
  }

  static Future<void> saveUserProfile(UserProfile user) async {
    final db = await database;
    if (db == null) return;
    await db.insert(
      'user_profile',
      {
        'id': user.id,
        'name': user.name,
        'phone': user.phone,
        'avatarUrl': user.avatarUrl,
        'membershipRank': user.membershipRank,
        'points': user.points,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
