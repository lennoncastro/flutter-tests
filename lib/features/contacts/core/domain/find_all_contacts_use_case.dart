import 'package:bytebank/features/contacts/list/presentation/contact.dart';

abstract class FindAllContactsUseCase {
  Future<List<Contact>> execute();
}
