import 'package:flutter/material.dart';
import 'package:ironman_deli/models/ordermodel.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.id),
            Text(data.service.toString()),
            ElevatedButton.icon(
                onPressed: () async {
                  //var loc = await Location().getLocation();
                  // var url = MapsLauncher.createCoordinatesUri(loc.latitude!, loc.longitude!);
                  var url =
                      MapsLauncher.createCoordinatesUri(12.57434, 77.32131);
                  launchUrl(url);
                  //MapsLauncher.launchCoordinates(12.57434, 77.32131);
                  print(url);
                },
                icon: const Icon(Icons.map_rounded),
                label: const Text('Map'))
          ],
        ),
      ),
    );
  }
}
