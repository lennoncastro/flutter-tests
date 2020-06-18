import 'package:bytebank/features/contacts/list/presentation/contact.dart';

abstract class SaveContactUseCase {
  Future<int> execute(Contact contact);
}
