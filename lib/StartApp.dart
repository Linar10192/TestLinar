import 'package:flutter/material.dart';
import 'package:flutter_application_1/Product/card_product_buy.dart';
import 'package:flutter_application_1/Product/card_product_sell.dart';
import 'package:flutter_application_1/widget/Login.dart';
import 'package:flutter_application_1/widget/Navigation_widget/Navigation_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Store()),
        ChangeNotifierProvider(create: (_) => StoreSell()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        routes: {
          '/login': (context) => const Login(),
          '/Main_menu': (context) =>  const NavigationPage(),
        },
        initialRoute: '/Main_menu',
      ),
    );
  }
}
