import 'package:flutter/material.dart';
import 'package:ironman_deli/appHome.dart';
import 'package:ironman_deli/delivery.dart';
import 'package:ironman_deli/models/dataoftheme.dart';
import 'package:ironman_deli/models/ordermodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Dataoftheme().oldThemeLightnew(context),
      home: Delivery(
        data: Ordermodel(
            cost: '20',
            orderNumber: '111',
            orderStatus: 'Accepted',
            service: {
              'iron': {'1': '1'}
            },
            id: 'id'),
      ), // const AppHome(),
    );
  }
}
