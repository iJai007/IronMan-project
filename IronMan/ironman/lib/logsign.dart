import 'package:flutter/material.dart';

class LogSign extends StatelessWidget {
  String val;
  LogSign({super.key, required this.val});

  @override
  Widget build(BuildContext context) {
    TextEditingController te = TextEditingController();
    TextEditingController te2 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(val),
        centerTitle: true,
      ),
      body: Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            decoration: const InputDecoration(
                label: Text('User id'), contentPadding: EdgeInsets.all(8.0)),
            controller: te,
          ),
          TextField(
            decoration: const InputDecoration(
                label: Text('Password'), contentPadding: EdgeInsets.all(8.0)),
            controller: te2,
          ),
          ElevatedButton.icon(
              onPressed: () {
                SnackBar snackBar =
                    SnackBar(content: Text(val + te.text + te.text));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: const Icon(Icons.login_rounded),
              label: Text(val))
        ],
      )),
    );
  }
}
