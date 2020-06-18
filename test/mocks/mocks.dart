import 'package:bytebank/network/webclients/transaction_webclient.dart';
import 'package:mockito/mockito.dart';

import '../../lib/database/dao/contact_dao.dart';

class MockContactDao extends Mock implements ContactDao {}

class MockTransactionWebClient extends Mock implements TransactionWebClient {}
