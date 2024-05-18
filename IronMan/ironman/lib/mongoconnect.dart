// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:ironman/models/shopmodel.dart';

const url3 = 'http://192.168.56.1:5000';
const url1 = 'http://localhost:5000'; //  old url
const url2 = 'https://lmdb.loca.lt'; // localtunnel url
const url4 = 'http://192.168.29.157:5000';

class Mongoconnect {
  Future<List<Shopmodel>> connect() async {
    var res = await http.post(Uri.parse('$url2/api/shops/getShop'));
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
    var res = await http.post(Uri.parse('$url2/api/shops/placeOrder'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: order);
    if (res.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

/*Future<String> loginStatus() async {
  var
}*/

  Future<bool> saveUser(User, OTP) async {
    var res = await http.post(Uri.parse('$url2/api/shops/createUser'),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode({'Data': User, 'OTP': OTP}));
    if (res.statusCode == 200) {
      Map data = json.decode(res.body);
      if (data.values.elementAt(0)) {
        return true;
      } else {
        return false;
      }
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