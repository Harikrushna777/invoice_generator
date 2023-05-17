import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/product_utils.dart';
import 'package:invoice_generator/views/modals/product_variable.dart';

import '../../utils/routes_utils.dart';
import '../modals/global.dart';

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: I,
        title: const Text(
          "Egle Enterprise",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                Global.isDark = !Global.isDark;
              });
            },
            icon: Icon(Global.isDark
                ? Icons.light_mode_outlined
                : Icons.dark_mode_outlined),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                Global.isGrid = !Global.isGrid;
              });
            },
            icon: Icon(Global.isGrid ? Icons.list : Icons.grid_on),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        child: Scrollbar(
          interactive: true,
          thickness: 10,
          radius: const Radius.circular(50),
          child: Global.isGrid
              ? GridView(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3.5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  children: List.generate(
                    allProduct.length,
                    (index) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.purple.shade300.withOpacity(0.5),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    allProduct[index].thumbnail,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadiusDirectional.vertical(
                                  bottom: Radius.circular(10),
                                ),
                                color: Colors.purple.shade300.withOpacity(0.5),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    allProduct[index].title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    allProduct[index].brand,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "\$ ${allProduct[index].price}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: allProduct.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Container(
                      height: double.infinity,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 5),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(
                            allProduct[index].thumbnail,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      allProduct[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "\$ ${allProduct[index].price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.cart_page, arguments: index);
                        });
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
