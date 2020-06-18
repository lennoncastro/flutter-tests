import 'package:bytebank/features/contacts/list/contact.dart';

abstract class SaveContactUseCase {
  Future<int> execute(Contact contact);
}
