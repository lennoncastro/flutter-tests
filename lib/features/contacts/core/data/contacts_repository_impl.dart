import 'package:bytebank/features/contacts/list/contact.dart';
import 'package:flutter/widgets.dart';

import '../../../../database/dao/contact_dao.dart';
import 'contacts_repository.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  ContactDao contactDao;

  ContactsRepositoryImpl({@required this.contactDao});

  @override
  Future<List<Contact>> findAll() => contactDao.findAll();

  @override
  Future<int> save(Contact contact) => contactDao.save(contact);
}
