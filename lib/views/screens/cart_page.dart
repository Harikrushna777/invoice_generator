import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/routes_utils.dart';

import '../../utils/product_utils.dart';

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
        title: const Text(
          "Cart Page",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(MyRoutes.bill_pdf_page, arguments: index);
            },
            icon: const Icon(
              Icons.picture_as_pdf_rounded,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.purple,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (context, index) => ListTile(
              leading: Container(
                height: double.infinity,
                width: 80,
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
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                "\$ ${cartList[index].price}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            allProduct[index].quantuty--;
                            if (allProduct[index].quantuty == 0 ||
                                allProduct[index].quantuty <= 0) {
                              cartList.remove(cartList[index]);
                              allProduct[index].quantuty = 1;
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                      Text(
                        "${allProduct[index].quantuty}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            allProduct[index].quantuty++;
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
