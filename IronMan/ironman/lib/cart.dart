import 'package:flutter/material.dart';
import 'package:ironman/models/ordermodel.dart';
import 'package:ironman/models/shopmodel.dart';

class Cart extends StatelessWidget {
  Map<String, Map<String, int>> selected;
  String shop;
  List<Ordermodel> order;
  Cart(
      {super.key,
      required this.selected,
      required this.shop,
      required this.order});
//Cost per piece  ${widget.shop.Cost.values.elementAt(i).values.elementAt(index)}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Cart')),
        body: Column(
          children: [
            Title(
                color: Colors.white,
                child: Text(
                  shop,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                )),
            ListView.builder(
              shrinkWrap: true,
              itemCount: order.length,
              itemBuilder: (context, index) {
                return ListTile(
                  isThreeLine: true,
                  title: Text(order[index].item),
                  subtitle: Text(
                      'Service: ${order[index].service} \nRate per piece : ${order[index].cost}\nQuantity:${order[index].qty}'),
                );
              },
            ),
          ],
        ));
  }
}
