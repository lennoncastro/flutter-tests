import 'dart:convert';

import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/network/webclient.dart';
import 'package:http/http.dart';

const int MOCKED_DELAY_TIME = 2;

class TransactionWebClient {
  int delayInSeconds = MOCKED_DELAY_TIME;

  TransactionWebClient( { int delayInSeconds } ) {
    this.delayInSeconds = delayInSeconds;
  }

  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(BASE_URL);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: delayInSeconds));

    final Response response = await client.post(BASE_URL,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error submitting transaction',
    401: 'authentication failed',
    409: 'transaction already exists'
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
