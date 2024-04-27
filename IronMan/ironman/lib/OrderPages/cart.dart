import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ironman/apphome.dart';
import 'package:ironman/models/ordermodel.dart';
import 'package:ironman/models/shopmodel.dart';
import 'package:ironman/mongoconnect.dart';
import 'package:ironman/OrderPages/pay.dart';

class Cart extends StatefulWidget {
  Map<String, Map<String, int>> selected;
  String shop;
  String address;
  double total = 0;
  String UserName = 'iJ007';
  String UserID = 'iJ007';
  Map<String, Map<String, dynamic>> orderData = {};
  List<Ordermodel> order = [
    Ordermodel(
        cost: '10', item: 'Shirt', qty: 5, service: 'Iron', orderNumber: '1111')
  ]; //delete later for debugging
  Cart(
      {super.key,
      required this.selected,
      required this.shop,
      required this.address,
      required this.order});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  void next() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AppHome(),
        ));
  }

  double getTotal() {
    double tot = 0;
    for (var element in widget.order) {
      tot += element.qty * double.parse(element.cost);
    }
    return tot;
  }

//Cost per piece  ${widget.shop.Cost.values.elementAt(i).values.elementAt(index)}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              //test new code this works don't delete
              for (var element in widget.order) {
                if (!widget.orderData.containsKey(element.service)) {
                  widget.orderData[element.service] = {};
                }
                widget.orderData[element.service]![element.item] = element.qty;
              }

              /*for (var element in widget.order) {
                widget.orderData.addAll({
                  element.service: {element.item: element.qty}
                });
              }*/ //old code can be deleted later
              var res = await Mongoconnect().saveOrder(json.encode({
                'orderNumber': widget.UserID +
                    DateTime.now().day.toString() +
                    DateTime.now().month.toString() +
                    DateTime.now().year.toString() +
                    DateTime.now().hour.toString() +
                    DateTime.now().minute.toString() +
                    DateTime.now().second.toString(),
                'UserID': widget.UserID,
                'UserName': widget.UserName,
                'OrderDateTime': DateTime.now().toString(),
                'Services': widget.orderData,
                'ShopName': widget.shop,
                'OrderStatus': 'Placed',
                'Cost': getTotal()
              }));
              (res)
                  ? (next())
                  : (const SnackBar(
                      content: Text('Error Saving Please Retry')));

              //pay and proceed page
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pay(
                        shop: widget.shop,
                        address: widget.address,
                        order: widget.order),
                  ));*/
            },
            label: SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Total : ${getTotal()}'),
                  const Text('Confirm Order')
                ],
              ),
            )),
        appBar: AppBar(title: const Text('Cart')),
        body: ListView(
          children: [
            Title(
                color: Colors.white,
                child: Text(
                  widget.shop,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                )),
            Text('Shop Address: ${widget.address}'),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.order.length,
              itemBuilder: (context, index) {
                widget.total += widget.order[index].qty *
                    double.parse(widget.order[index].cost).toDouble();

                return Card(
                    surfaceTintColor: const Color.fromARGB(184, 234, 208, 95),
                    shadowColor: Colors.white,
                    elevation: 10,
                    color: const Color.fromARGB(184, 234, 208, 95),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Title(
                                  color: Colors.white,
                                  child: Text(
                                    '${widget.order[index].item}',
                                    style: TextStyle(fontSize: 25),
                                  )),
                              Title(
                                  color: Colors.white,
                                  child: Text(
                                    'Service : ${widget.order[index].service}\nCost : ${widget.order[index].cost} per unit ',
                                    style: const TextStyle(fontSize: 15),
                                  ))
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Card(
                                      color: Colors
                                          .green, // const Color.fromARGB(123, 255, 193, 7),
                                      elevation: 10,
                                      child: OverflowBar(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  widget.order[index].qty--;
                                                });
                                              },
                                              icon: const Icon(Icons.remove)),
                                          Text(
                                              widget.order[index].qty
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20)),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  widget.order[index].qty++;
                                                });
                                              },
                                              icon: const Icon(Icons.add)),
                                        ],
                                      ),
                                    ),
                                  ]),
                              Text(
                                ('Price: ${widget.order[index].qty * double.parse(widget.order[index].cost)}  '),
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ));
              },
            ),
          ],
        ));
  }
}
