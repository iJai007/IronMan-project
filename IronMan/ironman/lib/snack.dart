import 'package:flutter/material.dart';

class Snack {
  void nonErrorSnack(val, context) {
    SnackBar snackBar = SnackBar(content: Text('$val'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
