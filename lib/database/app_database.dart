import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) => db.execute(ContactDaoSchema.tableSql),
    version: 1,
  );
}

class ContactDaoSchema {
  static const String tableSql = 'CREATE TABLE $tableName('
      '$id INTEGER PRIMARY KEY, '
      '$name TEXT, '
      '$accountNumber INTEGER)';
  static const String tableName = 'contacts';
  static const String id = 'id';
  static const String name = 'name';
  static const String accountNumber = 'account_number';
}
