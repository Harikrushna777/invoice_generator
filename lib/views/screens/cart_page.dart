import 'package:flutter/material.dart';

class cart_page extends StatefulWidget {
  const cart_page({Key? key}) : super(key: key);

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}
