import 'package:bytebank/features/contacts/list/contact.dart';

abstract class FindAllContactsUseCase {
  Future<List<Contact>> execute();
}
