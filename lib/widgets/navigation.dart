
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void navigateTo(BuildContext context, Widget destination) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => destination,
    ),
  );
}
