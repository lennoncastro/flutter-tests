import 'package:bytebank/features/contacts/core/data/contacts_repository.dart';
import 'package:bytebank/features/contacts/list/contact.dart';
import 'package:flutter/foundation.dart';

class ContactFormController {
  ContactsRepository contactsRepository;

  ContactFormController({@required contactsRepository});

  Future<int> save(String name, String accountNumber) {
    var newAccountNumber = int.tryParse(accountNumber);
    final Contact contact = Contact(0, name, newAccountNumber);
    return contactsRepository.save(contact);
  }
}
