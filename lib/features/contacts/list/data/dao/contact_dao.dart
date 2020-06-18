import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/features/contacts/list/presentation/contact.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../database/app_database.dart';

class ContactDao {
  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(ContactDaoSchema.tableName, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result =
        await db.query(ContactDaoSchema.tableName);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[ContactDaoSchema.name] = contact.name;
    contactMap[ContactDaoSchema.accountNumber] = contact.accountNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[ContactDaoSchema.id],
        row[ContactDaoSchema.name],
        row[ContactDaoSchema.accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
