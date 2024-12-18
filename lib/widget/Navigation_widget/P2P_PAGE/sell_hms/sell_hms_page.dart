import 'package:flutter/material.dart';


class SellHMSPage extends StatelessWidget {
  const SellHMSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(onPressed: Navigator.of(context).pop, icon: const Icon(Icons.arrow_back)),
          title: const Text(
            'Продажа HMS',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: Color.fromARGB(255, 44, 62, 80)),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return const Column(children: [Text('asdasd')],);
          },
          itemCount: 2,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
        ),
      ),
    );
  }
}
