import 'package:flutter/material.dart';

import '../service/product_service_impl.dart';
import 'home/home_page.dart';
import 'options/options_page.dart';

class Base extends StatefulWidget {
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  final List<Widget> page = [
    const HomePage(),
    const OptionsPage(),
  ];
  int selectPage = 0;

  tt() async {
    final a = ProductServiceImpl();
    // await a.create(
    //     productModels: ProductModels(
    //         name: "name", barcode: "barcode", date: "date", option: "option2",description: "2"));
    // await a.delete(id: 4);
   final w=  await a.get(option: 'option');
   print(w.length);
  }

  @override
  void initState() {
    super.initState();
    tt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[selectPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectPage,
          onTap: (value) {
            setState(() {
              selectPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.save_as_rounded), label: "Salva"),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined), label: "Listar"),
          ]),
    );
  }
}
