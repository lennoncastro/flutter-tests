import 'package:bytebank/features/contacts/core/data/contacts_repository.dart';
import 'package:bytebank/features/contacts/list/contact.dart';
import 'package:flutter/foundation.dart';

class ContactListController {
  ContactsRepository contactsRepository;

  ContactListController({@required contactsRepository});

  Future<List<Contact>> findAll() => contactsRepository.findAll();
}
