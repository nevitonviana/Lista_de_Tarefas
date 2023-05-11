import 'package:flutter_modular/flutter_modular.dart';

import 'module/base.dart';
import 'module/home/home_page.dart';
import 'module/list_products/list products_page.dart';
import 'module/options/options_page.dart';

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
        ChildRoute(
          '/optionsPage',
          child: (context, args) => const OptionsPage(),
        ),
        ChildRoute(
          '/listProducts',
          child: (context, args) => ListProductsPage(name: args.data),
        ),
      ];
}
