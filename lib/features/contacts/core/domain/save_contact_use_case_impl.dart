import 'package:bytebank/features/contacts/core/data/contacts_repository.dart';
import 'package:bytebank/features/contacts/core/domain/save_contact_use_case.dart';
import 'package:bytebank/features/contacts/list/presentation/contact.dart';
import 'package:flutter/foundation.dart';

class SaveContactUseCaseImpl extends SaveContactUseCase {
  ContactsRepository contactsRepository;

  SaveContactUseCaseImpl({@required this.contactsRepository});

  Future<int> execute(Contact contact) => contactsRepository.save(contact);
}
