import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/product_utils.dart';

import '../../main.dart';
import '../../utils/routes_utils.dart';

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
        title: const Text(
          "Contact",
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
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                  ),
                  children: List.generate(
                    allProduct.length,
                    (index) => Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.primaries[index % 18].shade200,
                      ),
                      // child: Column(
                      //   children: [
                      //     Expanded(
                      //       flex: 3,
                      //       child: Container(
                      //         decoration: BoxDecoration(
                      //           image: DecorationImage(
                      //             image: FileImage(
                      //               Global.image!,
                      //             ),
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Container(
                      //         width: double.infinity,
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadiusDirectional.vertical(
                      //             bottom: Radius.circular(10),
                      //           ),
                      //           color: Colors.primaries[index % 18],
                      //         ),
                      //         padding: EdgeInsets.all(10),
                      //         // child: Text(
                      //         //   "Title : ${Global.firstName!} ${Global.lastName!}",
                      //         //   style: TextStyle(
                      //         //     color: Colors.white,
                      //         //   ),
                      //         // ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: allProduct.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.primaries[index % 18].shade200,
                      child: Text("${index + 1}"),
                    ),
                    title: Text(
                      "Title :${index + 1}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "Hii.It's My App. $index",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       Navigator.of(context)
      //           .pushNamed(MyRoutes.);
      //     });
      //   },
      //   backgroundColor: Colors.purple,
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
