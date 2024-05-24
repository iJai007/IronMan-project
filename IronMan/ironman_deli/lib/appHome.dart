import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ironman_deli/delivery.dart';
import 'package:ironman_deli/models/ordermodel.dart';
import 'package:ironman_deli/mongoconnect.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  late Future<List<dynamic>> getData;
  late List<Ordermodel> data;
  late Ordermodel myData;
  @override
  void initState() {
    super.initState();
    getData = Mongoconnect().getOrder('Jaideep Cleaners');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IronPartner'),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          data = List<Ordermodel>.from(
              await Mongoconnect().getOrder('Jaideep Cleaners'));
          setState(() {
            data;
          });
        },
        child: FutureBuilder<List<dynamic>>(
            future: getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Ordermodel> data = snapshot.data!.cast<Ordermodel>();
                data.removeWhere((element) {
                  return element.orderStatus != 'Accepted' &&
                      element.orderStatus != 'Completed';
                });
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    if (data.elementAt(index).orderStatus == 'Accepted' ||
                        data.elementAt(index).orderStatus == 'Completed') {
                      return Card(
                        child: ListTile(
                          title: Text(
                            data.elementAt(index).orderNumber,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          subtitle: Column(
                            children: [
                              const Text('Delivery Charges: 50'),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton.icon(
                                        style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                            Color.fromARGB(255, 2, 126, 6),
                                          ),
                                          foregroundColor:
                                              WidgetStatePropertyAll(
                                            Colors.white,
                                          ),
                                        ),
                                        onPressed: () async {
                                          if (data
                                                  .elementAt(index)
                                                  .orderStatus ==
                                              'Accepted') {
                                            setState(() {
                                              data
                                                      .elementAt(index)
                                                      .orderStatus =
                                                  'Collecting from User';
                                            });
                                            /*var updated = await Mongoconnect()
                                                .updateOrder(
                                                    orderData[len - index - 1]);*/
                                            setState(() {
                                              myData = data.elementAt(index);
                                            });

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Delivery(
                                                    data: myData,
                                                  ),
                                                ));
                                            var res = await Mongoconnect()
                                                .updateOrder(
                                                    data
                                                        .elementAt(index)
                                                        .orderStatus,
                                                    data
                                                        .elementAt(index)
                                                        .orderNumber);
                                          } else if (data
                                                  .elementAt(index)
                                                  .orderStatus ==
                                              'Completed') {
                                            setState(() {
                                              data
                                                      .elementAt(index)
                                                      .orderStatus =
                                                  'Collecting from Shop';
                                            });
                                            /*var updated = await Mongoconnect()
                                                .updateOrder(
                                                    orderData[len - index - 1]);*/
                                            var res = await Mongoconnect()
                                                .updateOrder(
                                                    data
                                                        .elementAt(index)
                                                        .orderStatus,
                                                    data
                                                        .elementAt(index)
                                                        .orderNumber);

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Delivery(
                                                    data: data.elementAt(index),
                                                  ),
                                                ));
                                          }
                                        },
                                        icon: const Icon(Icons.check),
                                        label: const Text('Accept')),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton.icon(
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          Color.fromARGB(255, 159, 11, 0),
                                        ),
                                        foregroundColor: WidgetStatePropertyAll(
                                          Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          data.removeAt(index);
                                        });
                                      },
                                      icon: const Icon(Icons.cancel_outlined),
                                      label: const Text('Reject'),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Text(
                          'Waiting for Order${data.elementAt(index).orderStatus}');
                    }
                  },
                );
              } else {
                return const Center(
                  child: Card(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            }),
      ),
    );
  }
}

/*import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => AppHomeState();
}

class AppHomeState extends State<AppHome> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
*/