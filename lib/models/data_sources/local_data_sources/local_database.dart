import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../qr_code_model.dart';

class QRCodeLocalDatabase {
  static final QRCodeLocalDatabase _singleton = QRCodeLocalDatabase._internal();

  factory QRCodeLocalDatabase() {
    return _singleton;
  }

  QRCodeLocalDatabase._internal();

  Database? _database;

  Future<void> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'qr_codes.db');

    _database = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE qr_codes (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          type TEXT,
          format TEXT,
          dataString TEXT,
          date TEXT,
          isFavorite INTEGER,
          isScanned INTEGER,
          icon TEXT
        )
      ''');
    });
  }

  Future<List<QRCodeModel>> getAllQRCodes() async {
    if (_database == null) {
      await initDatabase();
    }

    final qrCodes = await _database!.query('qr_codes');
    return qrCodes.map((map) => QRCodeModel.fromJson(map)).toList();
  }

  Future<int> insertQRCode(QRCodeModel qrCode) async {
    if (_database == null) {
      await initDatabase();
    }

    return await _database!.insert('qr_codes', qrCode.toJson());
  }

  Future<int> updateQRCode(QRCodeModel qrCode) async {
    if (_database == null) {
      await initDatabase();
    }

    return await _database!.update(
      'qr_codes',
      qrCode.toJson(),
      where: 'id = ?',
      whereArgs: [qrCode.id],
    );
  }

  Future<void> deleteAllQRCodes() async {
    if (_database == null) {
      await initDatabase();
    }

    await _database!.delete('qr_codes');
  }
}
