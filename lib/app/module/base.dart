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
  int selectPage = 0;

  tt() async {
    final data = DateTime.parse('2023-05-16 00:00:00.000');

    final c = DateTime.now().difference(data);

    // if (c == 0) {
    //   print('ja era');
    // } else if (c >= -10) {
    //   print('re');
    // } else {
    //   print('ainda nao');
    // }
    print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    print(c.runtimeType);
    print(c);
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
