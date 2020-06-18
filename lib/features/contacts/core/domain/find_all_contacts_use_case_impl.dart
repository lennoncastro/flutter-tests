import 'package:bytebank/features/contacts/core/data/contacts_repository.dart';
import 'package:bytebank/features/contacts/list/contact.dart';
import 'package:flutter/foundation.dart';

import 'find_all_contacts_use_case.dart';

class FindAllContactsUseCaseImpl extends FindAllContactsUseCase {

  ContactsRepository contactsRepository;

  FindAllContactsUseCaseImpl({@required this.contactsRepository});

  Future<List<Contact>> execute() => contactsRepository.findAll();
}
