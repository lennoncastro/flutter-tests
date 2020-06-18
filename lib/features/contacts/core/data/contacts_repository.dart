import 'package:bytebank/features/contacts/list/contact.dart';

abstract class ContactsRepository {
  Future<int> save(Contact contact);
  Future<List<Contact>> findAll();
}
