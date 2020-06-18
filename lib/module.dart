import 'package:bytebank/features/dashboard/presentation/dashboard.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'main.dart';

class Module extends MainModule {
  @override
  Widget get bootstrap => BytebankApp();

  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
    Router(Dashboard.routeName, child: (_, __) => Dashboard()),
  ];
}
