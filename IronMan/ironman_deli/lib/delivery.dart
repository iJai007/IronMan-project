import 'package:flutter/material.dart';
import 'package:ironman_deli/appHome.dart';
import 'package:ironman_deli/models/ordermodel.dart';
import 'package:ironman_deli/mongoconnect.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:location/location.dart';

class Delivery extends StatefulWidget {
  Delivery({super.key, required this.data});
  Ordermodel data;

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery'),
      ),
      body: Card(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          shrinkWrap: true,
          children: [
            Text(
              widget.data.id,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.data.service.length,
              itemBuilder: (context, index) {
                return ListTile(
                  isThreeLine: true,
                  title: Text(
                    widget.data.service.entries.elementAt(index).key,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  subtitle: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.data.service.entries
                        .elementAt(index)
                        .value
                        .length,
                    itemBuilder: (context, i) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.data.service.entries
                                .elementAt(index)
                                .value
                                .entries
                                .elementAt(i)
                                .key,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          const Text(
                            ':',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            widget.data.service.entries
                                .elementAt(index)
                                .value
                                .entries
                                .elementAt(i)
                                .value
                                .toString(),
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Shop Location',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                ElevatedButton.icon(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 0, 74, 2)),
                        foregroundColor: WidgetStatePropertyAll(Colors.white)),
                    onPressed: () async {
                      //var loc = await Location().getLocation();
                      // var url = MapsLauncher.createCoordinatesUri(loc.latitude!, loc.longitude!);
                      /*var url =
                          MapsLauncher.createCoordinatesUri(12.57434, 77.32131);
                      */
                      MapsLauncher.launchCoordinates(
                          double.parse(widget.data.lat),
                          double.parse(widget.data.lon));
                      //print(url);
                    },
                    icon: const Icon(Icons.map_rounded),
                    label: const Text('Map')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Customer Location',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                ElevatedButton.icon(
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 0, 74, 2)),
                        foregroundColor: WidgetStatePropertyAll(Colors.white)),
                    onPressed: () async {
                      //var loc = await Location().getLocation();
                      // var url = MapsLauncher.createCoordinatesUri(loc.latitude!, loc.longitude!);
                      /*var url =
                          MapsLauncher.createCoordinatesUri(12.57434, 77.32131);
                      */
                      MapsLauncher.launchCoordinates(
                          double.parse(widget.data.lat),
                          double.parse(widget.data.lon));
                      //print(url);
                    },
                    icon: const Icon(Icons.map_rounded),
                    label: const Text('Map')),
              ],
            ),
            ElevatedButton.icon(
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 0, 74, 2)),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)),
                onPressed: () async {
                  if (widget.data.orderStatus == 'Collecting from User') {
                    setState(() {
                      widget.data.orderStatus = 'Delivering to Shop';
                    });
                    var res = await Mongoconnect().updateOrder(
                        'Delivering to Shop', widget.data.orderNumber);
                  } else if (widget.data.orderStatus == 'Delivering to Shop') {
                    setState(() {
                      widget.data.orderStatus = 'Processing';
                    });
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppHome(),
                      ),
                      (route) => false,
                    );
                    var res = await Mongoconnect()
                        .updateOrder('Processing', widget.data.orderNumber);
                  } else if (widget.data.orderStatus ==
                      'Collecting from Shop') {
                    setState(() {
                      widget.data.orderStatus = 'Delivering to User';
                    });
                    var res = await Mongoconnect().updateOrder(
                        'Delivering to User', widget.data.orderNumber);
                  } else {
                    var res = await Mongoconnect()
                        .updateOrder('Finished', widget.data.orderNumber);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppHome(),
                      ),
                      (route) => false,
                    );
                  }
                },
                icon: const Icon(Icons.check),
                label: (widget.data.orderStatus == 'Collecting from User')
                    ? const Text('Collected to User')
                    : (widget.data.orderStatus == 'Delivering to Shop')
                        ? const Text('Delivered to Shop')
                        : (widget.data.orderStatus == 'Completed')
                            ? const Text('Collected from Shop')
                            : const Text('Delivered to User'))
          ],
        ),
      ),
    );
  }
}
