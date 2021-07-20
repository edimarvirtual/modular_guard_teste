import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_guard_teste/app/guard_teste.dart';
import 'package:modular_guard_teste/app/page2_page.dart';
import 'package:modular_guard_teste/app/page3_page.dart';

import 'home_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => HomePage(),
    ),
    ChildRoute(
      "/page2",
      child: (_, args) => Page2Page(),
      guards: [GuardTeste()],
    ),
    ChildRoute(
      "/page3",
      child: (_, args) => Page3Page(),
      guards: [GuardTeste()],
    ),
  ];
}
