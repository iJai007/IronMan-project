import 'package:flutter/material.dart';
import 'package:ironman/SignupLogin/getotp.dart';
import 'package:ironman/SignupLogin/localData.dart';
import 'package:ironman/apphome.dart';
import 'package:ironman/models/usermodel.dart';
import 'package:ironman/mongoconnect.dart';

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

  void next() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AppHome()));
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            var res = await Mongoconnect().saveUser({
              'UserName': widget.te[0].text,
              'Phone': widget.te[1].text,
              'Address': widget.te[3].text,
              'Area': widget.te[4].text,
              'Pincode': widget.te[5].text,
              'Password': widget.te[2].text
            }, '000000');
            await LocalData().saveUserLocally({
              'UserName': widget.te[0].text,
              'Phone': widget.te[1].text,
              'Address': widget.te[3].text,
              'Area': widget.te[4].text,
              'Pincode': widget.te[5].text,
              'Password': widget.te[2].text
            });
            if (res) {
              next();
            } else {
              SnackBar snackBar =
                  const SnackBar(content: Text('Add item to proceed'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          /*{
            widget.user = UserModel(
                name: widget.te[0].text,
                address: widget.te[3].text,
                area: widget.te[4].text,
                phone: int.parse(widget.te[1].text),
                password: widget.te[2].text,
                pincode: int.parse(widget.te[5].text));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Getotp(user: widget.user),
                ));
          },*/
          label: const Text('Sign UP')),
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
                text('Password'),
                tf(2, 'Password'),
                text('Address'),
                tf(3, 'Address'),
                text('Area'),
                tf(4, 'Area'),
                text('Pincode'),
                tf(5, 'Pincode')
              ]),
        ),
      ),
    );
  }
}
