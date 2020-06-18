import 'package:bytebank/features/contacts/form/contact_form.dart';
import 'package:bytebank/features/contacts/list/presentation/contact.dart';
import 'package:bytebank/features/contacts/list/presentation/contact_item.dart';
import 'package:bytebank/features/transaction_form.dart';
import 'package:bytebank/ui/components/progress.dart';
import 'package:bytebank/widgets/navigation.dart';
import 'package:flutter/material.dart';

import '../../../../database/dao/contact_dao.dart';

class ContactsList extends StatefulWidget {
  static String routeName = '/contacts';

  ContactDao contactDao;

  ContactsList(this.contactDao);

  @override
  _ContactsListState createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfer'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: widget.contactDao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return ContactItem(
                    contact,
                    onClick: () => navigateTo(
                      context,
                      TransactionForm(contact),
                    ),
                  );
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToWithString(ContactForm.routeName),
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
