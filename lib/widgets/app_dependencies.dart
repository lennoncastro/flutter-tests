import 'package:bytebank/network/webclients/transaction_webclient.dart';
import 'package:flutter/cupertino.dart';

class AppDependencies extends InheritedWidget {
  final TransactionWebClient transactionWebClient;

  AppDependencies({
    @required this.transactionWebClient,
    @required Widget child,
  }) : super(child: child);

  static AppDependencies of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDependencies>();

  @override
  bool updateShouldNotify(AppDependencies oldWidget) {
    return transactionWebClient != oldWidget.transactionWebClient;
  }
}
