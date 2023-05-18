import 'package:flutter/material.dart';

import '../../utils/product_utils.dart';
import '../../utils/routes_utils.dart';

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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (context, index) => ListTile(
              leading: Container(
                height: double.infinity,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      cartList[index].thumbnail,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                cartList[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                "\$ ${cartList[index].price}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    cartList.remove(cartList[index]);
                  });
                },
                icon: const Icon(
                  Icons.cancel,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
