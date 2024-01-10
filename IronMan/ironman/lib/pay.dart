import 'package:flutter/material.dart';
import 'package:ironman/models/ordermodel.dart';

class Pay extends StatelessWidget {
  String shop;
  String address;
  double totalaftertax = 0;
  List<Ordermodel> order;
  double getTotal() {
    double tot = 0;
    for (var element in order) {
      tot += element.qty * double.parse(element.cost);
    }
    totalaftertax = tot + tot * 0.18;
    return tot;
  }

  double subTotal(index) {
    return order[index].qty * double.parse(order[index].cost);
  }

  Pay(
      {super.key,
      required this.shop,
      required this.address,
      required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm and Pay')),
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: Text('Item')),
                    Center(child: Text('Service')),
                    Center(child: Text('Rate')),
                    Center(child: Text('Quantity')),
                    Center(child: Text('Cost')),
                  ]),
              ListView.builder(
                shrinkWrap: true,
                itemCount: order.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Text(order[index].item)),
                      Center(
                        child: Text(order[index].service),
                      ),
                      Center(child: Text(order[index].cost)),
                      Center(
                        child: Text(order[index].qty.toString()),
                      ),
                      Center(
                        child: Text(subTotal(index).toString()),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Total Before TAX'),
                    Text(getTotal().toString())
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(25.0),
                child: Text('GST'),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('SGST 9%'),
                    Text((getTotal() * 0.09).toString())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('CGST 9%'),
                    Text((getTotal() * 0.09).toString())
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Total After Taxes'),
                    Text(totalaftertax.toString())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
