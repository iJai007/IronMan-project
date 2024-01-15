import 'package:flutter/material.dart';
import 'package:ironman/OrderPages/order.dart';
import 'package:ironman/mongoconnect.dart';
import 'package:ironman/models/shopmodel.dart';

class Shop extends StatelessWidget {
  String val;
  late List<Shopmodel> shops;
  Shop({super.key, required this.val});
  Future<List<Shopmodel>> getData() async {
    shops = await Mongoconnect().connect();
    return shops;
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'Iron ',
      'l1dhgfsa',
      'l1dhgfsa',
      'l1dhgfsa',
      'l1dhgfsa',
      'l1dhgfsa',
      'l1dhgfsa'
    ];
    return Scaffold(
      appBar: AppBar(title: Text(val)),
      body: FutureBuilder<List<Shopmodel>>(
        future: getData(),
        builder: (context, snapshot) => (snapshot.hasData)
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      hoverColor: const Color.fromARGB(255, 17, 65, 3),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Order(shop: snapshot.data![index]),
                            ));
                      },
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.iron_outlined, size: 100),
                            const SizedBox(
                              width: 25,
                            ),
                            Text(
                              snapshot.data![index].Name,
                              //list[index],
                              overflow: TextOverflow.clip,
                              style: const TextStyle(fontSize: 25),
                            )
                          ]),
                    ),
                  );
                },
              )
            : const Center(
                child: Card(
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 5),
                  ),
                ),
              ),
      ),
    );
  }
}
