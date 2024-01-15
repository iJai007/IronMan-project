import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Card(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                  decoration: const InputDecoration(
                      label: Text('Phone Number'),
                      contentPadding: EdgeInsets.all(8.0)),
                  controller: te,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.pin),
                    label: const Text('Get OTP')),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6)
                  ],
                  decoration: const InputDecoration(
                      label: Text('Enter OTP'),
                      contentPadding: EdgeInsets.all(8.0)),
                  controller: te2,
                ),
                const SizedBox(
                  height: 50,
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
      ),
    );
  }
}
