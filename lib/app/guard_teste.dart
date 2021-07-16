import 'package:flutter_modular/flutter_modular.dart';

class GuardTeste implements RouteGuard {
  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    //coloquei para bloquear a "/page3" para que o erro aconteça
    if (path == "/page3") return false;

    return true;
  }

  @override
  // TODO: implement guardedRoute
  String? get guardedRoute => throw UnimplementedError();
}
