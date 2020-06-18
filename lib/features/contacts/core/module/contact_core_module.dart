import 'package:bytebank/features/contacts/core/data/contacts_repository.dart';
import 'package:bytebank/features/contacts/core/data/contacts_repository_impl.dart';
import 'package:bytebank/features/contacts/form/contact_form.dart';
import 'package:bytebank/features/contacts/list/presentation/contacts_list.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../database/dao/contact_dao.dart';

class ContactCoreModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => ContactDao(),
        ),
        Bind<ContactsRepository>(
          (i) => ContactsRepositoryImpl(
            contactDao: Modular.get<ContactDao>(),
          ),
        )
      ];

  @override
  List<Router> get routers => [
        Router(
          ContactForm.routeName,
          child: (_, args) => ContactForm(
            Modular.get<ContactDao>(),
          ),
        ),
        Router(
          ContactsList.routeName,
          child: (_, args) => ContactsList(
            Modular.get<ContactDao>(),
          ),
        )
      ];

  static Inject get to => Inject<ContactCoreModule>.of();
}
