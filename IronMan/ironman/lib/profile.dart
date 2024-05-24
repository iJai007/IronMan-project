import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ironman/SignupLogin/localData.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Map<String, String> data = {};
  bool editing = false;
  void getData() async {
    data = await LocalData().getUserData();
    setState(() {
      data;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> te;
    if (data.isNotEmpty) {
      te = List.generate(5, (index) {
        return TextEditingController(text: data.entries.elementAt(index).value);
      });
    } else {
      te = List.generate(5, (index) {
        return TextEditingController();
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: (data.isNotEmpty)
          ? Card(
              child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(15),
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Name',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: te[0],
                  enabled: editing,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.blueGrey))),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Phone',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: te[1],
                  enabled: editing,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.blueGrey))),
                ),
                /*const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Email',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          const TextField(),*/
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Address',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: te[2],
                  enabled: editing,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.blueGrey))),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Area',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: te[3],
                  enabled: editing,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.blueGrey))),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Pincode',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                TextField(
                  controller: te[4],
                  enabled: editing,
                  decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.blueGrey))),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: (editing)
                      ? Row(
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
                        )
                      : ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              editing = true;
                            });
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit')),
                )
              ],
            ))
          : const Center(
              child: Card(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text('Fetching Data')
                  ],
                ),
              ),
            ),
    );
  }
}
