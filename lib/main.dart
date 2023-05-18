import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/routes_utils.dart';
import 'package:invoice_generator/views/modals/global.dart';
import 'package:invoice_generator/views/screens/bill_pdf_page.dart';
import 'package:invoice_generator/views/screens/cart_page.dart';
import 'package:invoice_generator/views/screens/favourite_page.dart';
import 'package:invoice_generator/views/screens/home_page.dart';
import 'package:invoice_generator/views/screens/product_intro_page.dart';
import 'package:invoice_generator/views/screens/splash_screen.dart';
import 'package:invoice_generator/views/screens/user_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.purple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        brightness: Brightness.dark,
      ),
      themeMode: Global.isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: MyRoutes.splash_screen,
      routes: {
        MyRoutes.splash_screen: (context) => const splash_screen(),
        MyRoutes.home: (context) => const home_page(),
        MyRoutes.product_intro_page: (context) => const product_intro_page(),
        MyRoutes.cart_page: (context) => const cart_page(),
        MyRoutes.bill_pdf_page: (context) => const bill_pdf_page(),
        MyRoutes.favourite_page: (context) => const favourite_page(),
        MyRoutes.user_detail: (context) => const user_detail(),
      },
    );
  }
}
