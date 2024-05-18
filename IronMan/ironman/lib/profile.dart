import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Card(
          child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(15),
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Name',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          const TextField(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Phone',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          const TextField(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Email',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          const TextField(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Address',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          const TextField(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Area',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          const TextField(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.save_rounded),
                    label: const Text('Save')),
                ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.cancel_rounded),
                    label: const Text('Cancel'))
              ],
            ),
          )
        ],
      )),
    );
  }
}
