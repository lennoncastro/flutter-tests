import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async => data;

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async => data;
}