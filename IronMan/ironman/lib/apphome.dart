import 'package:flutter/material.dart';
import 'package:ironman/order.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = ['gasdgfhah', 'l1dhgfsa'];
    return Scaffold(
      drawer: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Card(
              margin: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: MediaQuery.of(context).size.width / 1.7,
                  ),
                  const Text('Profile')
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Previous Order',
              style: TextStyle(
                color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Settings',
              style: TextStyle(
                color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Log Out',
              style: TextStyle(
                color: Color.fromARGB(255, 9, 75, 11),
                fontSize: 20,
              ),
            ),
          )
        ],
      )),
      appBar: AppBar(
        title: const Icon(
          Icons.iron_rounded,
          size: 50,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GridView(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.sizeOf(context).width / 3,
              ),
              children: [
                IconButton.filled(
                    color: Colors.amber,
                    onPressed: () {},
                    icon: Icon(Icons.abc)),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber),
                      foregroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {},
                  child: Icon(Icons.abc),
                ),
                ElevatedButton.icon(
                  label: Text('Data'),
                  onPressed: () {},
                  icon: Icon(Icons.abc),
                ),
                ElevatedButton.icon(
                  label: Text('Data'),
                  onPressed: () {},
                  icon: Icon(Icons.abc),
                ),
                ElevatedButton.icon(
                  label: Text('Data'),
                  onPressed: () {},
                  icon: Icon(Icons.abc),
                ),
                ElevatedButton.icon(
                  label: Text('Data'),
                  onPressed: () {},
                  icon: Icon(Icons.abc),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    hoverColor: const Color.fromARGB(255, 17, 65, 3),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Order(),
                          ));
                    },
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.iron_outlined, size: 100),
                          const SizedBox(
                            width: 25,
                          ),
                          Text(
                            list[index],
                            overflow: TextOverflow.clip,
                            style: const TextStyle(fontSize: 25),
                          )
                        ]),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
