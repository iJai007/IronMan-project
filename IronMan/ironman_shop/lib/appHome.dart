import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ironman_shop/models/ordermodel.dart';
import 'package:ironman_shop/mongoconnect.dart';
import 'package:ironman_shop/orderDetails.dart';
import 'package:ironman_shop/prevOrder.dart';
import 'package:ironman_shop/updateServices.dart';

class AppHome extends StatefulWidget {
  const AppHome({Key? key}) : super(key: key);

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  late Future<List<dynamic>> _futureOrderData;

  @override
  void initState() {
    super.initState();
    _futureOrderData = Mongoconnect().getOrder('Jaideep Cleaners');
    _refreshData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _refreshData() async {
    var status = await Mongoconnect().update();
    if (status == 'New Order Placed') {
      setState(() {
        _futureOrderData = Mongoconnect().getOrder('Jaideep Cleaners');
      });
    } else {
      _refreshData();
    }
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ));*/
            },
            child: Card(
              margin: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: MediaQuery.of(context).size.width / 1.7,
                  ),
                  const Text('Profile')
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PrevOrder(),
                  ));
            },
            child: const Text(
              'Previous Order',
              style: TextStyle(
                color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpdateServices(),
                  ));
            },
            child: const Text(
              'Services',
              style: TextStyle(
                color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Log Out',
              style: TextStyle(
                color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          )
        ],
      )),
      appBar: AppBar(title: const Text('Jaideep Cleaners')),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: _refreshData,
        child: FutureBuilder<List<dynamic>>(
          future: _futureOrderData,
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
                    if (orderData[len - index - 1].orderStatus != 'Rejected' &&
                        orderData[len - index - 1].orderStatus != 'Completed' &&
                        orderData[len - index - 1].orderStatus !=
                            'Delivering to Shop') {
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order Value: ${orderData[len - index - 1].cost}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  //Text(orderData[index].service.toString()),
                                ],
                              ),
                              const Text('Address: Vijaynagar'),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    orderData[len - index - 1].service.length,
                                itemBuilder: (context, i) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton.icon(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all(
                                          const Color.fromARGB(255, 2, 126, 6),
                                        ),
                                        foregroundColor:
                                            WidgetStateProperty.all(
                                          Colors.white,
                                        ),
                                      ),
                                      onPressed: () async {
                                        if (orderData[len - index - 1]
                                                .orderStatus ==
                                            'Placed') {
                                          setState(() {
                                            orderData[len - index - 1]
                                                .orderStatus = 'Accepted';
                                          });
                                          /*var updated = await Mongoconnect()
                                              .updateOrder(
                                                  orderData[len - index - 1]);*/
                                          var res = await Mongoconnect()
                                              .updateOrder(
                                                  orderData[len - index - 1]
                                                      .orderStatus,
                                                  orderData[len - index - 1]
                                                      .orderNumber);
                                        } else if (orderData[len - index - 1]
                                                .orderStatus ==
                                            'Processing') {
                                          setState(() {
                                            orderData[len - index - 1]
                                                .orderStatus = 'Completed';
                                          });
                                          /*var updated = await Mongoconnect()
                                              .updateOrder(
                                                  orderData[len - index - 1]);*/
                                          var res = await Mongoconnect()
                                              .updateOrder(
                                                  orderData[len - index - 1]
                                                      .orderStatus,
                                                  orderData[len - index - 1]
                                                      .orderNumber);
                                        }
                                      },
                                      icon: const Icon(Icons.check),
                                      label: (orderData[len - index - 1]
                                                  .orderStatus ==
                                              'Placed')
                                          ? const Text('Accept')
                                          : const Text('Completed'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton.icon(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            (orderData[len - index - 1]
                                                        .orderStatus ==
                                                    'Placed')
                                                ? WidgetStateProperty.all(
                                                    const Color.fromARGB(
                                                        255, 159, 11, 0),
                                                  )
                                                : WidgetStateProperty.all(
                                                    const Color.fromARGB(
                                                        255, 0, 56, 159),
                                                  ),
                                        foregroundColor:
                                            WidgetStateProperty.all(
                                          Colors.white,
                                        ),
                                      ),
                                      onPressed: () async {
                                        if ((orderData[len - index - 1]
                                                    .orderStatus ==
                                                'Placed' ||
                                            orderData[len - index - 1]
                                                    .orderStatus ==
                                                'Delivering to Shop')) {
                                          setState(() {
                                            orderData[len - index - 1]
                                                .orderStatus = 'Rejected';
                                          });
                                          /* var updated = await Mongoconnect()
                                              .updateOrder(
                                                  orderData[len - index - 1]);*/
                                          var res = await Mongoconnect()
                                              .updateOrder(
                                                  orderData[len - index - 1]
                                                      .orderStatus,
                                                  orderData[len - index - 1]
                                                      .orderNumber);
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderDetails(
                                                        order: orderData[
                                                            len - index - 1]),
                                              ));
                                        }
                                      },
                                      icon: (orderData[len - index - 1]
                                                  .orderStatus ==
                                              'Placed')
                                          ? const Icon(Icons.cancel_outlined)
                                          : const Icon(Icons.notes_rounded),
                                      label: (orderData[len - index - 1]
                                                  .orderStatus ==
                                              'Placed')
                                          ? const Text('Reject')
                                          : const Text('Details'),
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}

/*
import 'dart:async'; //MY code

import 'package:flutter/material.dart';
import 'package:ironman_shop/models/ordermodel.dart';
import 'package:ironman_shop/mongoconnect.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}
``
class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ShopName')),
        body: FutureBuilder(
          future: Mongoconnect().getOrder('Jaideep Cleaners'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Ordermodel> orderData = snapshot.data!.cast<Ordermodel>();
              return ListView.builder(
                itemCount: orderData.length,
                itemBuilder: (context, index) {
                  var len = orderData.length;
                  //Ordermodel data = orderData[index];
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Order Value: ${orderData[len - index - 1].cost}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              //Text(orderData[index].service.toString()),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton.icon(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          const Color.fromARGB(255, 2, 126, 6),
                                        ),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                          Colors.white,
                                        ),
                                      ),
                                      onPressed: () {},
                                      icon: const Icon(Icons.check),
                                      label: const Text('Accept'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton.icon(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                          const Color.fromARGB(255, 159, 11, 0),
                                        ),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                          Colors.white,
                                        ),
                                      ),
                                      onPressed: () {},
                                      icon: const Icon(Icons.cancel_outlined),
                                      label: const Text('Reject'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )

        /*ListView(shrinkWrap: true, children: const [
        Card(
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            titleAlignment: ListTileTitleAlignment.top,
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
            title: const Text('UserName'),
            isThreeLine: true,
            subtitle: Column(children: [],)
          ),
        )
      ]),*/
        );
  }
}*/
/* old listile data
Card(
                    child: ListTile(
                      isThreeLine: true,
                      title: Text(orderData[index].shop,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order Value: ${orderData[index].cost}',
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          /*ListView.builder(
                            shrinkWrap: true,
                            itemCount: orderData[index].service.length,
                            itemBuilder: (context, i) {
                              return Center(
                                child: Text(
                                    orderData[index].service[i].toString()),
                              );
                            },
                          ),*/

                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton.icon(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color.fromARGB(255, 2, 126, 6)),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white)),
                                    onPressed: () {},
                                    icon: const Icon(Icons.check),
                                    label: const Text('Accept')),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton.icon(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color.fromARGB(
                                                    255, 159, 11, 0)),
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.white)),
                                    onPressed: () {},
                                    icon: const Icon(Icons.cancel_outlined),
                                    label: const Text('Reject')),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
 */