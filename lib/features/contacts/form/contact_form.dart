import 'package:bytebank/features/contacts/list/presentation/contact.dart';
import 'package:bytebank/ui/resources/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../database/dao/contact_dao.dart';

const PAGE_TITLE = 'New contact';

class ContactForm extends StatefulWidget {
  static String routeName = "/contact/form";

  ContactDao contactDao;

  ContactForm(this.contactDao);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PAGE_TITLE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(app_16),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full name',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: app_8),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account number',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: app_16),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Create'),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(0, name, accountNumber);
                    _save(widget.contactDao, newContact, context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _save(
    ContactDao contactDao,
    Contact newContact,
    BuildContext context,
  ) async {
    await contactDao.save(newContact);
    Navigator.pop(context);
  }
}
