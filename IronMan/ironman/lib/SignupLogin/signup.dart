import 'package:flutter/material.dart';
import 'package:ironman/SignupLogin/getotp.dart';
import 'package:ironman/models/usermodel.dart';

class Signup extends StatefulWidget {
  late UserModel user;
  Signup({super.key});
  List<TextEditingController> te =
      List.generate(10, (index) => TextEditingController());

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Widget tf(i, val) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          onChanged: (value) => setState(() {
                value;
              }),
          controller: widget.te[i],
          decoration: InputDecoration(
              labelText: val,
              error: (widget.te[i].text.isEmpty)
                  ? const Text('Cannot be Empty')
                  : null,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(8.0)))),
    );
  }

  Widget text(val) {
    return Text(
      val,
      style: const TextStyle(
          color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
    );
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            widget.user = UserModel(
                name: widget.te[0].text,
                address: widget.te[2].text,
                area: widget.te[3].text,
                phone: int.parse(widget.te[1].text));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Getotp(user: widget.user),
                ));
          },
          label: const Text('Verify Phone')),
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text('Signup'),
      ),
      backgroundColor: const Color.fromARGB(255, 216, 198, 145),
      body: Center(
        child: Card(
          shadowColor: const Color.fromARGB(0, 255, 255, 255),
          color: const Color.fromARGB(198, 187, 141, 5),
          elevation: 10,
          margin: const EdgeInsets.all(8.0),
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8.0),
              children: [
                text('Name'),
                tf(0, 'Name'),
                text('Phone'),
                tf(1, 'Phone'),
                text('Address'),
                tf(2, 'Address'),
                text('Area'),
                tf(3, 'Area')
              ]),
        ),
      ),
    );
  }
}
