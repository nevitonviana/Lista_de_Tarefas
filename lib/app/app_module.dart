import 'package:flutter_modular/flutter_modular.dart';

import 'core/sqflite_db.dart';
import 'module/base.dart';
import 'module/home/home_page.dart';
import 'module/list_products/list_products_page.dart';
import 'module/options/options_page.dart';
import 'service/product_service.dart';
import 'service/product_service_impl.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => SqfliteDb()),
        Bind.lazySingleton<ProductService>((i) => ProductServiceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const Base(),
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
