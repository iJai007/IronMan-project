import 'package:flutter/material.dart';
import 'package:ironman/order.dart';

class Shop extends StatelessWidget {
  String val;

  Shop({super.key, required this.val});

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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              hoverColor: const Color.fromARGB(255, 17, 65, 3),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Order(),
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
                      list[index],
                      overflow: TextOverflow.clip,
                      style: const TextStyle(fontSize: 25),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }
}
