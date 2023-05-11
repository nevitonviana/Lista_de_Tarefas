import 'package:flutter/material.dart';

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
  int selectPage = 1;

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
