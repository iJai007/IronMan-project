import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ironman_shop/models/ordermodel.dart';

import 'package:ironman_shop/models/shopmodel.dart';

//http://localhost:5000  old url
// https://lmdb.loca.lt localtunnel url
class Mongoconnect {
  Future<List<Shopmodel>> connect() async {
    var res = await http.post(
        Uri.parse('https://lmdb.loca.lt/api/shops/getMyShop'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode({'Name': 'Jaideep Cleaners'}));
    if (res.statusCode == 200) {
      List<dynamic> jsonData = json.decode(res.body);
      List<Shopmodel> shops =
          jsonData.map((data) => Shopmodel.fromJson(data)).toList();
      return shops;
    } else {
      throw Exception('Failed to load data: ${res.statusCode}');
    }
  }

  Future<bool> saveOrder(order) async {
    var res = await http.post(
        Uri.parse('https://lmdb.loca.lt/api/shops/placeOrder'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: order);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<String> update() async {
    try {
      var res = await http.get(Uri.parse(
          'https://lmdb.loca.lt/api/shops/events?shopName=Jaideep%20Cleaners'));
      if (res.statusCode == 200) {
        var status = json.decode(res.body);
        return status;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      return 'error';
    }
  }

  Future<List<dynamic>> getOrder(shop) async {
    var res = await http.post(
        Uri.parse('https://lmdb.loca.lt/api/shops/getOrder'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode({'shopData': shop}));
    if (res.statusCode == 200) {
      List<dynamic> jsonData = json.decode(res.body);
      List<Ordermodel> orders =
          jsonData.map((data) => Ordermodel.fromJson(data)).toList();
      return orders;
    } else {
      throw Exception('Failed to get data ${res.statusCode}');
    }
  }

  Future<bool> updateOrder(orderStatus, orderNumber) async {
    var res = await http.post(
        Uri.parse('https://lmdb.loca.lt/api/shops/updateOrderStatus'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode({'status': orderStatus, 'orderNumber': orderNumber}));
    /*const orderStatus = req.body.status;
    const OrderID = req.body.orderNumber; */
    print(res);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
