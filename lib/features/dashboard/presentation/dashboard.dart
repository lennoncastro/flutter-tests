import 'package:bytebank/features/contacts/list/contacts_list.dart';
import 'package:bytebank/features/dashboard/presentation/feature_list.dart';
import 'package:bytebank/features/dashboard/presentation/feature_list_item.dart';
import 'package:bytebank/features/transactions_list.dart';
import 'package:bytebank/ui/resources/dimensions.dart';
import 'package:bytebank/widgets/navigation.dart';
import 'package:flutter/material.dart';

final PAGE_TITLE = 'Dashboard';
final LOGO_PATH = 'images/bytebank_logo.png';

class Dashboard extends StatelessWidget {

  static String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(PAGE_TITLE),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
            child: SafeArea(
          minimum: EdgeInsets.all(app_2),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildLogo(),
                FeatureList(
                  items: getFeatureListItems(context),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }

  Padding buildLogo() {
    return Padding(
      padding: EdgeInsets.all(app_8),
      child: Image.asset(LOGO_PATH),
    );
  }

  List<FeatureItem> getFeatureListItems(BuildContext context) {
    return [
      FeatureItem(
        'Transfer',
        Icons.monetization_on,
        onClick: () => _showContactsList(context),
      ),
      FeatureItem(
        'Transaction Feed',
        Icons.description,
        onClick: () => _showTransactionsList(context),
      ),
    ];
  }

  void _showContactsList(BuildContext context) =>
      navigateTo(context, ContactsList());

  void _showTransactionsList(BuildContext context) =>
      navigateTo(context, TransactionsList());
}
