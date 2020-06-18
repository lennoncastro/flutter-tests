import 'package:bytebank/features/contacts/form/contact_form.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../database/dao/contact_dao.dart';

class ContactFormModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => ContactDao())];

  @override
  List<Router> get routers => [
        Router(
          ContactForm.routeName,
          child: (_, args) => ContactForm(
            Modular.get<ContactDao>(),
          ),
        )
      ];

  static Inject get to => Inject<ContactFormModule>.of();
}
