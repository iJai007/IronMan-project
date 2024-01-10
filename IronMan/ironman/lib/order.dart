import 'package:flutter/material.dart';
import 'package:ironman/cart.dart';
import 'package:ironman/models/ordermodel.dart';

import 'models/shopmodel.dart';

class Order extends StatefulWidget {
  /*late List<TextEditingController> te;
  
 
  //List<Data> data = [Data()];
  int tex = 0;*/
  Map<String, Map<String, int>> selected = {};
  List<int> qty = List.generate(100, (index) => index);
  Shopmodel shop;
  List<Ordermodel> order = [];
  List<bool> open = [];
  Order({super.key, required this.shop});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(
          Icons.send_rounded,
        ),
        label: const Text('Place Order'),
        isExtended: true,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(
                    selected: widget.selected,
                    shop: widget.shop.Name,
                    address: widget.shop.Area,
                    order: widget.order),
              ));
        },
      ),
      appBar: AppBar(
        title: const Text('Shop name'),
      ),
      body: ListView.builder(
        itemCount: widget.shop.Services.length, // srv.length,
        itemBuilder: (context, i) {
          widget.open.add(true);
          return Card(
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        widget.open[i] = !widget.open[i];
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.shop.Services[i], //srv[i],
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_drop_down_rounded, size: 40),
                        )
                      ],
                    )),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.shop.Cost.values
                      .elementAt(i)
                      .length, //cloth.length,
                  itemBuilder: (context, index) {
                    return Visibility(
                      visible: widget.open[i],
                      child: ListTile(
                        isThreeLine: true,
                        contentPadding: const EdgeInsets.all(15),
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              widget.shop.Cost.values
                                  .elementAt(i)
                                  .keys
                                  .elementAt(index), //cloth[index],
                              overflow: TextOverflow.clip,
                              style: const TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                              'Cost:${widget.shop.Cost.values.elementAt(i).values.elementAt(index)}', //'Cost:${cost[index]}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                        trailing: DropdownMenu<int>(
                          inputDecorationTheme: const InputDecorationTheme(
                              fillColor: Colors.green),
                          menuHeight: 200,
                          onSelected: (value) {
                            if (value != null) {
                              setState(() {
                                bool there = false;
                                for (var element in widget.order) {
                                  if (element.item ==
                                          widget.shop.Cost.values
                                              .elementAt(i)
                                              .keys
                                              .elementAt(index) &&
                                      element.cost ==
                                          widget.shop.Cost.values
                                              .elementAt(i)
                                              .values
                                              .elementAt(index) &&
                                      element.service ==
                                          widget.shop.Cost.keys.elementAt(i)) {
                                    there = true;
                                    element.qty = value;
                                    break;
                                  }
                                }
                                if (!there) {
                                  widget.order.add(Ordermodel(
                                      cost: widget.shop.Cost.values
                                          .elementAt(i)
                                          .values
                                          .elementAt(index),
                                      item: widget.shop.Cost.values
                                          .elementAt(i)
                                          .keys
                                          .elementAt(index),
                                      qty: value,
                                      service:
                                          widget.shop.Cost.keys.elementAt(i)));
                                }
                              });
                            }
                          },
                          width: 85,
                          //controller: widget.te[widget.tex++],
                          trailingIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          initialSelection: widget.qty.first,
                          dropdownMenuEntries: widget.qty
                              .map<DropdownMenuEntry<int>>((int value) {
                            return DropdownMenuEntry<int>(
                              value: value,
                              label: value.toString(),
                            );
                          }).toList(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
