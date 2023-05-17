import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/routes_utils.dart';
import 'package:invoice_generator/views/screens/bill_pdf_page.dart';
import 'package:invoice_generator/views/screens/cart_page.dart';
import 'package:invoice_generator/views/screens/favourite_page.dart';
import 'package:invoice_generator/views/screens/home_page.dart';
import 'package:invoice_generator/views/screens/splash_screen.dart';

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
      // theme: ThemeData(
      //   useMaterial3: true,
      //   colorSchemeSeed: Colors.purple,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.purple,
      //     foregroundColor: Colors.white,
      //   ),
      // ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      // themeMode: Global.isDark ? ThemeMode.dark : ThemeMode.light,
      initialRoute: MyRoutes.splash_screen,
      routes: {
        MyRoutes.home: (context) => const home_page(),
        MyRoutes.splash_screen: (context) => const splash_screen(),
        MyRoutes.cart_page: (context) => const cart_page(),
        MyRoutes.bill_pdf_page: (context) => const bill_pdf_page(),
        MyRoutes.favourite_page: (context) => const favourite_page(),
      },
    );
  }
}
