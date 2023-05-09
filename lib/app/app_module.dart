import 'package:flutter_modular/flutter_modular.dart';

import 'module/base.dart';
import 'module/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => Base(),
        ),
        ChildRoute(
          '/home',
          child: (context, args) => const HomePage(),
        ),
      ];
}
