import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/product_utils.dart';

class favourite_page extends StatefulWidget {
  const favourite_page({Key? key}) : super(key: key);

  @override
  State<favourite_page> createState() => _favourite_pageState();
}

class _favourite_pageState extends State<favourite_page> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Favourite Product",
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
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView.builder(
            itemCount: favouriteList.length,
            itemBuilder: (context, index) => ListTile(
              leading: Container(
                height: double.infinity,
                width: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      favouriteList[index].thumbnail,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                favouriteList[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                "\$ ${favouriteList[index].price}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    favouriteList.removeAt(index);
                  });
                },
                icon: Icon(
                  Icons.cancel,
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
