## Testes com Guards do Modular

Estou utilizando slidy e modular no meu projeto novo, e aparentemente identifiquei um problema no sistema de guards, aparentemente qualquer negação de rota gera um erro, criei um projeto de exemplo com o problema acontecendo em que ele permite para qualquer rota que não seja a "/page3", e quando abro a "/page3", ao invés de redirecionar para a "/page2", ele gera um erro.

Obs já usava o guard antes do método "canActivate" ser uma Future<bool>, funcionava ok, mais agora que fui fazer um projeto novo, aparentemente não está funcionando

Agradeço a atenção, parabéns a equipe do slidy e modular, pois eles nos ajudam a organizar melhor nossos projetos.

Segue abaixo detalhes do erro é um link para o GitHub no final:
  
**pubspec.yaml**
  
```
name: modular_guard_teste
description: A new Flutter project.

# The following line prevents the package from being accidentally published to
# pub.dev using `pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
version: 1.0.0+1

environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  flutter_modular: ^3.3.1
  mobx: ^2.0.1
  flutter_mobx: ^2.0.0

dev_dependencies:
  flutter_modular_test: ^1.0.1
  flutter_test:
    sdk: flutter
  mobx_codegen: ^2.0.1+3

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware.

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages
```

**guard_teste.dart**

```
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
```

**app_module.dart**

```
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
      guardedRoute: "/home",
    ),
    ChildRoute(
      "/page3",
      child: (_, args) => Page3Page(),
      guards: [GuardTeste()],
      guardedRoute: "/page2",
    ),
  ];
}
```  

Para facilitar subi esse projeto de teste para o GitHub
https://github.com/edimarvirtual/modular_guard_teste
