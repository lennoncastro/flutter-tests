import 'package:bytebank/ui/resources/dimensions.dart';
import 'package:flutter/material.dart';

import 'contact_form_controller.dart';

const PAGE_TITLE = 'New contact';

class ContactForm extends StatefulWidget {
  static String routeName = "/contact/form";

  ContactFormController contactFormController;

  ContactForm({@required this.contactFormController});

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
                  onPressed: () => onButtonPressed(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onButtonPressed(BuildContext context) async {
    await widget.contactFormController.save(
      _nameController.text,
      _accountNumberController.text,
    );
    Navigator.pop(context);
  }
}
