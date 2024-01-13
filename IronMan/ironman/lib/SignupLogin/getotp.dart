import 'package:flutter/material.dart';
import 'package:ironman/appHome.dart';
import 'package:ironman/models/usermodel.dart';
import 'package:ironman/mongoconnect.dart';

class Getotp extends StatelessWidget {
  Getotp({super.key, required this.user});
  UserModel user;
  int num = 8722416786;
  TextEditingController te = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void next() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AppHome()));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
          onPressed: () async {
            var res = await Mongoconnect().saveUser({
              'UserName': user.name,
              'Phone': user.phone,
              'Address': user.address,
              'Area': user.area
            }, te.text);
            if (res) {
              next();
            } else {
              SnackBar snackBar =
                  const SnackBar(content: Text('Add item to proceed'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: const Icon(Icons.send)),
      appBar: AppBar(
        title: const Text('Enter OTP'),
      ),
      body: Center(
        child: Card(
          child: Column(
            children: [
              Text('OTP sent to number $num'),
              TextField(
                controller: te,
                decoration: const InputDecoration(labelText: 'Enter OTP'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
