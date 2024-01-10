import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:ironman/models/shopmodel.dart';

class Mongoconnect {
  Future<List<Shopmodel>> connect() async {
    var res =
        await http.post(Uri.parse('http://localhost:5000/api/shops/getShop'));
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
        Uri.parse('http://localhost:5000/api/shops/placeOrder'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: order);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}



/*import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ironman/shopmodel.dart';

class Mongoconnect {
  Future<List<Shopmodel>> connect() async {
    var res =
        await http.post(Uri.parse('http://localhost:5000/api/shops/getShop'));
    List<Shopmodel> val = json.decode(res.body);
    return val;
  }
}
*/