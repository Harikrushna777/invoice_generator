import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/product_utils.dart';

import '../../utils/image_path.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath + "logo.png",
              scale: 12.5,
              color: Colors.white.withOpacity(0.9),
            ),
            const Text(
              "Egle Enterprise",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(MyRoutes.user_detail);
          },
          icon: const Icon(
            Icons.account_box_rounded,
            color: Colors.white,
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
                        color: Colors.purple,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).pushNamed(
                                      MyRoutes.product_intro_page,
                                      arguments: index);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      allProduct[index].thumbnail,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.vertical(
                                      bottom: Radius.circular(10),
                                    ),
                                    color: Colors.purple,
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        allProduct[index].title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        allProduct[index].brand,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        "\$ ${allProduct[index].price}",
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                FloatingActionButton.small(
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                        MyRoutes.favourite_page,
                                        arguments: index);
                                    favouriteList.add(allProduct[index]);
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.redAccent.shade400,
                                  ),
                                ),
                              ],
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
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    MyRoutes.favourite_page,
                                    arguments: index);
                                favouriteList.add(allProduct[index]);
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.redAccent.shade400,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pushNamed(
                                      MyRoutes.product_intro_page,
                                      arguments: index);
                                });
                              },
                              icon: const Icon(
                                Icons.arrow_forward_rounded,
                                size: 28,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
      // drawer: Drawer(),
    );
  }
}
