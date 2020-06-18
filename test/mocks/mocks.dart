import 'package:bytebank/features/contacts/list/data/dao/contact_dao.dart';
import 'package:bytebank/network/webclients/transaction_webclient.dart';
import 'package:mockito/mockito.dart';

class MockContactDao extends Mock implements ContactDao {}

class MockTransactionWebClient extends Mock implements TransactionWebClient {}
