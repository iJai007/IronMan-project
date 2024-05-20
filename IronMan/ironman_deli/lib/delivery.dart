import 'package:flutter/material.dart';
import 'package:ironman_deli/models/ordermodel.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:location/location.dart';

class Delivery extends StatelessWidget {
  Delivery({super.key, required this.data});
  Ordermodel data;

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
              data.id,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: data.service.length,
              itemBuilder: (context, index) {
                return ListTile(
                  isThreeLine: true,
                  title: Text(
                    data.service.entries.elementAt(index).key,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                  subtitle: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        data.service.entries.elementAt(index).value.length,
                    itemBuilder: (context, i) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            data.service.entries
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
                            data.service.entries
                                .elementAt(index)
                                .value
                                .entries
                                .elementAt(i)
                                .value,
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
            Text(
              data.service.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            ElevatedButton.icon(
                style: const ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(Color.fromARGB(255, 0, 74, 2)),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)),
                onPressed: () async {
                  var loc = await Location().getLocation();
                  // var url = MapsLauncher.createCoordinatesUri(loc.latitude!, loc.longitude!);
                  /*var url =
                      MapsLauncher.createCoordinatesUri(12.57434, 77.32131);
      */
                  MapsLauncher.launchCoordinates(loc.latitude!, loc.longitude!);
                  //print(url);
                },
                icon: const Icon(Icons.map_rounded),
                label: const Text('Map'))
          ],
        ),
      ),
    );
  }
}
