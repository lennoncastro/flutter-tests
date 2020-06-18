import 'package:bytebank/features/contacts/list/data/dao/contact_dao.dart';
import 'package:bytebank/features/contacts/list/presentation/contacts_list.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactListModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => ContactDao())];

  @override
  List<Router> get routers => [
        Router(
          ContactsList.routeName,
          child: (_, args) => ContactsList(
            Modular.get<ContactDao>(),
          ),
        )
      ];

  static Inject get to => Inject<ContactListModule>.of();
}
