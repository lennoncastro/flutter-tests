import 'package:bytebank/ui/resources/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'contact.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  ContactItem(
      this.contact, {
        @required this.onClick,
      });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: app_24,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: app_16,
          ),
        ),
      ),
    );
  }
}
