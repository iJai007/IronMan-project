import 'package:flutter/material.dart';
import 'package:ironman_shop/models/ordermodel.dart';
import 'package:ironman_shop/mongoconnect.dart';

class PrevOrder extends StatelessWidget {
  const PrevOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Previous Orders'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Mongoconnect().getOrder('Jaideep Cleaners'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Ordermodel> orderData = snapshot.data!.cast<Ordermodel>();
            return ListView.builder(
                itemCount: orderData.length,
                itemBuilder: (context, index) {
                  var len = orderData.length;
                  if (orderData[len - index - 1].orderStatus == 'Rejected' ||
                      orderData[len - index - 1].orderStatus == 'Completed') {
                    return Card(
                      child: ListTile(
                        isThreeLine: true,
                        title: Text(
                          orderData[len - index - 1].orderNumber,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Status: ${orderData.elementAt(len - index - 1).orderStatus}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Order Value: ${orderData[len - index - 1].cost}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text('Address: Vijaynagar'),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount:
                                  orderData[len - index - 1].service.length,
                              itemBuilder: (context, i) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(orderData[len - index - 1]
                                        .service
                                        .entries
                                        .elementAt(i)
                                        .key
                                        .toString()),
                                    Text(orderData[len - index - 1]
                                        .service
                                        .entries
                                        .elementAt(i)
                                        .value
                                        .toString()),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox(
                      width: 0,
                    );
                  }
                });
          }
        },
      ),
    );
  }
}
