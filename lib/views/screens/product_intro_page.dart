import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/product_utils.dart';

import '../../utils/routes_utils.dart';

class product_intro_page extends StatefulWidget {
  const product_intro_page({Key? key}) : super(key: key);

  @override
  State<product_intro_page> createState() => _product_intro_pageState();
}

class _product_intro_pageState extends State<product_intro_page> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Detail",
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
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.purple),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 10,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(allProduct[index].thumbnail),
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                SizedBox(height: 5),
                Text(
                  allProduct[index].title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Id        :-           ${allProduct[index].id}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Brand  :-   ${allProduct[index].brand}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "Price   :-   \$ ${allProduct[index].price}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "Description  :-\n${allProduct[index].description}",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.justify,
                ),
                // Text(
                //   "Stock :- ${allProduct[index].stock}",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 14,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pushNamed(
                          MyRoutes.cart_page,
                          arguments: index,
                        );
                      });
                      cartList.add(allProduct[index]);
                    },
                    child: Text("Add To Cart"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
